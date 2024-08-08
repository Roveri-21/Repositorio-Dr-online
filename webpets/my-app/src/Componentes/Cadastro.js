import React, { useState } from 'react';//Hook função especial que permite utilizar recursos deo react
import Login_estilo from './Login.css';
import { cpfMask } from './Mask';

function Cadastro() {
  const [cpf, setCpf] = useState('');// esta armazenando as informações do CPF

  const handleCpfChange = (e) => {
    setCpf(cpfMask(e.target.value));
  };

  return (
    <div className="container">
      <h2>Cadastro</h2>
      <div>
        <form action='autenticar.asp' method='GET'>
          <input type='hidden' id='id' name='id' />
          <label htmlFor='email'>E-mail</label>
          <input type='email' id='email' name='email' required />
          <label htmlFor='nome'>Nome</label>
          <input type='text' id='nome' name='nome' required />
          <label htmlFor='cpf'>CPF</label>
          <input
            type='text'
            id='cpf'
            name='cpf'
            maxLength={14}
            value={cpf}
            onChange={handleCpfChange}
            required
          />
          <label htmlFor='nascimento'>Data de Nascimento</label>
          <input type='date' id='nascimento' name='nascimento' required />
          <label htmlFor='password'>Senha</label>
          <input type='password' id='senha' name='senha' required />
          <button type='submit'>Entrar</button>
        </form>
      </div>
    </div>
  );
}

export default Cadastro;
