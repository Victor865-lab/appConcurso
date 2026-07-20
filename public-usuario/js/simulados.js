/**
 * Seção Simulados: gera um simulado com base em critérios escolhidos
 * pelo usuário, executa a prova (todas as questões na tela) e finaliza
 * com correção detalhada.
 */

let simuladoEmExecucao = null;
const respostasSimulado = {};

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('form-gerar-simulado').addEventListener('submit', gerarSimulado);
  document.getElementById('btn-cancelar-simulado').addEventListener('click', voltarParaListaSimulados);
  document.getElementById('btn-voltar-simulados').addEventListener('click', voltarParaListaSimulados);
  document.getElementById('btn-finalizar-simulado').addEventListener('click', finalizarSimulado);
});

async function carregarSimulados() {
  mostrarTelaSimulados('inicio');
  await carregarHistoricoSimulados();
}

function mostrarTelaSimulados(tela) {
  document.getElementById('simulados-inicio').classList.toggle('d-none', tela !== 'inicio');
  document.getElementById('simulados-execucao').classList.toggle('d-none', tela !== 'execucao');
  document.getElementById('simulados-resultado').classList.toggle('d-none', tela !== 'resultado');
}

async function carregarHistoricoSimulados() {
  const corpo = document.getElementById('corpo-tabela-simulados');
  const vazio = document.getElementById('simulados-vazio');

  try {
    const resposta = await API.get('/simulados');
    const simulados = resposta.dados;

    if (!simulados.length) {
      corpo.innerHTML = '';
      vazio.classList.remove('d-none');
      return;
    }
    vazio.classList.add('d-none');

    corpo.innerHTML = simulados.map((s) => {
      const criterios = [s.temaNome, s.banca, s.dificuldade ? LABEL_DIFICULDADE[s.dificuldade] : null].filter(Boolean).join(' · ') || 'Sem filtro';
      const statusHtml = s.status === 'finalizado'
        ? '<span class="selo-status selo-ativo">Finalizado</span>'
        : '<span class="selo-status selo-inativo">Em andamento</span>';
      return `
        <tr>
          <td>${new Date(s.criadoEm).toLocaleDateString('pt-BR')}</td>
          <td>${escaparHtml(criterios)}</td>
          <td>${s.totalQuestoes}</td>
          <td>${s.acertos ?? '—'}</td>
          <td>${statusHtml}</td>
          <td>${s.status === 'em_andamento' ? `<button class="btn btn-sm btn-outline-secondary" onclick="retomarSimulado(${s.id})">Retomar</button>` : ''}</td>
        </tr>
      `;
    }).join('');
  } catch (err) {
    mostrarToast('Erro ao carregar histórico de simulados.', 'erro');
  }
}

async function gerarSimulado(e) {
  e.preventDefault();
  const alerta = document.getElementById('alerta-simulado');
  alerta.classList.add('d-none');

  const payload = {
    idTema: document.getElementById('sim-tema').value || null,
    banca: document.getElementById('sim-banca').value || null,
    dificuldade: document.getElementById('sim-dificuldade').value || null,
    quantidade: Number(document.getElementById('sim-quantidade').value) || 10,
  };

  const btn = document.getElementById('btn-gerar-simulado');
  btn.disabled = true;

  try {
    const resposta = await API.post('/simulados', payload);
    iniciarExecucao(resposta.dados);
  } catch (err) {
    alerta.textContent = err.detalhes ? err.detalhes.map((e) => e.mensagem).join(' ') : err.message;
    alerta.classList.remove('d-none');
  } finally {
    btn.disabled = false;
  }
}

async function retomarSimulado(id) {
  try {
    const resposta = await API.get(`/simulados/${id}`);
    iniciarExecucao(resposta.dados);
  } catch (err) {
    mostrarToast('Não foi possível retomar este simulado.', 'erro');
  }
}

