/**
 * Seção Dashboard: pontuação/nível (XP), sequência de acessos (streak),
 * gráfico de evolução, calendário estilo "heatmap" e conquistas.
 */

let graficoEvolucao = null;
let modoEvolucaoAtual = 'semanal';
let mapaAcessosCalendario = {};
let mesCalendarioAtual = new Date(new Date().getFullYear(), new Date().getMonth(), 1);
const MES_CALENDARIO_MAIS_ANTIGO = new Date(new Date().getFullYear(), new Date().getMonth() - 5, 1);

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.btn-modo-evolucao').forEach((btn) => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.btn-modo-evolucao').forEach((b) => b.classList.remove('ativo'));
      btn.classList.add('ativo');
      modoEvolucaoAtual = btn.dataset.modo;
      carregarGraficoEvolucao();
    });
  });

  document.getElementById('calendario-mes-anterior').addEventListener('click', () => {
    if (mesCalendarioAtual <= MES_CALENDARIO_MAIS_ANTIGO) return;
    mesCalendarioAtual = new Date(mesCalendarioAtual.getFullYear(), mesCalendarioAtual.getMonth() - 1, 1);
    renderizarCalendario();
  });
  document.getElementById('calendario-mes-proximo').addEventListener('click', () => {
    const mesAtualReal = new Date(new Date().getFullYear(), new Date().getMonth(), 1);
    if (mesCalendarioAtual >= mesAtualReal) return;
    mesCalendarioAtual = new Date(mesCalendarioAtual.getFullYear(), mesCalendarioAtual.getMonth() + 1, 1);
    renderizarCalendario();
  });
});

async function carregarDashboard() {
  try {
    const [resumoResp, calendarioResp] = await Promise.all([
      API.get('/progresso/resumo'),
      API.get('/progresso/calendario?dias=182'),
    ]);

    renderizarResumo(resumoResp.dados);

    mapaAcessosCalendario = {};
    calendarioResp.dados.forEach((d) => { mapaAcessosCalendario[d.data] = d.quantidade; });
    renderizarCalendario();

    renderizarBadges(resumoResp.dados.badges);
    await carregarGraficoEvolucao();
  } catch (err) {
    if (err.codigo === 'ASSINATURA_NECESSARIA') {
      exibirCadeadoAssinatura('secao-dashboard');
      return;
    }
    mostrarToast('Não foi possível carregar seu progresso.', 'erro');
  }
}

async function carregarGraficoEvolucao() {
  const dias = modoEvolucaoAtual === 'mensal' ? 365 : 56;
  try {
    const evolucaoResp = await API.get(`/progresso/evolucao?dias=${dias}`);
    renderizarGraficoEvolucao(evolucaoResp.dados, modoEvolucaoAtual);
  } catch (err) {
    mostrarToast('Não foi possível carregar o gráfico de evolução.', 'erro');
  }
}

function inicioDaSemana(data) {
  const d = new Date(data);
  const diaSemana = d.getDay();
  const diff = (diaSemana === 0 ? -6 : 1) - diaSemana; // segunda-feira como início da semana
  d.setDate(d.getDate() + diff);
  d.setHours(0, 0, 0, 0);
  return d;
}

function agruparPorSemana(dados, semanas = 8) {
  const mapa = {};
  dados.forEach((d) => {
    const chave = inicioDaSemana(d.dia).toISOString().slice(0, 10);
    if (!mapa[chave]) mapa[chave] = { total: 0, acertos: 0 };
    mapa[chave].total += d.total;
    mapa[chave].acertos += d.acertos;
  });

  const hoje = new Date();
  const buckets = [];
  for (let i = semanas - 1; i >= 0; i--) {
    const referencia = new Date(hoje);
    referencia.setDate(referencia.getDate() - i * 7);
    const chave = inicioDaSemana(referencia).toISOString().slice(0, 10);
    const valores = mapa[chave] || { total: 0, acertos: 0 };
    buckets.push({
      label: new Date(`${chave}T00:00:00`).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit' }),
      ...valores,
    });
  }
  return buckets;
}

function agruparPorMes(dados, meses = 6) {
  const mapa = {};
  dados.forEach((d) => {
    const data = new Date(d.dia);
    const chave = `${data.getFullYear()}-${String(data.getMonth() + 1).padStart(2, '0')}`;
    if (!mapa[chave]) mapa[chave] = { total: 0, acertos: 0 };
    mapa[chave].total += d.total;
    mapa[chave].acertos += d.acertos;
  });

  const hoje = new Date();
  const buckets = [];
  for (let i = meses - 1; i >= 0; i--) {
    const referencia = new Date(hoje.getFullYear(), hoje.getMonth() - i, 1);
    const chave = `${referencia.getFullYear()}-${String(referencia.getMonth() + 1).padStart(2, '0')}`;
    const valores = mapa[chave] || { total: 0, acertos: 0 };
    const label = referencia.toLocaleDateString('pt-BR', { month: 'short', year: '2-digit' }).replace('.', '');
    buckets.push({ label, ...valores });
  }
  return buckets;
}

