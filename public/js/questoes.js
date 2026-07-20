/**
 * Seção Questões: listagem com busca/filtros/paginação e
 * cadastro/edição transacional de questão + alternativas.
 */

const ESTADO_QUESTOES = {
  pagina: 1,
  limite: 10,
  busca: '',
  ativo: '',
  respondida: '',
  contadorAlternativas: 0,
};

let modalQuestao = null;
let modalConfirmar = null;
let acaoConfirmada = null;

document.addEventListener('DOMContentLoaded', () => {
  modalQuestao = new bootstrap.Modal(document.getElementById('modalQuestao'));
  modalConfirmar = new bootstrap.Modal(document.getElementById('modalConfirmar'));

  document.getElementById('btn-nova-questao').addEventListener('click', abrirModalNovaQuestao);
  document.getElementById('btn-add-alternativa').addEventListener('click', () => adicionarLinhaAlternativa());
  document.getElementById('btn-salvar-questao').addEventListener('click', salvarQuestao);
  document.getElementById('btn-novo-tema').addEventListener('click', criarTemaRapido);
  document.getElementById('btn-confirmar-acao').addEventListener('click', () => {
    if (acaoConfirmada) acaoConfirmada();
    modalConfirmar.hide();
  });

  carregarTemasNoSelect();

  document.getElementById('filtro-ativo').addEventListener('change', (e) => {
    ESTADO_QUESTOES.ativo = e.target.value;
    ESTADO_QUESTOES.pagina = 1;
    carregarQuestoes();
  });
  document.getElementById('filtro-respondida').addEventListener('change', (e) => {
    ESTADO_QUESTOES.respondida = e.target.value;
    ESTADO_QUESTOES.pagina = 1;
    carregarQuestoes();
  });
  document.getElementById('btn-limpar-filtros').addEventListener('click', () => {
    document.getElementById('filtro-ativo').value = '';
    document.getElementById('filtro-respondida').value = '';
    document.getElementById('busca-questao').value = '';
    ESTADO_QUESTOES.ativo = '';
    ESTADO_QUESTOES.respondida = '';
    ESTADO_QUESTOES.busca = '';
    ESTADO_QUESTOES.pagina = 1;
    carregarQuestoes();
  });

  let debounceBusca;
  document.getElementById('busca-questao').addEventListener('input', (e) => {
    clearTimeout(debounceBusca);
    debounceBusca = setTimeout(() => {
      ESTADO_QUESTOES.busca = e.target.value.trim();
      ESTADO_QUESTOES.pagina = 1;
      carregarQuestoes();
    }, 350);
  });
});

async function carregarTemasNoSelect() {
  const select = document.getElementById('questao-tema');
  try {
    const resposta = await API.get('/temas');
    const valorAtual = select.value;
    select.innerHTML = '<option value="">Nenhum</option>' +
      resposta.dados.map((t) => `<option value="${t.id}">${escaparHtml(t.nome)}</option>`).join('');
    select.value = valorAtual;
  } catch (err) {
    // Segue sem lista de temas se a chamada falhar; o campo continua opcional.
  }
}

