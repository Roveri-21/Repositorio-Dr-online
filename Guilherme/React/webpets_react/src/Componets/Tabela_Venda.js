import React from 'react';

function TabelaVenda() {
  const data = [
    { id_venda: 1, nm_produto: 'Produto A', vl_venda: 50, ds_venda: 'Descrição A', dt_venda: '01/01/2023', dt_preparação: '05/01/2023', qtd_produto: 10 },
    { id_venda: 2, nm_produto: 'Produto B', vl_venda: 70, ds_venda: 'Descrição B', dt_venda: '02/01/2023', dt_preparação: '06/01/2023', qtd_produto: 15 },
    // Adicione mais dados conforme necessário
  ];

  return (
    <div>
      <h2>Tabela de Vendas</h2>
      <table>
        <thead>
          <tr>
            <th>ID Venda</th>
            <th>Nome Produto</th>
            <th>Valor Venda</th>
            <th>Descrição Venda</th>
            <th>Data Venda</th>
            <th>Data Preparação</th>
            <th>Quantidade Produto</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id_venda}>
              <td>{item.id_venda}</td>
              <td>{item.nm_produto}</td>
              <td>{item.vl_venda}</td>
              <td>{item.ds_venda}</td>
              <td>{item.dt_venda}</td>
              <td>{item.dt_preparação}</td>
              <td>{item.qtd_produto}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default TabelaVenda;
