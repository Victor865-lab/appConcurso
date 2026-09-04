/**
 * "Fale conosco" — formulário de feedback na sidebar, logo abaixo do
 * cartão de nível. Envia a mensagem por e-mail para a equipe (POST
 * /reclamacoes), sem exigir nada além do texto da mensagem.
 */

let modalReclamacao = null;

document.addEventListener('DOMContentLoaded', () => {
  const elModal = document.getElementById('modalReclamacao');
  if (!elModal) return;

  modalReclamacao = new bootstrap.Modal(elModal);

  document.getElementById('btn-abrir-reclamacao').addEventListener('click', () => {
    document.getElementById('reclamacao-mensagem').value = '';
    modalReclamacao.show();
  });

  document.getElementById('btn-enviar-reclamacao').addEventListener('click', enviarReclamacao);
});

async function enviarReclamacao() {
  const botao = document.getElementById('btn-enviar-reclamacao');
  const mensagem = document.getElementById('reclamacao-mensagem').value.trim();

  if (mensagem.length < 10) {
    mostrarToast('Descreva sua reclamação com um pouco mais de detalhe (mín. 10 caracteres).', 'info');
    return;
  }

  botao.disabled = true;
  try {
    await API.post('/reclamacoes', { mensagem });
    mostrarToast('Reclamação enviada! Nossa equipe vai analisar em breve.', 'sucesso');
    modalReclamacao.hide();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  } finally {
    botao.disabled = false;
  }
}
