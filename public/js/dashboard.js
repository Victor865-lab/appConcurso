/**
 * Seção Dashboard: carrega estatísticas agregadas e renderiza o gráfico
 * de status das questões (ativas / respondidas / pendentes).
 */

let graficoStatus = null;

async function carregarDashboard() {
  try {
    const resposta = await API.get('/questoes/dashboard');
    const { questoes, totalUsuarios } = resposta.dados;

    document.getElementById('stat-total').textContent = questoes.total || 0;
    document.getElementById('stat-ativas').textContent = questoes.ativas || 0;
    document.getElementById('stat-respondidas').textContent = questoes.respondidas || 0;
    document.getElementById('stat-pendentes').textContent = questoes.pendentes || 0;
    document.getElementById('stat-usuarios').textContent = totalUsuarios || 0;

    renderizarGrafico(questoes);
  } catch (err) {
    mostrarToast('Não foi possível carregar os dados do dashboard.', 'erro');
  }

  if (typeof carregarUsuariosOnline === 'function') carregarUsuariosOnline();
}

function renderizarGrafico(questoes) {
  const ctx = document.getElementById('grafico-status');
  const dados = {
    labels: ['Ativas', 'Inativas', 'Respondidas', 'Pendentes'],
    datasets: [
      {
        label: 'Questões',
        data: [
          questoes.ativas || 0,
          (questoes.total || 0) - (questoes.ativas || 0),
          questoes.respondidas || 0,
          questoes.pendentes || 0,
        ],
        backgroundColor: ['#2F9E66', '#D64545', '#D9A233', '#667085'],
        borderRadius: 6,
        maxBarThickness: 56,
      },
    ],
  };

  if (graficoStatus) {
    graficoStatus.data = dados;
    graficoStatus.update();
    return;
  }

  graficoStatus = new Chart(ctx, {
    type: 'bar',
    data: dados,
    options: {
      responsive: true,
      plugins: { legend: { display: false } },
      scales: {
        y: { beginAtZero: true, ticks: { precision: 0 } },
      },
    },
  });
}
