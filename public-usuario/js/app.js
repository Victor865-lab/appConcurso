/**
 * Orquestração geral do painel do usuário: guarda de autenticação,
 * navegação entre seções, tema claro/escuro e logout.
 */

document.addEventListener('DOMContentLoaded', () => {
  if (!API.estaAutenticado()) {
    window.location.href = 'index.html';
    return;
  }

  const usuario = API.obterUsuario();
  document.getElementById('nome-usuario-logado').textContent = usuario?.nome || 'Usuário';

  configurarNavegacao();
  configurarTema();
  configurarMenuMobile();
  configurarLogout();
  configurarAlturaTopbar();

  inicializarFiltrosMapeamento();
  carregarDashboard();
});

function configurarAlturaTopbar() {
  const topbar = document.querySelector('.topbar');
  const medir = () => {
    if (topbar) document.documentElement.style.setProperty('--altura-topbar', `${topbar.getBoundingClientRect().height}px`);
  };
  medir();
  window.addEventListener('resize', medir);
}

const TITULOS_SECAO = {
  dashboard: { eyebrow: 'Sua jornada', titulo: 'Meu painel' },
  mapeamento: { eyebrow: 'Explore o banco de questões', titulo: 'Questões' },
  simulados: { eyebrow: 'Treine sob pressão', titulo: 'Gerar simulado' },
  assinatura: { eyebrow: 'Desbloqueie todo o potencial', titulo: 'Assinatura Premium' },
};

const CARREGADORES_SECAO = {
  dashboard: carregarDashboard,
  mapeamento: carregarMapeamento,
  simulados: carregarSimulados,
  assinatura: carregarAssinatura,
};

const secoesJaCarregadas = new Set(['dashboard']);

function configurarNavegacao() {
  document.querySelectorAll('.nav-item').forEach((botao) => {
    botao.addEventListener('click', () => {
      const secao = botao.dataset.secao;
      trocarSecao(secao);
      document.querySelectorAll('.nav-item').forEach((b) => b.classList.remove('ativo'));
      botao.classList.add('ativo');
      document.getElementById('sidebar').classList.remove('aberto');
    });
  });
}

function trocarSecao(secao) {
  document.querySelectorAll('.secao').forEach((s) => s.classList.add('d-none'));
  document.getElementById(`secao-${secao}`).classList.remove('d-none');

  document.getElementById('titulo-eyebrow').textContent = TITULOS_SECAO[secao].eyebrow;
  document.getElementById('titulo-secao').textContent = TITULOS_SECAO[secao].titulo;

  if (!secoesJaCarregadas.has(secao)) {
    CARREGADORES_SECAO[secao]();
    secoesJaCarregadas.add(secao);
  }
}

function configurarTema() {
  const btnTema = document.getElementById('btn-tema');
  const chaveTema = 'trilha_tema';
  const temaSalvo = localStorage.getItem(chaveTema) || 'claro';

  aplicarTema(temaSalvo);

  btnTema.addEventListener('click', () => {
    const atual = document.documentElement.getAttribute('data-tema');
    const proximo = atual === 'claro' ? 'escuro' : 'claro';
    aplicarTema(proximo);
    localStorage.setItem(chaveTema, proximo);
  });

  function aplicarTema(tema) {
    document.documentElement.setAttribute('data-tema', tema);
    const icone = btnTema.querySelector('i');
    const texto = btnTema.querySelector('span');
    if (tema === 'escuro') {
      icone.className = 'bi bi-sun';
      texto.textContent = 'Tema claro';
    } else {
      icone.className = 'bi bi-moon-stars';
      texto.textContent = 'Tema escuro';
    }
  }
}

function configurarMenuMobile() {
  const btn = document.getElementById('btn-menu-mobile');
  const sidebar = document.getElementById('sidebar');
  btn?.addEventListener('click', () => sidebar.classList.toggle('aberto'));
}

function configurarLogout() {
  document.getElementById('btn-sair').addEventListener('click', async () => {
    try { await API.post('/auth/logout'); } catch (e) { /* stateless */ }
    API.limparSessao();
    window.location.href = 'index.html';
  });
}
