// EstoquePage.js
//import React, { useState } from 'react';
import EstoqueItem from './EstoqueItem';
// EstoquePage.js
import React, { useState } from 'react';

const EstoquePage = () => {
  const [estoque, setEstoque] = useState([
    { id: 1, nome: 'Produto 1', quantidade: 10, preco: 50, ativo: true },
    { id: 2, nome: 'Produto 2', quantidade: 15, preco: 70, ativo: true },
    { id: 3, nome: 'Produto 3', quantidade: 20, preco: 90, ativo: true },
  ]);
  
  const inativarProduto = (id) => {
    const novoEstoque = estoque.map(item =>
      item.id === id ? { ...item, ativo: !item.ativo } : item
    );
    setEstoque(novoEstoque);
  };

  return (
    <div id='conteudo' className='conteudo'>
      <h1>Estoque</h1>
      <table>
        <thead>
          <tr>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço</th>
            <th>Status</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {estoque.map((produto) => (
            <tr key={produto.id}>
              <td>{produto.nome}</td>
              <td>{produto.quantidade}</td>
              <td>R${produto.preco.toFixed(2)}</td>
              <td>{produto.ativo ? 'Ativo' : 'Inativo'}</td>
              <td>
                <button onClick={() => inativarProduto(produto.id)}>
                  {produto.ativo ? 'Inativar' : 'Ativar'}
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default EstoquePage;
