<!-- #include file = Login_class.asp -->
<%
    response.write"<!DOCTYPE html>"
    response.write"<html>"
    response.write"  <head>"
    response.write"    <meta charset='UTF-8'>"
    response.write"    <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
    response.write"    <title>webpets</title>"
    response.write"    <link rel='stylesheet' href='Login.css'>"
    response.write"    <script src='Login.js'></script>"
    response.write"  </head>"
    response.write"  <body>"
    response.write"  "
    response.write"    <div class='container'>"
    response.write"        <img src='imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg' alt='Logo'>"
    response.write"        <h2>Login</h2>"
    response.write"        <form action='autenticar.asp' method='POST'>"
    response.write "         <input type='hidden' id='id' name='id' >"      
    response.write"          <label for='email'>E-mail:</label>"
    response.write"          <input type='email' id='email' name='email' required>"
    response.write"          <label for='password'>Senha:</label>"
    response.write"          <input type='password' id='senha' name='senha' required>"
    response.write"        <p>Não tem uma conta ainda? <a href='Cadastro.asp'>Criar novo cadastro</a></p>"
    response.write"        <p>Esqueceu a senha? <a href='Cadastro.asp'>Alterar a senha</a></p>"
    response.write"          <button type='submit'>Entrar</button>"
    response.write"        </form>"
    response.write"        <p>&copy; 2023 By Guilherme Roveri</p>"
    response.write"      </div>"
    response.write"      "
    response.write"  </body>"
    response.write"</html>"
%>