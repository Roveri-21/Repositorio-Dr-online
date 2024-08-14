import React, { useState } from 'react'; // Hook função especial que permite utilizar recursos do React
import { cpfMask } from './Mask'
import './InputCpfMask.css';

function InputCpfMask() { // Nome da função componente com letra maiúscula
  const [cpf, setCpf] = useState(''); // Armazenando as informações do CPF

  const handleCpfChange = (e) => {
    setCpf(cpfMask(e.target.value));
  };

  return (
    <div id="CPF" >
      <label htmlFor='cpf'>Cpf:</label> {/* Corrigido para htmlFor */}
      <input
        type='text'
        id='cpf'
        name='cpf'
        maxLength={14}
        value={cpf}
        onChange={handleCpfChange}
        required
      />
    </div>
  );
}
export default InputCpfMask;