//import Login_estilo from './Login.css'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

function Login() {
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
      </div>
    </div>
  );
}

export default Login;
