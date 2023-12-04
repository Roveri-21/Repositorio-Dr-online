import React from 'react';
function Form() {
    return (
      <form action='autenticar.asp' method='POST'>
        <input type='hidden' id='id' name='id' />
        <label htmlFor='email'>E-mail:</label>
        <input type='email' id='email' name='email' required />
        <label htmlFor='password'>Senha:</label>
        <input type='password' id='senha' name='senha' required />
        <p>Não tem uma conta ainda? <a href='Cadastro.html'>Criar novo cadastro</a></p>
        <p>Esqueceu a senha? <a href='Cadastro.html'>Alterar a senha</a></p>
        <button type='submit'>Entrar</button>
      </form>
    );
  }
  export default Form;