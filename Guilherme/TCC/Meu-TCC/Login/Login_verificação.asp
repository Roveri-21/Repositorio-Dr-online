<!-- #include file = Login_class.asp -->

<%
   on error resume next
                conexao.close
                Set conexao = Nothing
            on error goto 0
            Set conexao = Server.CreateObject("ADODB.Connection")
            Session("ConnectionString") = "Driver={ODBC Driver 17 for SQL Server};Server=DESKTOP-H6VEL24\SQLGUILHERME;database=Webpets;User ID=sa;Pwd=sa.@2;pooling=false;Max Pool Size=5005000;MultipleActiveResultSets=True;Connection Reset=True;Connection Timeout=120;Connection LifeTime=120"
            conexao.ConnectionString = Session("ConnectionString")
            conexao.Open()
%>
<%
login_email= request("email")
login_senha= request("password")

     dim MinhaClasse 
    set MinhaClasse = new clLogin
    MinhaClasse.Email =login_email
    MinhaClasse.Senha =login_senha
    

      conexao.close 
    set conexao = Nothing 
    response.clear
    response.redirect "http://localhost/weblocal/TCC/Home.ASP?email=" & login_email
    response.end
%>