async function criarTemaRapido() {
  const nome = prompt('Nome do novo tema:');
  if (!nome || !nome.trim()) return;

  try {
    const resposta = await API.post('/temas', { nome: nome.trim() });
    await carregarTemasNoSelect();
    document.getElementById('questao-tema').value = resposta.dados.id;
    mostrarToast('Tema criado com sucesso.', 'sucesso');
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

async function carregarQuestoes() {
  const corpo = document.getElementById('corpo-tabela-questoes');
  const vazio = document.getElementById('questoes-vazio');
  const loading = document.getElementById('questoes-loading');

  loading.classList.remove('d-none');
  vazio.classList.add('d-none');
  corpo.innerHTML = '';

  const params = new URLSearchParams({
    pagina: ESTADO_QUESTOES.pagina,
    limite: ESTADO_QUESTOES.limite,
  });
  if (ESTADO_QUESTOES.ativo) params.set('ativo', ESTADO_QUESTOES.ativo);
  if (ESTADO_QUESTOES.respondida) params.set('respondida', ESTADO_QUESTOES.respondida);
  if (ESTADO_QUESTOES.busca) params.set('palavraChave', ESTADO_QUESTOES.busca);

  try {
    const resposta = await API.get(`/questoes?${params.toString()}`);
    const { registros, paginacao } = resposta.dados;

    loading.classList.add('d-none');

    if (!registros.length) {
      vazio.classList.remove('d-none');
      renderizarPaginacaoQuestoes({ pagina: 1, totalPaginas: 1 });
      return;
    }

    renderizarTabelaQuestoes(registros);
    renderizarPaginacaoQuestoes(paginacao);
  } catch (err) {
    loading.classList.add('d-none');
    mostrarToast('Erro ao carregar questões.', 'erro');
  }
}

function renderizarTabelaQuestoes(registros) {
  const corpo = document.getElementById('corpo-tabela-questoes');
  corpo.innerHTML = registros.map((q) => `
    <tr>
      <td><span class="protocolo-badge">#${String(q.id).padStart(4, '0')}</span></td>
      <td>${q.referencia ? escaparHtml(q.referencia) : '<span class="text-muted">—</span>'}</td>
      <td><span class="descricao-truncada" title="${escaparHtml(q.descricao)}">${escaparHtml(q.descricao)}</span></td>
      <td>
        <span class="selo-status ${q.ativo ? 'selo-ativo' : 'selo-inativo'}">${q.ativo ? 'Ativa' : 'Inativa'}</span>
        <span class="selo-status ${q.respondida ? 'selo-respondida' : 'selo-pendente'}">${q.respondida ? 'Respondida' : 'Pendente'}</span>
      </td>
      <td class="acoes-linha">
        <button title="Editar" onclick="abrirModalEditarQuestao(${q.id})"><i class="bi bi-pencil"></i></button>
        <button title="${q.ativo ? 'Desativar' : 'Ativar'}" onclick="alternarStatusQuestao(${q.id}, 'ativo', ${q.ativo})"><i class="bi ${q.ativo ? 'bi-toggle-on' : 'bi-toggle-off'}"></i></button>
        <button title="${q.respondida ? 'Desmarcar respondida' : 'Marcar respondida'}" onclick="alternarStatusQuestao(${q.id}, 'respondida', ${q.respondida})"><i class="bi bi-check2-square"></i></button>
        <button class="acao-excluir" title="Excluir" onclick="pedirConfirmacaoExclusaoQuestao(${q.id})"><i class="bi bi-trash"></i></button>
      </td>
    </tr>
  `).join('');
}

function renderizarPaginacaoQuestoes(paginacao) {
  const ul = document.getElementById('paginacao-questoes');
  const { pagina, totalPaginas } = paginacao;
  let html = '';

  html += `<li class="page-item ${pagina <= 1 ? 'disabled' : ''}">
    <button class="page-link" onclick="mudarPaginaQuestoes(${pagina - 1})">Anterior</button></li>`;

  for (let i = 1; i <= totalPaginas; i++) {
    html += `<li class="page-item ${i === pagina ? 'active' : ''}">
      <button class="page-link" onclick="mudarPaginaQuestoes(${i})">${i}</button></li>`;
  }

  html += `<li class="page-item ${pagina >= totalPaginas ? 'disabled' : ''}">
    <button class="page-link" onclick="mudarPaginaQuestoes(${pagina + 1})">Próxima</button></li>`;

  ul.innerHTML = html;
}

function mudarPaginaQuestoes(pagina) {
  ESTADO_QUESTOES.pagina = pagina;
  carregarQuestoes();
}

/* ============ MODAL DE CADASTRO/EDIÇÃO ============ */

function abrirModalNovaQuestao() {
  document.getElementById('modalQuestaoTitulo').textContent = 'Nova questão';
  document.getElementById('questao-id').value = '';
  document.getElementById('questao-referencia').value = '';
  document.getElementById('questao-descricao').value = '';
  document.getElementById('questao-ativo').checked = true;
  document.getElementById('questao-tema').value = '';
  document.getElementById('questao-banca').value = '';
  document.getElementById('questao-ano').value = '';
  document.getElementById('questao-dificuldade').value = '';
  document.getElementById('lista-alternativas').innerHTML = '';
  document.getElementById('alerta-questao').classList.add('d-none');
  ESTADO_QUESTOES.contadorAlternativas = 0;

  adicionarLinhaAlternativa('A');
  adicionarLinhaAlternativa('B');

  modalQuestao.show();
}

async function abrirModalEditarQuestao(id) {
  try {
    const resposta = await API.get(`/questoes/${id}`);
    const q = resposta.dados;

    document.getElementById('modalQuestaoTitulo').textContent = `Editar questão #${String(q.id).padStart(4, '0')}`;
    document.getElementById('questao-id').value = q.id;
    document.getElementById('questao-referencia').value = q.referencia || '';
    document.getElementById('questao-descricao').value = q.descricao;
    document.getElementById('questao-ativo').checked = !!q.ativo;
    document.getElementById('questao-tema').value = q.idTema || '';
    document.getElementById('questao-banca').value = q.banca || '';
    document.getElementById('questao-ano').value = q.ano || '';
    document.getElementById('questao-dificuldade').value = q.dificuldade || '';
    document.getElementById('lista-alternativas').innerHTML = '';
    document.getElementById('alerta-questao').classList.add('d-none');
    ESTADO_QUESTOES.contadorAlternativas = 0;

    q.alternativas.forEach((alt) => adicionarLinhaAlternativa(alt.letra, alt.descricaoAlt, alt.correta));

    modalQuestao.show();
  } catch (err) {
    mostrarToast('Não foi possível carregar a questão selecionada.', 'erro');
  }
}

const LETRAS_DISPONIVEIS = ['A', 'B', 'C', 'D', 'E'];

function adicionarLinhaAlternativa(letra, texto = '', correta = false) {
  const lista = document.getElementById('lista-alternativas');
  const linhasAtuais = lista.querySelectorAll('.linha-alternativa').length;

  if (linhasAtuais >= 5) {
    mostrarToast('Uma questão pode ter no máximo 5 alternativas (A a E).', 'info');
    return;
  }

  const letraFinal = letra || LETRAS_DISPONIVEIS[linhasAtuais];
  const idLinha = `alt-${ESTADO_QUESTOES.contadorAlternativas++}`;

  const div = document.createElement('div');
  div.className = 'linha-alternativa';
  div.id = idLinha;
  div.innerHTML = `
    <span class="letra-alt">${letraFinal}</span>
    <textarea rows="1" placeholder="Texto da alternativa">${escaparHtml(texto)}</textarea>
    <label class="correta-check">
      <input type="radio" name="alternativa-correta" ${correta ? 'checked' : ''}>
      Correta
    </label>
    <button type="button" class="btn-remover-alt" onclick="removerLinhaAlternativa('${idLinha}')" title="Remover">
      <i class="bi bi-x-lg"></i>
    </button>
  `;
  lista.appendChild(div);
}

function removerLinhaAlternativa(idLinha) {
  const lista = document.getElementById('lista-alternativas');
  if (lista.querySelectorAll('.linha-alternativa').length <= 2) {
    mostrarToast('A questão precisa de ao menos 2 alternativas.', 'info');
    return;
  }
  document.getElementById(idLinha)?.remove();
  reatribuirLetras();
}

function reatribuirLetras() {
  const linhas = document.querySelectorAll('#lista-alternativas .linha-alternativa');
  linhas.forEach((linha, indice) => {
    linha.querySelector('.letra-alt').textContent = LETRAS_DISPONIVEIS[indice];
  });
}

function coletarAlternativasDoForm() {
  const linhas = document.querySelectorAll('#lista-alternativas .linha-alternativa');
  return Array.from(linhas).map((linha, indice) => ({
    letra: LETRAS_DISPONIVEIS[indice],
    descricaoAlt: linha.querySelector('textarea').value.trim(),
    correta: linha.querySelector('input[type="radio"]').checked,
  }));
}

async function salvarQuestao() {
  const alerta = document.getElementById('alerta-questao');
  alerta.classList.add('d-none');

  const id = document.getElementById('questao-id').value;
  const descricao = document.getElementById('questao-descricao').value.trim();
  const referencia = document.getElementById('questao-referencia').value.trim();
  const ativo = document.getElementById('questao-ativo').checked;
  const idTema = document.getElementById('questao-tema').value;
  const banca = document.getElementById('questao-banca').value.trim();
  const ano = document.getElementById('questao-ano').value;
  const dificuldade = document.getElementById('questao-dificuldade').value;
  const alternativas = coletarAlternativasDoForm();

  if (!descricao) {
    return exibirErroModalQuestao('A descrição da questão é obrigatória.');
  }
  if (alternativas.some((a) => !a.descricaoAlt)) {
    return exibirErroModalQuestao('Todas as alternativas precisam ter um texto.');
  }
  if (alternativas.filter((a) => a.correta).length !== 1) {
    return exibirErroModalQuestao('Selecione exatamente uma alternativa correta.');
  }

  const payload = {
    referencia: referencia || null,
    descricao,
    ativo,
    idTema: idTema ? Number(idTema) : null,
    banca: banca || null,
    ano: ano ? Number(ano) : null,
    dificuldade: dificuldade || null,
    alternativas,
  };
  const btnSalvar = document.getElementById('btn-salvar-questao');
  const spinner = document.getElementById('spinner-salvar-questao');

  btnSalvar.disabled = true;
  spinner.classList.remove('d-none');

  try {
    if (id) {
      await API.put(`/questoes/${id}`, payload);
      mostrarToast('Questão atualizada com sucesso.', 'sucesso');
    } else {
      await API.post('/questoes', payload);
      mostrarToast('Questão cadastrada com sucesso.', 'sucesso');
    }
    modalQuestao.hide();
    carregarQuestoes();
    if (typeof carregarDashboard === 'function') carregarDashboard();
  } catch (err) {
    exibirErroModalQuestao(err.detalhes ? err.detalhes.map((e) => e.mensagem).join(' ') : err.message);
  } finally {
    btnSalvar.disabled = false;
    spinner.classList.add('d-none');
  }
}

function exibirErroModalQuestao(mensagem) {
  const alerta = document.getElementById('alerta-questao');
  alerta.textContent = mensagem;
  alerta.classList.remove('d-none');
}

/* ============ AÇÕES DE STATUS / EXCLUSÃO ============ */

async function alternarStatusQuestao(id, campo, valorAtual) {
  const acao = valorAtual
    ? (campo === 'ativo' ? 'desativar' : 'desmarcar-respondida')
    : (campo === 'ativo' ? 'ativar' : 'marcar-respondida');

  try {
    await API.patch(`/questoes/${id}/${acao}`);
    mostrarToast('Status atualizado com sucesso.', 'sucesso');
    carregarQuestoes();
    if (typeof carregarDashboard === 'function') carregarDashboard();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

function pedirConfirmacaoExclusaoQuestao(id) {
  document.getElementById('confirmar-titulo').textContent = 'Excluir questão';
  document.getElementById('confirmar-texto').textContent =
    'Esta ação excluirá a questão e todas as suas alternativas. Não pode ser desfeita.';
  acaoConfirmada = async () => {
    try {
      await API.delete(`/questoes/${id}`);
      mostrarToast('Questão excluída com sucesso.', 'sucesso');
      carregarQuestoes();
      if (typeof carregarDashboard === 'function') carregarDashboard();
    } catch (err) {
      mostrarToast(err.message, 'erro');
    }
  };
  modalConfirmar.show();
}

/* ============ UTIL ============ */

function escaparHtml(texto) {
  const div = document.createElement('div');
  div.textContent = texto ?? '';
  return div.innerHTML;
}
