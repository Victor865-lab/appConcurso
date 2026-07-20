/**
 * Menu do avatar: modal de Configurações (trocar nome/senha) e
 * modal informativo de Assinatura (plano atual e data de vencimento).
 */

const LABEL_PLANO_CONFIG = { mensal: 'Mensal', trimestral: 'Trimestral', semestral: 'Semestral', anual: 'Anual' };
const LABEL_STATUS_CONFIG = {
  pendente: 'Pagamento pendente',
  autorizada: 'Ativa',
  pausada: 'Pausada',
  cancelada: 'Cancelada',
  reembolsada: 'Reembolsada',
};

let modalConfiguracoes = null;
let modalAssinaturaInfo = null;

document.addEventListener('DOMContentLoaded', () => {
  modalConfiguracoes = new bootstrap.Modal(document.getElementById('modalConfiguracoes'));
  modalAssinaturaInfo = new bootstrap.Modal(document.getElementById('modalAssinaturaInfo'));

  document.getElementById('btn-abrir-configuracoes').addEventListener('click', () => {
    const usuario = API.obterUsuario();
    document.getElementById('config-nome').value = usuario?.nome || '';
    document.getElementById('form-config-senha').reset();
    modalConfiguracoes.show();
  });

  document.getElementById('btn-abrir-assinatura-info').addEventListener('click', async () => {
    modalAssinaturaInfo.show();
    await carregarAssinaturaInfo();
  });

  document.getElementById('form-config-nome').addEventListener('submit', salvarNome);
  document.getElementById('form-config-senha').addEventListener('submit', trocarSenha);
});

async function salvarNome(evento) {
  evento.preventDefault();
  const novoNome = document.getElementById('config-nome').value.trim();
  const usuario = API.obterUsuario();

  if (!novoNome || novoNome.length < 3) {
    mostrarToast('O nome deve ter no mínimo 3 caracteres.', 'info');
    return;
  }

  try {
    const resposta = await API.put(`/usuarios/${usuario.id}`, { nome: novoNome });
    API.atualizarUsuario({ ...usuario, nome: resposta.dados.nome });
    document.getElementById('nome-usuario-logado').textContent = resposta.dados.nome;
    mostrarToast('Nome atualizado com sucesso.', 'sucesso');
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

async function trocarSenha(evento) {
  evento.preventDefault();
  const senhaAtual = document.getElementById('config-senha-atual').value;
  const novaSenha = document.getElementById('config-senha-nova').value;
  const confirmar = document.getElementById('config-senha-confirmar').value;

  if (novaSenha.length < 8) {
    mostrarToast('A nova senha deve ter no mínimo 8 caracteres.', 'info');
    return;
  }
  if (novaSenha !== confirmar) {
    mostrarToast('A confirmação não confere com a nova senha.', 'info');
    return;
  }

  try {
    await API.put('/auth/senha', { senhaAtual, novaSenha });
    mostrarToast('Senha alterada com sucesso.', 'sucesso');
    document.getElementById('form-config-senha').reset();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

async function carregarAssinaturaInfo() {
  const conteudo = document.getElementById('assinatura-info-conteudo');
  conteudo.innerHTML = '<div class="text-center py-3"><div class="spinner-border text-primary"></div></div>';

  try {
    const resposta = await API.get('/assinaturas/atual');
    const assinatura = resposta.dados;

    if (!assinatura) {
      conteudo.innerHTML = '<p class="text-muted mb-0">Você ainda não possui nenhuma assinatura.</p>';
      return;
    }

    const nomePlano = LABEL_PLANO_CONFIG[assinatura.plano] || assinatura.plano;
    const statusTexto = LABEL_STATUS_CONFIG[assinatura.status] || assinatura.status;
    const vencimento = assinatura.dataFim
      ? new Date(assinatura.dataFim).toLocaleDateString('pt-BR')
      : '—';

    conteudo.innerHTML = `
      <p class="mb-2"><strong>Plano:</strong> ${escaparHtml(nomePlano)}</p>
      <p class="mb-2"><strong>Status:</strong> ${escaparHtml(statusTexto)}</p>
      <p class="mb-0"><strong>Vencimento:</strong> ${escaparHtml(vencimento)}</p>
    `;
  } catch (err) {
    conteudo.innerHTML = `<p class="text-danger mb-0">${escaparHtml(err.message)}</p>`;
  }
}
