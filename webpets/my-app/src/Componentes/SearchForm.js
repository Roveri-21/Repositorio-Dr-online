import './SearchForm.css';
import InputCpfMask from './InputCpfMask'
import MoneyInput from './MoneyInput'
import InputNameMask from './InputNameMask'

function SearchForm() {
    return (
        <div className='personal-data'>
        <fieldset id="formularioAdicionar">
            <legend id="legendsearch">Pesquisa</legend>
            <div className="field-group">
                <div>
                    <label for="nomeProduto">Nome Produto:</label>
                    <input type="text" id="nomeProduto" placeholder="Nome Produto" />
                </div>
                <div>
                    <label for="MoneyInput">Valor Produto:</label>
                    <MoneyInput />
                </div>
                <div>
                    <label for="dataVencimento">Data de Vencimento:</label>
                    <input type="date" id="dataVencimento" />
                </div>
                <div>
                    <InputCpfMask />
                </div>
                <div>
                    <label for="selectstatusprod">Escolha o estado do Produto:</label>
                    <select id="selectstatusprod">
                        <option value="Vencido">Vencido</option>
                        <option value="Proxvencimento">Proximo do Vencimento</option>
                        <option value="valido">Valido</option>
                    </select>
                </div>
                <div>
                    <button id="buttonsearch">Buscar</button>
                </div>
            </div>
        </fieldset>
    </div>
    
    )
}
export default SearchForm;



