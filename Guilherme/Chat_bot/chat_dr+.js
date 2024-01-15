//correção
function horarioFuncionamento() {
    const agora = new Date(Date.now() - 3 * 60 * 60 * 1000);
    const diaDaSemana = agora.getUTCDay();//retorna o dia 
    const horaAtual = agora.getUTCHours();//retorna as horas
    const minutoAtual = agora.getUTCMinutes();//retorna os minutos
  
    const estaDentroHorarioFuncionamento = 
      (diaDaSemana >= 1 && diaDaSemana <= 5 && horaAtual >= 8 && (horaAtual < 18 || (horaAtual === 18 && minutoAtual <= 0)))//vai funcionar somente apos as 18
      || (diaDaSemana === 6 && horaAtual >= 8 && (horaAtual < 12 || (horaAtual === 12 && minutoAtual <= 0)));
   
    return estaDentroHorarioFuncionamento ? "SIM" : "NAO";
  }

//original
function horarioFuncionamento() {
  const agora = new Date(Date.now() - 3 * 60 * 60 * 1000);
  const diaDaSemana = agora.getUTCDay();
  const horaAtual = agora.getUTCHours();
  const minutoAtual = agora.getUTCMinutes();

  const estaDentroHorarioFuncionamento = 
    (diaDaSemana >= 1 && diaDaSemana <= 5 && horaAtual >= 8 && (horaAtual < 17 || (horaAtual === 17 && minutoAtual <= 30)))
    || (diaDaSemana === 6 && horaAtual >= 8 && (horaAtual < 12 || (horaAtual === 12 && minutoAtual <= 0)));
 
  return estaDentroHorarioFuncionamento ? "SIM" : "NAO";
}