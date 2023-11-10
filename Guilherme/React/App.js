import React from 'react';
import './Login.css';

class Login extends React.Component {
  render() {
    return (
      <html>
        <head>
          <meta charSet='UTF-8' />
          <meta name='viewport' content='width=device-width, initial-scale=1.0' />
          <title>webpets</title>
          <link rel='stylesheet' href='Login.css' />
          <script src='Login.js'></script>
        </head>
        <body>
          <div className='container'>
            <img src='imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg' alt='Logo' />
            <h2>Login</h2>
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
            <p>&copy; 2023 By Guilherme Roveri</p>
          </div>
        </body>
      </html>
    );
  }
}

export default Login;