function iniciarExecucao(simulado) {
  simuladoEmExecucao = simulado;
  Object.keys(respostasSimulado).forEach((k) => delete respostasSimulado[k]);

  const lista = document.getElementById('lista-questoes-execucao');
  lista.innerHTML = simulado.questoes.map((q, indice) => `
    <div class="questao-execucao" id="execucao-questao-${q.id}">
      <div class="numero">Questão ${indice + 1} de ${simulado.questoes.length}
        ${q.banca ? ' · ' + escaparHtml(q.banca) : ''}${q.ano ? ' · ' + q.ano : ''}
      </div>
      <p>${escaparHtml(q.descricao)}</p>
      ${q.alternativas.map((alt) => `
        <div class="opcao-alternativa" data-questao="${q.id}" data-alt="${alt.id}" onclick="selecionarAlternativaExecucao(${q.id}, ${alt.id})">
          <span class="letra">${alt.letra}</span>
          <span>${escaparHtml(alt.descricaoAlt)}</span>
        </div>
      `).join('')}
    </div>
  `).join('');

  atualizarProgressoExecucao();
  mostrarTelaSimulados('execucao');
}

function selecionarAlternativaExecucao(idQuestao, idAlternativa) {
  respostasSimulado[idQuestao] = idAlternativa;
  document.querySelectorAll(`.opcao-alternativa[data-questao="${idQuestao}"]`).forEach((el) => {
    el.classList.toggle('selecionada', Number(el.dataset.alt) === idAlternativa);
  });
  atualizarProgressoExecucao();
}

function atualizarProgressoExecucao() {
  const total = simuladoEmExecucao?.questoes.length || 0;
  const respondidas = Object.keys(respostasSimulado).length;
  document.getElementById('execucao-progresso').textContent = `${respondidas} / ${total} respondidas`;
}

function voltarParaListaSimulados() {
  simuladoEmExecucao = null;
  mostrarTelaSimulados('inicio');
  carregarHistoricoSimulados();
}

async function finalizarSimulado() {
  if (!simuladoEmExecucao) return;

  const total = simuladoEmExecucao.questoes.length;
  const respondidas = Object.keys(respostasSimulado).length;

  if (respondidas < total) {
    const faltam = total - respondidas;
    if (!confirm(`Você ainda não respondeu ${faltam} questão(ões). Deseja finalizar mesmo assim?`)) return;
  }

  const payload = {
    respostas: Object.entries(respostasSimulado).map(([idQuestao, idAlternativa]) => ({
      idQuestao: Number(idQuestao),
      idAlternativa,
    })),
  };

  try {
    const resposta = await API.post(`/simulados/${simuladoEmExecucao.id}/finalizar`, payload);
    exibirResultado(resposta.dados);
    if (typeof carregarDashboard === 'function') carregarDashboard();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

function exibirResultado(resultado) {
  document.getElementById('resultado-acertos').textContent = resultado.acertos;
  document.getElementById('resultado-total').textContent = resultado.totalQuestoes;
  document.getElementById('resultado-pontos').textContent = resultado.pontosGanhos;

  const listaQuestoes = simuladoEmExecucao.questoes;
  const gabarito = document.getElementById('lista-gabarito');
  gabarito.innerHTML = resultado.resultadoDetalhado.map((r) => {
    const questao = listaQuestoes.find((q) => q.id === r.idQuestao);
    const altEscolhida = questao?.alternativas.find((a) => a.id === r.idAlternativaEscolhida);
    const altCorreta = questao?.alternativas.find((a) => a.id === r.idAlternativaCorreta);
    return `
      <div class="gabarito-item ${r.correta ? 'acertou' : 'errou'}">
        <p class="mb-1"><strong>${escaparHtml(questao?.descricao || '')}</strong></p>
        <small>Sua resposta: ${altEscolhida ? escaparHtml(altEscolhida.letra + ' - ' + altEscolhida.descricaoAlt) : '—'}</small><br>
        ${!r.correta ? `<small class="text-success">Correta: ${altCorreta ? escaparHtml(altCorreta.letra + ' - ' + altCorreta.descricaoAlt) : '—'}</small>` : ''}
      </div>
    `;
  }).join('');

  mostrarTelaSimulados('resultado');
}
