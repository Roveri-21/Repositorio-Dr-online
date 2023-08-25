<!-- #include file = Login_class.asp -->
<%
    nome = Request("nome")
    email = Request("email")
    senha = Request("senha")
    cpf = Request("cpf")

    

    'criando objeto 
    dim MinhaClasse 
    set MinhaClasse = new clLogin


    'criando os paramentros
    MinhaClasse.nome =nome
    MinhaClasse.email =email
    MinhaClasse.senha = senha
    MinhaClasse.cpf =cpf
    id = MinhaClasse.Gravar

    conexao.close 
    set conexao = Nothing 
    response.clear
    response.redirect "http://localhost/weblocal/Meu-TCC/Home.ASP?" 
    response.end


%>