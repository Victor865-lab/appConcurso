/**
 * Widget "Usuários online" do Dashboard administrativo.
 * Considera online quem teve alguma requisição autenticada nos
 * últimos 5 minutos (ver usuarioModel.listarTodos / middleware auth).
 */

const INTERVALO_ATUALIZACAO_ONLINE_MS = 30000;

document.addEventListener('DOMContentLoaded', () => {
  setInterval(() => {
    const secaoDashboard = document.getElementById('secao-dashboard');
    if (secaoDashboard && !secaoDashboard.classList.contains('d-none')) {
      carregarUsuariosOnline();
    }
  }, INTERVALO_ATUALIZACAO_ONLINE_MS);
});

async function carregarUsuariosOnline() {
  const lista = document.getElementById('lista-usuarios-online');
  const vazio = document.getElementById('online-vazio');
  const totalBadge = document.getElementById('online-total');
  if (!lista) return;

  try {
    const resposta = await API.get('/usuarios');
    const online = resposta.dados.filter((u) => u.online);
    totalBadge.textContent = online.length;

    if (!online.length) {
      lista.innerHTML = '';
      vazio.classList.remove('d-none');
      return;
    }

    vazio.classList.add('d-none');
    lista.innerHTML = online.map((u) => `
      <div class="item-usuario-online">
        <span class="dot-online"></span>
        <span>${escaparHtml(u.nome)}</span>
      </div>
    `).join('');
  } catch (err) {
    // Widget não deve interromper o dashboard em caso de falha pontual.
  }
}
