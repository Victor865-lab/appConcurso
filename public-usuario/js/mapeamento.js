/**
 * Seção Mapeamento: feed estilo "reels" — questões em tela quase cheia,
 * uma por vez, navegadas por scroll (scroll-snap), com filtro fixo no
 * topo e resposta direta por alternativa (sem modal).
 */

const ESTADO_MAPA = {
  pagina: 1, limite: 6, busca: '', idTema: '', banca: '', ano: '', dificuldade: '',
  carregando: false, temMais: true, totalCarregado: 0,
};

const LABEL_DIFICULDADE = { facil: 'Fácil', medio: 'Médio', dificil: 'Difícil' };
const detalhesQuestaoCache = {};
const detalhesEmCarregamento = new Set();
const questoesRespondendoAgora = new Set();
const comentariosCarregados = new Set();

let observadorReels = null;
let modalDenuncia = null;
let idQuestaoDenunciada = null;

document.addEventListener('DOMContentLoaded', () => {
  modalDenuncia = new bootstrap.Modal(document.getElementById('modalDenuncia'));
  document.getElementById('btn-enviar-denuncia').addEventListener('click', enviarDenuncia);

  // Delegação: os campos de comentário são criados dinamicamente por questão.
  document.getElementById('reels-mapa').addEventListener('keydown', (e) => {
    if (e.key !== 'Enter' || !e.target.matches('[id^="reel-comentario-input-"]')) return;
    enviarComentario(Number(e.target.id.replace('reel-comentario-input-', '')));
  });

  document.getElementById('filtro-tema').addEventListener('change', (e) => { ESTADO_MAPA.idTema = e.target.value; reiniciarFeedMapeamento(); });
  document.getElementById('filtro-banca').addEventListener('change', (e) => { ESTADO_MAPA.banca = e.target.value; reiniciarFeedMapeamento(); });
  document.getElementById('filtro-ano').addEventListener('change', (e) => { ESTADO_MAPA.ano = e.target.value; reiniciarFeedMapeamento(); });
  document.getElementById('filtro-dificuldade').addEventListener('change', (e) => { ESTADO_MAPA.dificuldade = e.target.value; reiniciarFeedMapeamento(); });

  document.getElementById('btn-limpar-filtros-mapa').addEventListener('click', () => {
    ['filtro-tema', 'filtro-banca', 'filtro-ano', 'filtro-dificuldade'].forEach((id) => document.getElementById(id).value = '');
    document.getElementById('busca-mapa').value = '';
    Object.assign(ESTADO_MAPA, { busca: '', idTema: '', banca: '', ano: '', dificuldade: '' });
    reiniciarFeedMapeamento();
  });

  document.getElementById('btn-filtrar-mapa').addEventListener('click', () => {
    ESTADO_MAPA.busca = document.getElementById('busca-mapa').value.trim();
    reiniciarFeedMapeamento();
  });

  let debounce;
  document.getElementById('busca-mapa').addEventListener('input', (e) => {
    clearTimeout(debounce);
    debounce = setTimeout(() => { ESTADO_MAPA.busca = e.target.value.trim(); reiniciarFeedMapeamento(); }, 350);
  });
  document.getElementById('busca-mapa').addEventListener('keydown', (e) => {
    if (e.key !== 'Enter') return;
    clearTimeout(debounce);
    ESTADO_MAPA.busca = e.target.value.trim();
    reiniciarFeedMapeamento();
  });
});

async function inicializarFiltrosMapeamento() {
  try {
    const [temasResp, filtrosResp] = await Promise.all([API.get('/temas'), API.get('/questoes/filtros')]);

    const selectTema = document.getElementById('filtro-tema');
    temasResp.dados.forEach((t) => selectTema.insertAdjacentHTML('beforeend', `<option value="${t.id}">${escaparHtml(t.nome)}</option>`));

    const selectBanca = document.getElementById('filtro-banca');
    filtrosResp.dados.bancas.forEach((b) => selectBanca.insertAdjacentHTML('beforeend', `<option value="${escaparHtml(b)}">${escaparHtml(b)}</option>`));

    const selectAno = document.getElementById('filtro-ano');
    filtrosResp.dados.anos.forEach((a) => selectAno.insertAdjacentHTML('beforeend', `<option value="${a}">${a}</option>`));

    // Reaproveita os mesmos dados para popular os selects da aba de Simulados
    const selectSimTema = document.getElementById('sim-tema');
    const selectSimBanca = document.getElementById('sim-banca');
    if (selectSimTema && selectSimTema.children.length <= 1) {
      temasResp.dados.forEach((t) => selectSimTema.insertAdjacentHTML('beforeend', `<option value="${t.id}">${escaparHtml(t.nome)}</option>`));
      filtrosResp.dados.bancas.forEach((b) => selectSimBanca.insertAdjacentHTML('beforeend', `<option value="${escaparHtml(b)}">${escaparHtml(b)}</option>`));
    }
  } catch (err) {
    // Silencioso: os filtros continuam funcionais sem as opções extras.
  }
}

