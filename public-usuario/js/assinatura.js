/**
 * Seção Assinatura Premium: exibe os 4 planos e cria a assinatura no
 * Mercado Pago — cartão de crédito (recorrente, via Preapproval, com
 * redirecionamento ao checkout) ou Pix (cobrança avulsa, com QR code
 * exibido direto no modal; a renovação de cada ciclo é gerada pelo
 * servidor e aparece aqui na próxima visita).
 */

const LABEL_PLANO = { mensal: 'Mensal', trimestral: 'Trimestral', semestral: 'Semestral', anual: 'Anual' };
const LABEL_STATUS_ASSINATURA = {
  pendente: { texto: 'Pagamento pendente', classe: 'status-errou' },
  autorizada: { texto: 'Ativa', classe: 'status-acertou' },
  pausada: { texto: 'Pausada', classe: 'status-nao-respondida' },
  cancelada: { texto: 'Cancelada', classe: 'status-nao-respondida' },
  reembolsada: { texto: 'Reembolsada', classe: 'status-nao-respondida' },
};

let modalAssinatura = null;
let planoSelecionado = null;

document.addEventListener('DOMContentLoaded', () => {
  modalAssinatura = new bootstrap.Modal(document.getElementById('modalAssinatura'));

  document.querySelectorAll('.btn-assinar-plano').forEach((btn) => {
    btn.addEventListener('click', () => {
      planoSelecionado = btn.dataset.plano;
      document.getElementById('modal-assinatura-plano-nome').textContent = LABEL_PLANO[planoSelecionado] || '';
      document.getElementById('assinatura-email').value = '';
      document.getElementById('metodo-cartao').checked = true;
      document.getElementById('assinatura-form-pagamento').classList.remove('d-none');
      document.getElementById('assinatura-resultado-pix').classList.add('d-none');
      document.getElementById('assinatura-modal-rodape').classList.remove('d-none');
      const btnConfirmar = document.getElementById('btn-confirmar-assinatura');
      btnConfirmar.textContent = 'Ir para o pagamento';
      btnConfirmar.disabled = false;
      modalAssinatura.show();
    });
  });

  document.getElementById('btn-confirmar-assinatura').addEventListener('click', confirmarAssinatura);

  document.getElementById('btn-ja-paguei-pix').addEventListener('click', async () => {
    await atualizarStatusAssinatura();
    mostrarToast('Verificado! Se o Pix já caiu, o status acima foi atualizado.', 'info');
  });

  document.getElementById('btn-copiar-pix').addEventListener('click', () => {
    const campo = document.getElementById('assinatura-pix-copia-cola');
    campo.select();
    navigator.clipboard?.writeText(campo.value).catch(() => {});
    mostrarToast('Código Pix copiado!', 'sucesso');
  });

  // Retorno do checkout do Mercado Pago (back_url), independentemente da aba aberta.
  const params = new URLSearchParams(window.location.search);
  if (params.get('assinatura') === 'retorno') {
    window.history.replaceState({}, '', window.location.pathname);
    document.querySelectorAll('.nav-item').forEach((b) => b.classList.remove('ativo'));
    document.querySelector('.nav-item[data-secao="assinatura"]')?.classList.add('ativo');
    mostrarToast('Verificando o status da sua assinatura...', 'info');
    trocarSecao('assinatura');
  }
});

async function carregarAssinatura() {
  await atualizarStatusAssinatura();
}

async function atualizarStatusAssinatura() {
  const card = document.getElementById('assinatura-status-card');
  try {
    const resposta = await API.get('/assinaturas/atual');
    const assinatura = resposta.dados;
    if (!assinatura) {
      card.classList.add('d-none');
      return;
    }

    const statusInfo = LABEL_STATUS_ASSINATURA[assinatura.status] || { texto: assinatura.status, classe: '' };
    const podeReembolsar = assinatura.status === 'autorizada'
      && (Date.now() - new Date(assinatura.criadoEm).getTime()) <= 7 * 24 * 60 * 60 * 1000;

    card.innerHTML = `
      <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div>
          <h2 class="mb-1">Plano ${escaparHtml(LABEL_PLANO[assinatura.plano] || assinatura.plano)}</h2>
          <span class="status-resposta ${statusInfo.classe}">${statusInfo.texto}</span>
        </div>
        <div class="text-end">
          <span class="text-muted small d-block">Assinado em ${new Date(assinatura.criadoEm).toLocaleDateString('pt-BR')}</span>
          ${podeReembolsar ? '<button type="button" class="btn btn-sm btn-outline-danger mt-2" id="btn-reembolsar-assinatura">Cancelar e reembolsar (7 dias)</button>' : ''}
        </div>
      </div>
    `;
    card.classList.remove('d-none');

    document.getElementById('btn-reembolsar-assinatura')?.addEventListener('click', () => solicitarReembolso(assinatura.id));
  } catch (err) {
    card.classList.add('d-none');
  }
}

async function solicitarReembolso(idAssinatura) {
  if (!confirm('Tem certeza que deseja cancelar e reembolsar esta assinatura? Seu acesso premium será revogado imediatamente.')) return;

  try {
    await API.post(`/assinaturas/${idAssinatura}/reembolsar`, {});
    mostrarToast('Reembolso realizado com sucesso.', 'sucesso');
    await atualizarStatusAssinatura();
  } catch (err) {
    mostrarToast(err.message, 'erro');
  }
}

async function confirmarAssinatura() {
  const emailPagador = document.getElementById('assinatura-email').value.trim();
  if (!emailPagador || !emailPagador.includes('@')) {
    mostrarToast('Informe um e-mail válido.', 'info');
    return;
  }
  const metodoPagamento = document.querySelector('input[name="metodo-pagamento"]:checked').value;

  const btn = document.getElementById('btn-confirmar-assinatura');
  btn.disabled = true;
  try {
    const resposta = await API.post('/assinaturas', { plano: planoSelecionado, emailPagador, metodoPagamento });

    if (metodoPagamento === 'pix') {
      document.getElementById('assinatura-pix-qrcode').src = `data:image/png;base64,${resposta.dados.pix.qrCodeBase64}`;
      document.getElementById('assinatura-pix-copia-cola').value = resposta.dados.pix.qrCode;
      document.getElementById('assinatura-form-pagamento').classList.add('d-none');
      document.getElementById('assinatura-resultado-pix').classList.remove('d-none');
      document.getElementById('assinatura-modal-rodape').classList.add('d-none');
      btn.disabled = false;
    } else {
      window.location.href = resposta.dados.initPoint;
    }
  } catch (err) {
    mostrarToast(err.message, 'erro');
    btn.disabled = false;
  }
}
