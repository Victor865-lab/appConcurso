/**
 * Seção Usuários: listagem, cadastro, edição e exclusão.
 */

let modalUsuario = null;
let listaUsuariosCache = [];

document.addEventListener('DOMContentLoaded', () => {
  modalUsuario = new bootstrap.Modal(document.getElementById('modalUsuario'));

  document.getElementById('btn-novo-usuario').addEventListener('click', abrirModalNovoUsuario);
  document.getElementById('btn-salvar-usuario').addEventListener('click', salvarUsuario);

  let debounceBusca;
  document.getElementById('busca-usuario').addEventListener('input', (e) => {
    clearTimeout(debounceBusca);
    debounceBusca = setTimeout(() => {
      renderizarTabelaUsuarios(filtrarUsuarios(e.target.value.trim()));
    }, 250);
  });
});

function filtrarUsuarios(termo) {
  if (!termo) return listaUsuariosCache;
  const termoLower = termo.toLowerCase();
  return listaUsuariosCache.filter((u) => u.nome.toLowerCase().includes(termoLower));
}

async function carregarUsuarios() {
  const corpo = document.getElementById('corpo-tabela-usuarios');
  const vazio = document.getElementById('usuarios-vazio');
  const loading = document.getElementById('usuarios-loading');

  loading.classList.remove('d-none');
  vazio.classList.add('d-none');
  corpo.innerHTML = '';

  try {
    const resposta = await API.get('/usuarios');
    listaUsuariosCache = resposta.dados;
    loading.classList.add('d-none');

    if (!listaUsuariosCache.length) {
      vazio.classList.remove('d-none');
      return;
    }
    renderizarTabelaUsuarios(listaUsuariosCache);
  } catch (err) {
    loading.classList.add('d-none');
    mostrarToast('Erro ao carregar usuários.', 'erro');
  }
}

function renderizarTabelaUsuarios(usuarios) {
  const corpo = document.getElementById('corpo-tabela-usuarios');
  const vazio = document.getElementById('usuarios-vazio');

  if (!usuarios.length) {
    corpo.innerHTML = '';
    vazio.classList.remove('d-none');
    return;
  }
  vazio.classList.add('d-none');

  corpo.innerHTML = usuarios.map((u) => `
    <tr>
      <td>#${u.id}</td>
      <td>${escaparHtml(u.nome)}</td>
      <td>${rotuloStatusOnline(u)}</td>
      <td>${u.criadoEm ? new Date(u.criadoEm).toLocaleDateString('pt-BR') : '—'}</td>
      <td class="acoes-linha">
        <button title="Editar" onclick="abrirModalEditarUsuario(${u.id})"><i class="bi bi-pencil"></i></button>
        <button class="acao-excluir" title="Excluir" onclick="pedirConfirmacaoExclusaoUsuario(${u.id})"><i class="bi bi-trash"></i></button>
      </td>
    </tr>
  `).join('');
}

function rotuloStatusOnline(u) {
  if (u.online) {
    return '<span class="selo-status selo-online"><span class="dot-online"></span> Online</span>';
  }
  const visto = u.ultimaAtividade
    ? `Visto por último em ${new Date(u.ultimaAtividade).toLocaleString('pt-BR')}`
    : 'Nunca acessou';
  return `<span class="selo-status selo-offline" title="${escaparHtml(visto)}">Offline</span>`;
}

function abrirModalNovoUsuario() {
  document.getElementById('modalUsuarioTitulo').textContent = 'Novo usuário';
  document.getElementById('usuario-id').value = '';
  document.getElementById('usuario-nome').value = '';
  document.getElementById('usuario-senha').value = '';
  document.getElementById('usuario-senha').required = true;
  document.getElementById('grupo-usuario-senha').classList.remove('d-none');
  document.getElementById('alerta-usuario').classList.add('d-none');
  modalUsuario.show();
}

function abrirModalEditarUsuario(id) {
  const usuario = listaUsuariosCache.find((u) => u.id === id);
  if (!usuario) return;

  document.getElementById('modalUsuarioTitulo').textContent = 'Editar usuário';
  document.getElementById('usuario-id').value = usuario.id;
  document.getElementById('usuario-nome').value = usuario.nome;
  document.getElementById('usuario-senha').value = '';
  document.getElementById('usuario-senha').required = false;
  // A troca de senha é feita pelo próprio usuário autenticado, via /auth/senha.
  document.getElementById('grupo-usuario-senha').classList.add('d-none');
  document.getElementById('alerta-usuario').classList.add('d-none');
  modalUsuario.show();
}

async function salvarUsuario() {
  const alerta = document.getElementById('alerta-usuario');
  alerta.classList.add('d-none');

  const id = document.getElementById('usuario-id').value;
  const nome = document.getElementById('usuario-nome').value.trim();
  const senha = document.getElementById('usuario-senha').value;

  if (nome.length < 3) {
    alerta.textContent = 'O nome deve ter ao menos 3 caracteres.';
    alerta.classList.remove('d-none');
    return;
  }

  try {
    if (id) {
      await API.put(`/usuarios/${id}`, { nome });
      mostrarToast('Usuário atualizado com sucesso.', 'sucesso');
    } else {
      if (senha.length < 8) {
        alerta.textContent = 'A senha deve ter ao menos 8 caracteres.';
        alerta.classList.remove('d-none');
        return;
      }
      await API.post('/usuarios', { nome, senha });
      mostrarToast('Usuário cadastrado com sucesso.', 'sucesso');
    }
    modalUsuario.hide();
    carregarUsuarios();
    if (typeof carregarDashboard === 'function') carregarDashboard();
  } catch (err) {
    alerta.textContent = err.detalhes ? err.detalhes.map((e) => e.mensagem).join(' ') : err.message;
    alerta.classList.remove('d-none');
  }
}

function pedirConfirmacaoExclusaoUsuario(id) {
  document.getElementById('confirmar-titulo').textContent = 'Excluir usuário';
  document.getElementById('confirmar-texto').textContent = 'Esta ação não pode ser desfeita.';
  acaoConfirmada = async () => {
    try {
      await API.delete(`/usuarios/${id}`);
      mostrarToast('Usuário excluído com sucesso.', 'sucesso');
      carregarUsuarios();
      if (typeof carregarDashboard === 'function') carregarDashboard();
    } catch (err) {
      mostrarToast(err.message, 'erro');
    }
  };
  modalConfirmar.show();
}
