import React, { useState } from 'react';
import Tabela_Compra from '../Componets/Tabela_Compra';
import Tabela_Entrega from '../Componets/Tabela_Entrega';
import Tabela_Pedido from '../Componets/Tabela_Pedido';
import Tabela_Venda from '../Componets/Tabela_Venda';

function Estoque() {
  // State to track the selected component
  const [selectedComponent, setSelectedComponent] = useState(null);

  // State to track search options
  const [searchOptions, setSearchOptions] = useState({
    nome: '',
    dataInicial: '',
    dataFinal: '',
    periodo: '',
  });

  // Function to handle dropdown change
  const handleDropdownChange = (event) => {
    setSelectedComponent(event.target.value);
  };

  // Function to handle search options change
  const handleSearchChange = (event) => {
    const { name, value } = event.target;
    setSearchOptions((prevOptions) => ({
      ...prevOptions,
      [name]: value,
    }));
  };

  // Function to handle form submission
  const handleSubmit = (event) => {
    event.preventDefault();
    // Here you can add code to send the search options to the API
    console.log('Search options:', searchOptions);
  };

  // Render the selected component based on the dropdown selection
  const renderSelectedComponent = () => {
    switch (selectedComponent) {
      case 'Tabela_Compra':
        return <Tabela_Compra searchOptions={searchOptions} />;
      case 'Tabela_Entrega':
        return <Tabela_Entrega searchOptions={searchOptions} />;
      case 'Tabela_Pedido':
        return <Tabela_Pedido searchOptions={searchOptions} />;
      case 'Tabela_Venda':
        return <Tabela_Venda searchOptions={searchOptions} />;
      default:
        return null;
    }
  };

  return (
    <div className='conteudo'>
      {/* Form for search */}
      <form onSubmit={handleSubmit}>
        {/* Fieldset com opções de busca */}
        <fieldset>
          <legend>Opções de Busca</legend>
          {/* Dropdown menu */}
          <div>
            <label htmlFor="tipoTabela">Selecionar Tabela:</label>
            <select id="tipoTabela" value={selectedComponent} onChange={handleDropdownChange}>
              <option value="">Selecione um tabela</option>
              <option value="Tabela_Compra">Compra</option>
              <option value="Tabela_Entrega">Entrega</option>
              <option value="Tabela_Pedido">Pedido</option>
              <option value="Tabela_Venda">Venda</option>
            </select>
          </div>

          {/* Campos de busca */}
          <div>
            <label htmlFor="buscarNome">Buscar por Nome:</label>
            <input type="text" id="buscarNome" name="nome" value={searchOptions.nome} onChange={handleSearchChange} />
          </div>
          <div>
            <label htmlFor="buscarDataInicial">Data Inicial:</label>
            <input type="date" id="buscarDataInicial" name="dataInicial" value={searchOptions.dataInicial} onChange={handleSearchChange} />
          </div>
          <div>
            <label htmlFor="buscarDataFinal">Data Final:</label>
            <input type="date" id="buscarDataFinal" name="dataFinal" value={searchOptions.dataFinal} onChange={handleSearchChange} />
          </div>
          {/* Adicione mais campos de busca conforme necessário */}

          {/* Botão de busca */}
          <button type="submit">Buscar</button>
        </fieldset>
      </form>

      {/* Render the selected component */}
      {renderSelectedComponent()}
    </div>
  );
}

export default Estoque;
