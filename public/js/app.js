/**
 * Orquestração geral do painel: guarda de autenticação, navegação entre
 * seções, alternância de tema claro/escuro e logout.
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

  carregarDashboard();
});

const TITULOS_SECAO = {
  dashboard: { eyebrow: 'Visão geral', titulo: 'Dashboard' },
  questoes: { eyebrow: 'Gestão de conteúdo', titulo: 'Questões' },
  usuarios: { eyebrow: 'Administração', titulo: 'Usuários' },
  ranking: { eyebrow: 'Monitoramento', titulo: 'Ranking' },
};

const CARREGADORES_SECAO = {
  dashboard: carregarDashboard,
  questoes: () => carregarQuestoes(),
  usuarios: () => carregarUsuarios(),
  ranking: () => carregarRanking(),
};

const secoesJaCarregadas = new Set(['dashboard']);

function configurarNavegacao() {
  document.querySelectorAll('.nav-item').forEach((botao) => {
    botao.addEventListener('click', () => {
      const secao = botao.dataset.secao;
      trocarSecao(secao);
      document.querySelectorAll('.nav-item').forEach((b) => b.classList.remove('ativo'));
      botao.classList.add('ativo');

      // Fecha o menu no mobile após navegar
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
  const chaveTema = 'concursos_tema';
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
    try {
      await API.post('/auth/logout');
    } catch (e) {
      // Logout é stateless; mesmo se a chamada falhar, limpamos a sessão local.
    }
    API.limparSessao();
    window.location.href = 'index.html';
  });
}
