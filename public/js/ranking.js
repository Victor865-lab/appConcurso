/**
 * Seção Ranking (exclusiva do painel administrativo): permite à equipe
 * acompanhar o desempenho geral dos usuários por período.
 */

let periodoRankingAtual = 'geral';

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.btn-periodo').forEach((btn) => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.btn-periodo').forEach((b) => b.classList.remove('ativo'));
      btn.classList.add('ativo');
      periodoRankingAtual = btn.dataset.periodo;
      carregarRanking();
    });
  });
});

async function carregarRanking() {
  const corpo = document.getElementById('corpo-tabela-ranking');
  const vazio = document.getElementById('ranking-vazio');
  const loading = document.getElementById('ranking-loading');

  loading.classList.remove('d-none');
  vazio.classList.add('d-none');
  corpo.innerHTML = '';

  try {
    const resposta = await API.get(`/ranking?periodo=${periodoRankingAtual}`);
    const { ranking } = resposta.dados;
    loading.classList.add('d-none');

    if (!ranking.length) {
      vazio.classList.remove('d-none');
      return;
    }

    corpo.innerHTML = ranking.map((r) => `
      <tr>
        <td>${r.posicao}º</td>
        <td>${escaparHtml(r.nome)}</td>
        <td>${r.pontos}</td>
        <td>${r.totalRespondidas}</td>
      </tr>
    `).join('');
  } catch (err) {
    loading.classList.add('d-none');
    mostrarToast('Erro ao carregar o ranking.', 'erro');
  }
}
