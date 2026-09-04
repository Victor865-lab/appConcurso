/**
 * Wrapper central de comunicação com a API para o painel do usuário.
 * Usa chaves de localStorage próprias ("usuario_*") para não conflitar
 * com uma sessão do painel administrativo aberta no mesmo navegador.
 */

const API = (() => {
  const CHAVE_TOKEN = 'usuario_token';
  const CHAVE_DADOS = 'usuario_dados';

  const resolverBaseUrl = () => {
    if (window.location.protocol === 'file:') return 'http://localhost:3000';
    return window.location.origin;
  };

  function armazenar(chave, valor) {
    try {
      if (valor === null) return localStorage.removeItem(chave);
      return localStorage.setItem(chave, valor);
    } catch (e) {
      console.warn('Armazenamento local indisponível.');
    }
  }

  function ler(chave) {
    try {
      return localStorage.getItem(chave);
    } catch (e) {
      return null;
    }
  }

  async function requisitar(metodo, caminho, corpo) {
    const headers = { 'Content-Type': 'application/json' };
    const token = ler(CHAVE_TOKEN);
    if (token) headers['Authorization'] = `Bearer ${token}`;

    const resposta = await fetch(`${resolverBaseUrl()}${caminho}`, {
      method: metodo,
      headers,
      body: corpo !== undefined ? JSON.stringify(corpo) : undefined,
    });

    let dados = null;
    try { dados = await resposta.json(); } catch (e) { dados = null; }

    if (resposta.status === 401) {
      armazenar(CHAVE_TOKEN, null);
      armazenar(CHAVE_DADOS, null);
      if (!window.location.pathname.endsWith('index.html')) {
        window.location.href = 'index.html';
      }
    }

    if (!resposta.ok) {
      const erro = new Error(dados?.mensagem || 'Erro ao comunicar com o servidor.');
      erro.status = resposta.status;
      erro.detalhes = dados?.erros || null;
      erro.codigo = dados?.codigo || null;
      throw erro;
    }

    return dados;
  }

  return {
    get: (caminho) => requisitar('GET', caminho),
    post: (caminho, corpo) => requisitar('POST', caminho, corpo),
    put: (caminho, corpo) => requisitar('PUT', caminho, corpo),
    patch: (caminho, corpo) => requisitar('PATCH', caminho, corpo),
    delete: (caminho) => requisitar('DELETE', caminho),
    salvarSessao: (token, usuario) => {
      armazenar(CHAVE_TOKEN, token);
      armazenar(CHAVE_DADOS, JSON.stringify(usuario));
    },
    limparSessao: () => {
      armazenar(CHAVE_TOKEN, null);
      armazenar(CHAVE_DADOS, null);
    },
    atualizarUsuario: (usuario) => armazenar(CHAVE_DADOS, JSON.stringify(usuario)),
    obterUsuario: () => {
      const bruto = ler(CHAVE_DADOS);
      return bruto ? JSON.parse(bruto) : null;
    },
    estaAutenticado: () => !!ler(CHAVE_TOKEN),
  };
})();

function mostrarToast(mensagem, tipo = 'sucesso') {
  const container = document.getElementById('toast-container');
  if (!container) return;
  const cor = tipo === 'sucesso' ? 'text-bg-success' : tipo === 'erro' ? 'text-bg-danger' : 'text-bg-secondary';
  const icone = tipo === 'sucesso' ? 'bi-check-circle' : tipo === 'erro' ? 'bi-x-circle' : 'bi-info-circle';

  const el = document.createElement('div');
  el.className = `toast align-items-center ${cor} border-0`;
  el.setAttribute('role', 'alert');
  el.innerHTML = `
    <div class="d-flex">
      <div class="toast-body"><i class="bi ${icone} me-2"></i>${mensagem}</div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
    </div>`;
  container.appendChild(el);
  const toast = new bootstrap.Toast(el, { delay: 4000 });
  toast.show();
  el.addEventListener('hidden.bs.toast', () => el.remove());
}

function escaparHtml(texto) {
  const div = document.createElement('div');
  div.textContent = texto ?? '';
  return div.innerHTML;
}