function obterObservadorReels() {
  if (observadorReels) return observadorReels;
  observadorReels = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      const el = entry.target;
      const idQuestao = Number(el.dataset.id);
      carregarDetalheSlide(idQuestao);

      const indice = Number(el.dataset.indice);
      if (indice >= ESTADO_MAPA.totalCarregado - 2) carregarProximaPaginaMapa();
    });
  }, { root: document.getElementById('reels-mapa'), rootMargin: '100% 0px', threshold: 0.01 });
  return observadorReels;
}

async function carregarMapeamento() {
  await reiniciarFeedMapeamento();
}

async function reiniciarFeedMapeamento() {
  if (observadorReels) observadorReels.disconnect();
  document.getElementById('reels-mapa').innerHTML = '';
  document.getElementById('mapa-vazio').classList.add('d-none');
  Object.assign(ESTADO_MAPA, { pagina: 1, temMais: true, totalCarregado: 0 });
  await carregarProximaPaginaMapa();
}

async function carregarProximaPaginaMapa() {
  if (ESTADO_MAPA.carregando || !ESTADO_MAPA.temMais) return;
  ESTADO_MAPA.carregando = true;

  const loading = document.getElementById('mapa-loading');
  loading.classList.remove('d-none');

  const params = new URLSearchParams({
    pagina: ESTADO_MAPA.pagina, limite: ESTADO_MAPA.limite, ativo: 'true',
    priorizarNaoRespondidas: 'true',
  });
  if (ESTADO_MAPA.busca) params.set('palavraChave', ESTADO_MAPA.busca);
  if (ESTADO_MAPA.idTema) params.set('idTema', ESTADO_MAPA.idTema);
  if (ESTADO_MAPA.banca) params.set('banca', ESTADO_MAPA.banca);
  if (ESTADO_MAPA.ano) params.set('ano', ESTADO_MAPA.ano);
  if (ESTADO_MAPA.dificuldade) params.set('dificuldade', ESTADO_MAPA.dificuldade);

  try {
    const resposta = await API.get(`/questoes?${params.toString()}`);
    const { registros, paginacao } = resposta.dados;

    if (ESTADO_MAPA.pagina === 1 && !registros.length) {
      document.getElementById('mapa-vazio').classList.remove('d-none');
      ESTADO_MAPA.temMais = false;
      return;
    }

    ESTADO_MAPA.temMais = ESTADO_MAPA.pagina < paginacao.totalPaginas;

    let statusMapa = {};
    try {
      const statusResp = await API.get(`/respostas/status?ids=${registros.map((q) => q.id).join(',')}`);
      statusMapa = statusResp.dados;
    } catch (e) { /* segue sem status se falhar */ }

    const container = document.getElementById('reels-mapa');
    const observer = obterObservadorReels();
    registros.forEach((q) => {
      const indice = ESTADO_MAPA.totalCarregado++;
      container.insertAdjacentHTML('beforeend', renderizarSlide(q, statusMapa[q.id], indice));
      observer.observe(document.getElementById(`reel-questao-${q.id}`));
    });

    ESTADO_MAPA.pagina += 1;
  } catch (err) {
    if (err.codigo === 'ASSINATURA_NECESSARIA') {
      ESTADO_MAPA.temMais = false;
      exibirCadeadoAssinatura('secao-mapeamento');
      return;
    }
    mostrarToast('Erro ao carregar questões.', 'erro');
  } finally {
    loading.classList.add('d-none');
    ESTADO_MAPA.carregando = false;
  }
}

function statusBadgeHtml(jaRespondeu, jaAcertou) {
  if (!jaRespondeu) return '<span class="status-resposta status-nao-respondida"><i class="bi bi-circle"></i> Não respondida</span>';
  return jaAcertou
    ? '<span class="status-resposta status-acertou"><i class="bi bi-check-circle-fill"></i> Já acertou</span>'
    : '<span class="status-resposta status-errou"><i class="bi bi-x-circle-fill"></i> Ainda não acertou</span>';
}

