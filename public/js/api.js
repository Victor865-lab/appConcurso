/**
 * Wrapper central de comunicação com a API.
 * Cuida de: base URL, cabeçalho de autenticação, parsing de erros
 * e logout automático quando o token expira (401).
 */

const API = (() => {
  /**
   * Resolve a URL base da API.
   * Como o painel é servido pela própria API em /admin, o caso comum é
   * usar a mesma origem (protocolo + host + porta). Caso o painel seja
   * aberto diretamente do disco (file://) ou hospedado separadamente,
   * cai para http://localhost:3000 — ajuste conforme seu ambiente.
   */
  const resolverBaseUrl = () => {
    if (window.location.protocol === 'file:') {
      return 'http://localhost:3000';
    }
    return window.location.origin;
  };

  function obterToken() {
    return localStorage_seguro('token');
  }

  // localStorage é aceitável aqui pois este é um app real servido por arquivo estático,
  // fora do ambiente de artifacts do Claude.
  function localStorage_seguro(chave, valor) {
    try {
      if (valor === undefined) return localStorage.getItem(chave);
      if (valor === null) return localStorage.removeItem(chave);
      return localStorage.setItem(chave, valor);
    } catch (e) {
      console.warn('Armazenamento local indisponível.');
      return null;
    }
  }

  async function requisitar(metodo, caminho, corpo) {
    const headers = { 'Content-Type': 'application/json' };
    const token = obterToken();
    if (token) headers['Authorization'] = `Bearer ${token}`;

    const resposta = await fetch(`${resolverBaseUrl()}${caminho}`, {
      method: metodo,
      headers,
      body: corpo !== undefined ? JSON.stringify(corpo) : undefined,
    });

    let dados = null;
    try {
      dados = await resposta.json();
    } catch (e) {
      dados = null;
    }

    if (resposta.status === 401) {
      localStorage_seguro('token', null);
      localStorage_seguro('usuario', null);
      if (!window.location.pathname.endsWith('index.html') && window.location.pathname !== '/') {
        window.location.href = 'index.html';
      }
    }

    if (!resposta.ok) {
      const erro = new Error(dados?.mensagem || 'Erro ao comunicar com o servidor.');
      erro.status = resposta.status;
      erro.detalhes = dados?.erros || null;
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
      localStorage_seguro('token', token);
      localStorage_seguro('usuario', JSON.stringify(usuario));
    },
    limparSessao: () => {
      localStorage_seguro('token', null);
      localStorage_seguro('usuario', null);
    },
    obterUsuario: () => {
      const bruto = localStorage_seguro('usuario');
      return bruto ? JSON.parse(bruto) : null;
    },
    estaAutenticado: () => !!obterToken(),
  };
})();

/**
 * Exibe uma notificação toast (sucesso/erro) usando Bootstrap.
 */
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
