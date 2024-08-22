import React, { useState } from 'react';
import './DataTable.css';

function DataTable() {
   const [selectedColumns, setSelectedColumns] = useState([
      'Nome Vendedor', 'Data Vencimento', 'CPF', 'Nome do Produto', 'Valor Produto'
   ]);
   const [isMenuVisible, setIsMenuVisible] = useState(false);
   const [rowsPerPage, setRowsPerPage] = useState(10);

   const columns = [
      'Nome Vendedor', 'Data Vencimento', 'CPF', 'Nome do Produto', 'Valor Produto',
      'Data Venda', 'Endereço Cliente', 'Telefone Cliente', 'E-mail Cliente', 'Quantidade Vendida'
   ];

   const data = [
      { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 },
      { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 }, { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 }, { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 }, { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 }, { vendedor: 'Carlos Oliveira', vencimento: '20/12/2023', cpf: '111.222.333-44', produto: 'Captão dog', valor: 'R$500,00', dataVenda: '01/12/2023', endereco: 'Rua A, 123', telefone: '(11) 1111-1111', email: 'carlos@example.com', quantidade: 2 },
      { vendedor: 'Maria Souza', vencimento: '10/05/2023', cpf: '987.654.321-11', produto: 'Magnus', valor: 'R$400,00', dataVenda: '15/04/2023', endereco: 'Rua B, 456', telefone: '(22) 2222-2222', email: 'maria@example.com', quantidade: 1 },
      // ... mais dados
   ];

   const handleColumnChange = (column) => {
      setSelectedColumns(prev =>
         prev.includes(column)
            ? prev.filter(col => col !== column)
            : [...prev, column]
      );
   };

   return (
      <div className="tabela" id="tabela">
         <fieldset id="FieldseTable">
            <legend id="legendTable">Últimas Vendas</legend>

            <button className="toggle-menu" onClick={() => setIsMenuVisible(!isMenuVisible)}>
               Adicionar Colunas
            </button>

            {isMenuVisible && (
               <div className="column-selector">
                  {columns.map(column => (
                     <label key={column}>
                        <input
                           type="checkbox"
                           checked={selectedColumns.includes(column)}
                           onChange={() => handleColumnChange(column)}
                        />
                        {column}
                     </label>
                  ))}
               </div>
            )}

            <div className="table-wrapper">
               <table id="tabelaProdutos" className="tabelaProdutos">
                  <thead>
                     <tr>
                        {selectedColumns.includes('Nome Vendedor') && <th>Nome Vendedor</th>}
                        {selectedColumns.includes('Data Vencimento') && <th>Data Vencimento</th>}
                        {selectedColumns.includes('CPF') && <th>CPF</th>}
                        {selectedColumns.includes('Nome do Produto') && <th>Nome do Produto</th>}
                        {selectedColumns.includes('Valor Produto') && <th>Valor Produto</th>}
                        {selectedColumns.includes('Data Venda') && <th>Data Venda</th>}
                        {selectedColumns.includes('Endereço Cliente') && <th>Endereço Cliente</th>}
                        {selectedColumns.includes('Telefone Cliente') && <th>Telefone Cliente</th>}
                        {selectedColumns.includes('E-mail Cliente') && <th>E-mail Cliente</th>}
                        {selectedColumns.includes('Quantidade Vendida') && <th>Quantidade Vendida</th>}
                     </tr>
                  </thead>
                  <tbody>
                     {data.slice(0, rowsPerPage).map((row, index) => (
                        <tr key={index}>
                           {selectedColumns.includes('Nome Vendedor') && <td>{row.vendedor}</td>}
                           {selectedColumns.includes('Data Vencimento') && <td>{row.vencimento}</td>}
                           {selectedColumns.includes('CPF') && <td>{row.cpf}</td>}
                           {selectedColumns.includes('Nome do Produto') && <td>{row.produto}</td>}
                           {selectedColumns.includes('Valor Produto') && <td>{row.valor}</td>}
                           {selectedColumns.includes('Data Venda') && <td>{row.dataVenda}</td>}
                           {selectedColumns.includes('Endereço Cliente') && <td>{row.endereco}</td>}
                           {selectedColumns.includes('Telefone Cliente') && <td>{row.telefone}</td>}
                           {selectedColumns.includes('E-mail Cliente') && <td>{row.email}</td>}
                           {selectedColumns.includes('Quantidade Vendida') && <td>{row.quantidade}</td>}
                        </tr>
                     ))}
                  </tbody>
               </table>
            </div>

            <div className="footer">
               <select className="itemlimit" id="rowsPerPage" value={rowsPerPage} onChange={(e) => setRowsPerPage(Number(e.target.value))}>
                  <option value={5}>5</option>
                  <option value={10}>10</option>
                  <option value={15}>15</option>
               </select>
            </div>
         </fieldset>
      </div>
   );
}

export default DataTable;
