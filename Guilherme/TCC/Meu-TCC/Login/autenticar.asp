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
    
Dim email, senha, idExiste
email = Request("email")
senha = Request("senha")

Dim MinhaClasse
Set MinhaClasse = New clLogin

MinhaClasse.email = email
MinhaClasse.senha = senha
idExiste = MinhaClasse.Consultar()

If idExiste Then
    Response.Redirect "http://localhost/weblocal/TCC/Home.asp"
Else
    Response.Write "Conta não encontrada"
End If

%>