function renderizarSlide(q, status, indice) {
  const jaRespondeu = !!status;
  const jaAcertou = !!status?.acertouAlgumaVez;
  return `
    <article class="reel-questao" id="reel-questao-${q.id}" data-id="${q.id}" data-indice="${indice}" data-ja-respondeu="${jaRespondeu}" data-ja-acertou="${jaAcertou}">
      <div class="reel-tags">
        ${q.temaNome ? `<span class="tag-mini">${escaparHtml(q.temaNome)}</span>` : ''}
        ${q.banca ? `<span class="tag-mini">${escaparHtml(q.banca)}</span>` : ''}
        ${q.ano ? `<span class="tag-mini">${q.ano}</span>` : ''}
        ${q.dificuldade ? `<span class="tag-mini tag-dificuldade-${q.dificuldade}">${LABEL_DIFICULDADE[q.dificuldade]}</span>` : ''}
        <span class="status-badge-slot">${statusBadgeHtml(jaRespondeu, jaAcertou)}</span>
      </div>
      <p class="reel-enunciado">${escaparHtml(q.descricao)}</p>
      <div class="reel-alternativas" id="reel-alt-${q.id}">
        <div class="reel-esqueleto"><div class="spinner-border spinner-border-sm"></div> Carregando alternativas...</div>
      </div>

      <div class="reel-rodape">
        <button type="button" class="btn-reel-acao btn-reel-denuncia" onclick="abrirDenuncia(${q.id})"><i class="bi bi-flag"></i> Reportar erro</button>
        <button type="button" class="btn-reel-acao" onclick="alternarComentarios(${q.id})"><i class="bi bi-chat-dots"></i> Comentários</button>
      </div>
      <div class="reel-comentarios d-none" id="reel-comentarios-${q.id}">
        <div class="reel-comentarios-lista" id="reel-comentarios-lista-${q.id}"></div>
        <div class="reel-comentario-form">
          <input type="text" maxlength="500" placeholder="Comente sobre essa questão..." id="reel-comentario-input-${q.id}">
          <button type="button" onclick="enviarComentario(${q.id})"><i class="bi bi-send-fill"></i></button>
        </div>
      </div>

      <div class="reel-dica-scroll"><i class="bi bi-chevron-double-down"></i> Continue rolando para a próxima questão</div>
    </article>
  `;
}

async function carregarDetalheSlide(idQuestao) {
  const container = document.getElementById(`reel-alt-${idQuestao}`);
  if (!container) return;

  if (detalhesQuestaoCache[idQuestao]) {
    renderizarAlternativasSlide(idQuestao, detalhesQuestaoCache[idQuestao]);
    return;
  }
  if (detalhesEmCarregamento.has(idQuestao)) return;

  detalhesEmCarregamento.add(idQuestao);
  try {
    const resposta = await API.get(`/questoes/${idQuestao}`);
    detalhesQuestaoCache[idQuestao] = resposta.dados;
    renderizarAlternativasSlide(idQuestao, resposta.dados);
  } catch (err) {
    container.innerHTML = '<p class="text-danger small mb-0">Não foi possível carregar as alternativas.</p>';
  } finally {
    detalhesEmCarregamento.delete(idQuestao);
  }
}

function renderizarAlternativasSlide(idQuestao, dados) {
  const container = document.getElementById(`reel-alt-${idQuestao}`);
  if (!container) return;
  container.innerHTML = dados.alternativas.map((alt) => `
    <div class="opcao-alternativa" data-questao="${idQuestao}" data-alt="${alt.id}" onclick="responderReel(${idQuestao}, ${alt.id})">
      <span class="letra">${alt.letra}</span>
      <span>${escaparHtml(alt.descricaoAlt)}</span>
    </div>
  `).join('');
}

