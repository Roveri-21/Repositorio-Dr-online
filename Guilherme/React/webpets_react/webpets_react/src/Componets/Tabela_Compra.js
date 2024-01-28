import React from 'react';

function TabelaCompra() {
  const data = [
    { id_produto: 1, img_produto: 'imagem1.png', nm_produto: 'Produto A', ds_produto: 'Descrição A', vl_estoque: 100, vl_produto_venda: 50, dt_compra: '01/01/2023' },
    { id_produto: 2, img_produto: 'imagem2.png', nm_produto: 'Produto B', ds_produto: 'Descrição B', vl_estoque: 150, vl_produto_venda: 70, dt_compra: '02/01/2023' },
    // Adicione mais dados conforme necessário
  ];

  return (
    <div>
      <h2>Tabela de Compras</h2>
      <table>
        <thead>
          <tr>
            <th>ID Produto</th>
            <th>Imagem Produto</th>
            <th>Nome Produto</th>
            <th>Descrição Produto</th>
            <th>Valor Estoque</th>
            <th>Valor Produto Venda</th>
            <th>Data Compra</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id_produto}>
              <td>{item.id_produto}</td>
              <td><img src={item.img_produto} alt={item.nm_produto} /></td>
              <td>{item.nm_produto}</td>
              <td>{item.ds_produto}</td>
              <td>{item.vl_estoque}</td>
              <td>{item.vl_produto_venda}</td>
              <td>{item.dt_compra}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default TabelaCompra;
