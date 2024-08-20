import './SearchForm.css';
import InputCpfMask from './InputCpfMask'
import MoneyInput from './MoneyInput'
import InputNameMask from './InputNameMask'

function SearchForm() {
    return (
        <div className='personal-data'>
            <fieldset id="formularioAdicionar">
                <legend id="legendsearch">Pesquisa</legend>
                <InputNameMask/>
                <label for="nomeProduto">Nome Produto:</label>
                <input type="text" id="nomeProduto" placeholder="Nome Produto" />
                <label for="MoneyInput">Valor Produto:</label>
                <MoneyInput/>
                <label for="dataVencimento">Data de Vencimento:</label>
                <input type="date" id="dataVencimento" placeholder="Data de Vencimento" />
                <InputCpfMask/>
                <label for="labelprod">Escolha o stado do Produto:</label>
                <select name="selectstatusprod" id="selectstatusprod">
                    <option value="Vencido">Vencido</option>
                    <option value="Proxvencimento">Proximo do Vencimento</option>
                    <option value="valido">Valido</option>
                </select>
                <button id="buttonsearch">Buscar</button>
            </fieldset>
        </div>
    )
}
export default SearchForm;



