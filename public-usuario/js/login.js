document.addEventListener('DOMContentLoaded', () => {
  if (API.estaAutenticado()) {
    window.location.href = 'painel.html';
    return;
  }

  const formLogin = document.getElementById('form-login');
  const alertaLogin = document.getElementById('alerta-login');
  const btnLogin = document.getElementById('btn-login');
  const spinnerLogin = document.getElementById('spinner-login');
  const textoLogin = document.getElementById('texto-login');

  const btnVerSenha = document.getElementById('btn-ver-senha');
  const campoSenha = document.getElementById('senha');
  btnVerSenha.addEventListener('click', () => {
    const visivel = campoSenha.type === 'text';
    campoSenha.type = visivel ? 'password' : 'text';
    btnVerSenha.querySelector('i').className = visivel ? 'bi bi-eye' : 'bi bi-eye-slash';
  });

  formLogin.addEventListener('submit', async (e) => {
    e.preventDefault();
    alertaLogin.classList.add('d-none');

    const nome = document.getElementById('nome').value.trim();
    const senha = document.getElementById('senha').value;

    btnLogin.disabled = true;
    spinnerLogin.classList.remove('d-none');
    textoLogin.textContent = 'Entrando...';

    try {
      const resposta = await API.post('/auth/login', { nome, senha });
      API.salvarSessao(resposta.dados.token, resposta.dados.usuario);
      window.location.href = 'painel.html';
    } catch (err) {
      alertaLogin.textContent = err.message;
      alertaLogin.classList.remove('d-none');
    } finally {
      btnLogin.disabled = false;
      spinnerLogin.classList.add('d-none');
      textoLogin.textContent = 'Entrar e continuar sequência';
    }
  });

  const linkCadastro = document.getElementById('link-cadastro');
  const modalCadastro = new bootstrap.Modal(document.getElementById('modalCadastro'));
  linkCadastro.addEventListener('click', (e) => {
    e.preventDefault();
    modalCadastro.show();
  });

  const linkEsqueciSenha = document.getElementById('link-esqueci-senha');
  const modalEsqueciSenha = new bootstrap.Modal(document.getElementById('modalEsqueciSenha'));
  linkEsqueciSenha.addEventListener('click', (e) => {
    e.preventDefault();
    modalEsqueciSenha.show();
  });

  const formEsqueciSenha = document.getElementById('form-esqueci-senha');
  const alertaEsqueciSenha = document.getElementById('alerta-esqueci-senha');
  const btnEsqueciSenha = document.getElementById('btn-esqueci-senha');
  const spinnerEsqueciSenha = document.getElementById('spinner-esqueci-senha');
  const textoEsqueciSenha = document.getElementById('texto-esqueci-senha');

  formEsqueciSenha.addEventListener('submit', async (e) => {
    e.preventDefault();
    alertaEsqueciSenha.classList.add('d-none');

    const email = document.getElementById('esqueci-email').value.trim();

    btnEsqueciSenha.disabled = true;
    spinnerEsqueciSenha.classList.remove('d-none');
    textoEsqueciSenha.textContent = 'Enviando...';

    try {
      const resposta = await API.post('/auth/esqueci-senha', { email });
      alertaEsqueciSenha.className = 'alert alert-success';
      alertaEsqueciSenha.textContent = resposta.mensagem;
      formEsqueciSenha.reset();
    } catch (err) {
      alertaEsqueciSenha.className = 'alert alert-danger';
      alertaEsqueciSenha.textContent = err.detalhes ? err.detalhes.map((e) => e.mensagem).join(' ') : err.message;
    } finally {
      alertaEsqueciSenha.classList.remove('d-none');
      btnEsqueciSenha.disabled = false;
      spinnerEsqueciSenha.classList.add('d-none');
      textoEsqueciSenha.textContent = 'Enviar link de redefinição';
    }
  });

  const formCadastro = document.getElementById('form-cadastro');
  const alertaCadastro = document.getElementById('alerta-cadastro');

  formCadastro.addEventListener('submit', async (e) => {
    e.preventDefault();
    alertaCadastro.classList.add('d-none');

    const nome = document.getElementById('cad-nome').value.trim();
    const email = document.getElementById('cad-email').value.trim();
    const senha = document.getElementById('cad-senha').value;

    try {
      await API.post('/usuarios', { nome, email, senha });
      modalCadastro.hide();
      mostrarToast('Conta criada com sucesso! Faça login para começar.', 'sucesso');
      formCadastro.reset();
    } catch (err) {
      alertaCadastro.textContent = err.detalhes ? err.detalhes.map((e) => e.mensagem).join(' ') : err.message;
      alertaCadastro.classList.remove('d-none');
    }
  });
});
