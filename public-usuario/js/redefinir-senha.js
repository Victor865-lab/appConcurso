document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('form-redefinir');
  const alerta = document.getElementById('alerta-redefinir');
  const btn = document.getElementById('btn-redefinir');
  const spinner = document.getElementById('spinner-redefinir');
  const texto = document.getElementById('texto-redefinir');

  const token = new URLSearchParams(window.location.search).get('token');

  function mostrarAlerta(mensagem, tipo) {
    alerta.className = `alert alert-${tipo}`;
    alerta.textContent = mensagem;
    alerta.classList.remove('d-none');
  }

  if (!token) {
    mostrarAlerta('Link inválido. Solicite uma nova redefinição de senha na tela de login.', 'danger');
    form.querySelectorAll('input, button').forEach((el) => { el.disabled = true; });
    return;
  }

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    alerta.classList.add('d-none');

    const novaSenha = document.getElementById('nova-senha').value;
    const confirmarSenha = document.getElementById('confirmar-senha').value;

    if (novaSenha !== confirmarSenha) {
      mostrarAlerta('As senhas não coincidem.', 'danger');
      return;
    }

    btn.disabled = true;
    spinner.classList.remove('d-none');
    texto.textContent = 'Salvando...';

    try {
      const resposta = await API.post('/auth/redefinir-senha', { token, novaSenha });
      mostrarAlerta(resposta.mensagem, 'success');
      form.reset();
      form.querySelectorAll('input, button').forEach((el) => { el.disabled = true; });
      setTimeout(() => { window.location.href = 'index.html'; }, 2500);
    } catch (err) {
      mostrarAlerta(err.message, 'danger');
      btn.disabled = false;
      spinner.classList.add('d-none');
      texto.textContent = 'Salvar nova senha';
    }
  });
});