async function responderReel(idQuestao, idAlternativa) {
  const slide = document.getElementById(`reel-questao-${idQuestao}`);
  if (!slide || slide.dataset.travada === 'true' || questoesRespondendoAgora.has(idQuestao)) return;

  questoesRespondendoAgora.add(idQuestao);
  try {
    const resposta = await API.post('/respostas', { idQuestao, idAlternativa });

    slide.dataset.travada = 'true';
    slide.querySelectorAll('.opcao-alternativa').forEach((el) => {
      el.onclick = null;
      const id = Number(el.dataset.alt);
      if (id === resposta.dados.idAlternativaCorreta) el.classList.add('correta');
      else if (id === idAlternativa) el.classList.add('incorreta');
    });

    slide.dataset.jaRespondeu = 'true';
    if (resposta.dados.correta) slide.dataset.jaAcertou = 'true';
    const badgeSlot = slide.querySelector('.status-badge-slot');
    badgeSlot.innerHTML = statusBadgeHtml(true, slide.dataset.jaAcertou === 'true');

    mostrarToast(
      resposta.dados.correta ? `Certinho! +${resposta.dados.pontosGanhos} pontos` : 'Não foi dessa vez — continue tentando!',
      resposta.dados.correta ? 'sucesso' : 'info'
    );

    if (typeof carregarDashboard === 'function') carregarDashboard();
  } catch (err) {
    if (err.codigo === 'ASSINATURA_NECESSARIA') {
      mostrarToast('Responder questões é exclusivo para assinantes. Veja os planos disponíveis.', 'info');
      irParaAssinatura();
      return;
    }
    mostrarToast(err.message, 'erro');
  } finally {
    questoesRespondendoAgora.delete(idQuestao);
  }
}

function abrirDenuncia(idQuestao) {
  idQuestaoDenunciada = idQuestao;
  document.getElementById('denuncia-motivo').value = '';
  modalDenuncia.show();
}

async function enviarDenuncia() {
  const motivo = document.getElementById('denuncia-motivo').value.trim();
  if (!motivo) {
    mostrarToast('Descreva o problema antes de enviar.', 'info');
    return;
  }

  try {
    await API.post('/denuncias', { idQuestao: idQuestaoDenunciada, motivo });
    mostrarToast('Denúncia enviada! Nossa equipe vai revisar essa questão.', 'sucesso');
    modalDenuncia.hide();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

function alternarComentarios(idQuestao) {
  const painel = document.getElementById(`reel-comentarios-${idQuestao}`);
  const estavaFechado = painel.classList.contains('d-none');
  painel.classList.toggle('d-none');
  if (estavaFechado && !comentariosCarregados.has(idQuestao)) carregarComentarios(idQuestao);
}

async function carregarComentarios(idQuestao) {
  const lista = document.getElementById(`reel-comentarios-lista-${idQuestao}`);
  lista.innerHTML = '<div class="reel-esqueleto"><div class="spinner-border spinner-border-sm"></div> Carregando comentários...</div>';
  try {
    const resposta = await API.get(`/comentarios?idQuestao=${idQuestao}`);
    comentariosCarregados.add(idQuestao);
    renderizarComentarios(idQuestao, resposta.dados);
  } catch (err) {
    lista.innerHTML = '<p class="text-danger small mb-0">Não foi possível carregar os comentários.</p>';
  }
}

function formatarDataHoraComentario(iso) {
  return new Date(iso).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', hour: '2-digit', minute: '2-digit' });
}

function renderizarComentarios(idQuestao, comentarios) {
  const lista = document.getElementById(`reel-comentarios-lista-${idQuestao}`);
  if (!comentarios.length) {
    lista.innerHTML = '<p class="reel-comentario-vazio">Nenhum comentário ainda. Seja o primeiro a comentar!</p>';
    return;
  }
  lista.innerHTML = comentarios.map((c) => `
    <div class="reel-comentario">
      <strong>${escaparHtml(c.usuarioNome)}</strong><span class="reel-comentario-data">${formatarDataHoraComentario(c.criadoEm)}</span>
      <p>${escaparHtml(c.texto)}</p>
    </div>
  `).join('');
  lista.scrollTop = lista.scrollHeight;
}

async function enviarComentario(idQuestao) {
  const input = document.getElementById(`reel-comentario-input-${idQuestao}`);
  const texto = input.value.trim();
  if (!texto) return;

  try {
    const resposta = await API.post('/comentarios', { idQuestao, texto });
    input.value = '';

    const lista = document.getElementById(`reel-comentarios-lista-${idQuestao}`);
    const vazio = lista.querySelector('.reel-comentario-vazio');
    if (vazio) vazio.remove();
    lista.insertAdjacentHTML('beforeend', `
      <div class="reel-comentario">
        <strong>${escaparHtml(resposta.dados.usuarioNome)}</strong><span class="reel-comentario-data">${formatarDataHoraComentario(resposta.dados.criadoEm)}</span>
        <p>${escaparHtml(texto)}</p>
      </div>
    `);
    lista.scrollTop = lista.scrollHeight;
    comentariosCarregados.add(idQuestao);
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}
