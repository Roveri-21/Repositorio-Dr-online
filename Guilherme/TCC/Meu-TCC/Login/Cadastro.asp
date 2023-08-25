<!-- #include file = Login_class.asp -->
<%

  response.write"<!DOCTYPE html>"
  response.write"<html>"
  response.write"  <head>"
  response.write"    <meta charset='UTF-8'>"
  response.write"    <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
  response.write"    <title>web pets</title>"
  response.write"    <link rel='stylesheet' href='Login.css'>"
  response.write"    <script src='Login.js'></script>"
  response.write"  </head>"
  response.write"  <body>"

  response.write"    <div class='container'>"
  response.write"        <h1>Webpets</h1>"
  response.write"        <h2>Cadastro</h2>"
  response.write"        <form action='Cadastro_insert.asp' method='POST'>"
  response.write"          <label for='nome'>Nome:</label>"
  response.write"          <input type='text' id='nome' name='nome' required>"
  response.write"          <label for='cpf'>CPF:</label>"
  response.write"          <input type='text' id='cpf' name='cpf' required maxlength='11'>"
  response.write"          <label for='email'>E-mail:</label>"
  response.write"          <input type='email' id='email' name='email' required>"
  response.write"          <label for='senha'>Senha:</label>"
  response.write"          <input type='password' id='senha' name='senha' required>"
  response.write"          <button type='submit'>Cadastrar</button>"
  response.write"        </form>"
  If Request.QueryString("msg") = "cpf_cadastrado" Then
    response.write"        <script>alert('CPF já cadastrado. Tente novamente com um CPF diferente.');</script>"
  End If
  response.write"        <p>&copy; 2023 By Guilherme Roveri</p>"
  response.write"      </div>"
  response.write"  </body>"
  response.write"</html>"

%>
