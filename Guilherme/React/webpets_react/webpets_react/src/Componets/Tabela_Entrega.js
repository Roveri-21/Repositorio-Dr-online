import React from 'react';

function TabelaEntrega() {
  const data = [
    { dt_chegada: '02/01/2023', dt_entrega: '05/01/2023', ds_modelo_entrega: 'Modelo A', cl_note: 'Note A' },
    { dt_chegada: '03/01/2023', dt_entrega: '06/01/2023', ds_modelo_entrega: 'Modelo B', cl_note: 'Note B' },
    // Adicione mais dados conforme necessário
  ];

  return (
    <div>
      <h2>Tabela de Entregas</h2>
      <table>
        <thead>
          <tr>
            <th>Data Chegada</th>
            <th>Data Entrega</th>
            <th>Modelo Entrega</th>
            <th>Cl Note</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.dt_chegada}</td>
              <td>{item.dt_entrega}</td>
              <td>{item.ds_modelo_entrega}</td>
              <td>{item.cl_note}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default TabelaEntrega;
