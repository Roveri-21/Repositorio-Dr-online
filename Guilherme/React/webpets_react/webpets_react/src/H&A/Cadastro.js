import React, { useState } from 'react';
// import './FormularioVenda.css';
// import './Front.css';

const FormularioVenda = () => {
  // Estados para armazenar os dados do formulário
  const [quantidadeProduto, setQuantidadeProduto] = useState('');
  const [dataPreparacao, setDataPreparacao] = useState('');
  const [dataVenda, setDataVenda] = useState('');
  const [descricaoVenda, setDescricaoVenda] = useState('');
  const [valorVenda, setValorVenda] = useState('');
  const [nomeProduto, setNomeProduto] = useState('');

  // Função para lidar com o envio do formulário
  const handleSubmit = (e) => {
    e.preventDefault();
    // Aqui, você pode realizar ações com os dados do formulário, como enviá-los para um servidor ou processá-los de alguma outra forma.
    console.log({
      quantidadeProduto,
      dataPreparacao,
      dataVenda,
      descricaoVenda,
      valorVenda: parseFloat(valorVenda.replace(/[^\d]+/g, '')), // Remover formatação antes de enviar
      nomeProduto,
    });
  };

  // Função para tratar Backspace no campo de valor
  const handleBackspace = (e) => {
    if (e.key === 'Backspace' && valorVenda === '0') {
      // Se pressionar Backspace e o valor for '0', definir o valor para uma string vazia
      setValorVenda('');
    }
  };

  return (
    <div id='conteudo' className='conteudo'>
    <form onSubmit={handleSubmit} id='cadastro' className='cadastro' >
    <label>
        Nome do Produto:
        <input
          type="text"
          value={nomeProduto}
          onChange={(e) => setNomeProduto(e.target.value)}
        />
      </label>
      <br />

      <label>
        Quantidade do Produto:
        <input
          type="number"
          value={quantidadeProduto}
          onChange={(e) => setQuantidadeProduto(e.target.value)}
        />
      </label>
      <br />

      <label>
        Data de Preparação:
        <input
          type="date"
          value={dataPreparacao}
          onChange={(e) => setDataPreparacao(e.target.value)}
        />
      </label>
      <br />

      <label>
        Data da Venda:
        <input
          type="date"
          value={dataVenda}
          onChange={(e) => setDataVenda(e.target.value)}
        />
      </label>
      <br />

      

      <label> Valor da Venda R$:
        <div className="label-container">
          <div className="input-container">
            <input
              type="text"
              value={valorVenda}
              onChange={(e) => setValorVenda(e.target.value)}
              onKeyDown={handleBackspace} // Adiciona o evento para tratar Backspace
            />
          </div>
        </div>
      </label>
      <br />


      <label>
        Descrição da Venda:
        <textarea
          value={descricaoVenda}
          onChange={(e) => setDescricaoVenda(e.target.value)}
        />
      </label>
      <br />

      <button type="submit">Enviar</button>
    </form>
    </div>
  );
};

export default FormularioVenda;
