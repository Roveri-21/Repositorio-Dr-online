import React from 'react';

function TabelaPedido() {
  const data = [
    { id_produto: 1, preparação: 'Preparação A' },
    { id_produto: 2, preparação: 'Preparação B' },
    // Adicione mais dados conforme necessário
  ];

  return (
    <div>
      <h2>Tabela de Pedidos</h2>
      <table>
        <thead>
          <tr>
            <th>ID Produto</th>
            <th>Preparação</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id_produto}>
              <td>{item.id_produto}</td>
              <td>{item.preparação}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default TabelaPedido;
