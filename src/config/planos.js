/**
 * Catálogo dos planos de assinatura premium.
 * Fonte única da verdade para preço/periodicidade — usado tanto para
 * exibir os planos quanto para criar a assinatura recorrente no
 * Mercado Pago (Preapproval).
 */

const PLANOS = {
  mensal: { codigo: 'mensal', nome: 'Mensal', valor: 19.90, frequencia: 1, frequenciaTipo: 'months' },
  trimestral: { codigo: 'trimestral', nome: 'Trimestral', valor: 49.90, frequencia: 3, frequenciaTipo: 'months' },
  semestral: { codigo: 'semestral', nome: 'Semestral', valor: 99.00, frequencia: 6, frequenciaTipo: 'months' },
  anual: { codigo: 'anual', nome: 'Anual', valor: 179.00, frequencia: 12, frequenciaTipo: 'months' },
};

module.exports = PLANOS;