function renderizarResumo(dados) {
  document.getElementById('stat-pontos').textContent = dados.pontos;
  document.getElementById('stat-streak').textContent = dados.streakAtual;
  document.getElementById('stat-taxa').textContent = `${dados.taxaAcerto}%`;
  document.getElementById('stat-respondidas').textContent = dados.totalRespondidas;

  document.getElementById('topbar-streak-numero').textContent = dados.streakAtual;

  // Cartão de XP na barra lateral
  document.getElementById('sidebar-nivel-nome').textContent = dados.nivel.nome;
  document.getElementById('sidebar-nivel-num').textContent = `Nv. ${dados.nivel.nivel}`;
  const percentual = dados.nivel.pontosParaProximoNivel === 0
    ? 100
    : Math.round(((100 - dados.nivel.pontosParaProximoNivel) / 100) * 100);
  document.getElementById('sidebar-barra-xp').style.width = `${Math.max(percentual, 4)}%`;
  document.getElementById('sidebar-xp-texto').textContent = dados.nivel.proximoNivelNome
    ? `${dados.nivel.pontosParaProximoNivel} pontos para ${dados.nivel.proximoNivelNome}`
    : `${dados.pontos} pontos — nível máximo!`;
}

function renderizarGraficoEvolucao(dadosBrutos, modo) {
  const buckets = modo === 'mensal' ? agruparPorMes(dadosBrutos, 6) : agruparPorSemana(dadosBrutos, 8);
  const ctx = document.getElementById('grafico-evolucao');

  const config = {
    labels: buckets.map((b) => b.label),
    datasets: [
      { label: 'Respondidas', data: buckets.map((b) => b.total), backgroundColor: 'rgba(15,118,110,0.7)', borderRadius: 6, maxBarThickness: 36 },
      { label: 'Acertos', data: buckets.map((b) => b.acertos), backgroundColor: 'rgba(245,158,11,0.8)', borderRadius: 6, maxBarThickness: 36 },
    ],
  };

  if (graficoEvolucao) {
    graficoEvolucao.data = config;
    graficoEvolucao.update();
    return;
  }

  graficoEvolucao = new Chart(ctx, {
    type: 'bar',
    data: config,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      interaction: { mode: 'index', intersect: false },
      scales: { y: { beginAtZero: true, ticks: { precision: 0 } } },
    },
  });
}

function nivelAcesso(quantidade) {
  return quantidade === 0 ? 0 : quantidade === 1 ? 1 : quantidade <= 3 ? 2 : quantidade <= 6 ? 3 : 4;
}

function dataParaChave(data) {
  const y = data.getFullYear();
  const m = String(data.getMonth() + 1).padStart(2, '0');
  const d = String(data.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

function renderizarCalendario() {
  const titulo = document.getElementById('calendario-normal-titulo');
  const grid = document.getElementById('calendario-normal-grid');
  const btnAnterior = document.getElementById('calendario-mes-anterior');
  const btnProximo = document.getElementById('calendario-mes-proximo');

  const ano = mesCalendarioAtual.getFullYear();
  const mes = mesCalendarioAtual.getMonth();
  titulo.textContent = mesCalendarioAtual.toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' });

  btnAnterior.disabled = mesCalendarioAtual <= MES_CALENDARIO_MAIS_ANTIGO;
  const mesAtualReal = new Date(new Date().getFullYear(), new Date().getMonth(), 1);
  btnProximo.disabled = mesCalendarioAtual >= mesAtualReal;

  const primeiroDiaSemana = new Date(ano, mes, 1).getDay();
  const totalDiasNoMes = new Date(ano, mes + 1, 0).getDate();
  const hojeChave = dataParaChave(new Date());

  let html = '';
  for (let i = 0; i < primeiroDiaSemana; i++) {
    html += '<div class="calendario-normal-dia fora-do-mes"></div>';
  }

  for (let dia = 1; dia <= totalDiasNoMes; dia++) {
    const dataDia = new Date(ano, mes, dia);
    const chave = dataParaChave(dataDia);
    const quantidade = mapaAcessosCalendario[chave] || 0;
    const nivel = nivelAcesso(quantidade);
    const ehHoje = chave === hojeChave;
    html += `
      <div class="calendario-normal-dia nivel-${nivel}${ehHoje ? ' hoje' : ''}" title="${dataDia.toLocaleDateString('pt-BR')} — ${quantidade} acesso(s)">
        ${dia}
      </div>
    `;
  }

  grid.innerHTML = html;
}

function renderizarBadges(badges) {
  const container = document.getElementById('grid-badges');
  container.innerHTML = badges.map((b) => `
    <div class="badge-card ${b.desbloqueada ? 'desbloqueada' : 'bloqueada'}">
      <i class="bi ${b.icone}"></i>
      <strong>${escaparHtml(b.nome)}</strong>
      <small>${escaparHtml(b.descricao)}</small>
    </div>
  `).join('');
}
