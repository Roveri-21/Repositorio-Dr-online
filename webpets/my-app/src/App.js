import logo from './logo.svg';
import './App.css';
import React, { useState, useEffect } from 'react';

function App() {
  const [pageTitle, setPageTitle] = useState('Webpets');
  useEffect(() => {
    document.title = pageTitle;
  }, [pageTitle]);
  const handleTitleChange = (event) => {
    setPageTitle(event.target.value);
  };
  return (
    <div className="container">
      <h2>Login</h2>
      <div>
      <form action='autenticar.asp' method='GET'>
        <input type='hidden' id='id' name='id' />     
        <label for='email'>E-mail:</label>
        <input type='email' id='email' name='email' required/>
        <label for='password'>Senha:</label>
        <input type='password' id='senha' name='senha' required/>
        <button type='submit'>Entrar</button>
      </form>
      <p>Não tem uma conta ainda? <a href='Cadastro.html'>Criar novo cadastro</a></p>
            <p>Esqueceu a senha? <a href='Cadastro.html'>Alterar a senha</a></p>
      </div>
    </div>
  );
}

export default App;
