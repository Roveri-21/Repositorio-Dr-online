import React, { useState, useEffect } from 'react';
import './SearchForm.css';
import InputCpfMask from './InputCpfMask'
function SearchForm() {
    return (
        <div className='personal-data'>
            <fieldset id="formularioAdicionar">
                <legend>Pesquisa</legend>
                <label for="nomeVendedor">Nome Vendedor:</label>
                <input type="text" id="nomeVendedor" placeholder="Nome Vendedor" />
                <label for="nomeProduto">Nome Produto:</label>
                <input type="text" id="nomeProduto" placeholder="Nome Produto" />
                <label for="valorProduto">Valor Produto:</label>
                <input type="text" id="valorProduto" placeholder="Valor Produto" />
                <InputCpfMask id="CPF" />
                <label for="dataVencimento">Data de Vencimento:</label>
                <input type="date" id="dataVencimento" placeholder="Data de Vencimento" />
                <button id="buttonAdicionar">Buscar</button>
            </fieldset>
        </div>
    )
}
export default SearchForm;



