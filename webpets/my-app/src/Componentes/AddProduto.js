import React, { useState } from 'react';
import './AddProduto.css'; // Estilos customizados

const App = () => {
  const [showForm, setShowForm] = useState(false);

  const openForm = () => {
    setShowForm(true);
  };

  const closeForm = () => {
    setShowForm(false);
  };

  return (
    <div className="App">
      <button className="open-form-btn" onClick={openForm}>
        Novo Produto
      </button>

      {showForm && (
        <div className="modal">
          <div className="modal-content">
            <button className="close-btn" onClick={closeForm}>X</button>
            <h2>Adicionar Produto</h2>
            <form>
              <label>Nome Vendedor:</label>
              <input type="text" name="sellerName" required />
              
              <label>Data Vencimento:</label>
              <input type="date" name="expirationDate" required />

              <label>CPF:</label>
              <input type="text" name="cpf" required />

              <label>Nome do Produto:</label>
              <input type="text" name="productName" required />

              <label>Valor Produto:</label>
              <input type="number" name="productValue" required />

              <label>Data Venda:</label>
              <input type="date" name="saleDate" required />

              <label>Endereço Cliente:</label>
              <input type="text" name="clientAddress" required />

              <label>Telefone Cliente:</label>
              <input type="tel" name="clientPhone" required />

              <label>E-mail Cliente:</label>
              <input type="email" name="clientEmail" required />

              <label>Quantidade Vendida:</label>
              <input type="number" name="quantitySold" required />

              <button type="submit">Salvar</button>
              <button type="button" onClick={closeForm}>Cancelar</button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
};

export default App;
