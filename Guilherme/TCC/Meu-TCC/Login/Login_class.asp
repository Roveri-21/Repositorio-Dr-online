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
    Class clLogin
        
        private sEmail
        private sSenha
        private sExiste
        private sId
        private sNome
        private sCPF


        public property get CPF()
            CPF = sCPF
        end property

        public property get Nome()
            Nome = sNome
        end property

        public property get Email()
            Email = sEmail
        end property

        public property get Senha()
            Senha = sSenha
        end property

        public property get Existe()
            Existe = sExiste
        end property

        public property get Id()
            Id = sId
        end property

        public property let CPF(cpf_user)
            sCPF = cpf_user
        end property

         public property let Nome(nome_user)
            sNome = nome_user
        end property

        public property let Email(email_user)
            sEmail = email_user
        end property

        public property let Senha(senha_user)
            sSenha = senha_user
        end property

        public property let Id(user_id)
            sId = user_id
            if sId <> "" then 
                call Consultar("id=0" & sId)
            else
                sExiste = false
            end if
        end property
        
         function Gravar() 

                sSQL = "SELECT COUNT(cpf),COUNT(Email) FROM cadastros WHERE cpf = '" & sCPF & "' and Email='" & sEmail & "' "
                set rs = conexao.execute(sSQL)
                if rs(0) > 0 then
                    response.write "<script>alert('CPF já cadastrado tente novamente com outro CPF.');</script>"
                    response.write "<script>window.location.href='http://localhost/weblocal/TCC/Login/Cadastro.asp';</script>"
                end if
            
            if not sExiste then 
                sSQL = "insert into cadastros(nm_pessoa,CPF,Senha,Email)"
                sSQL = sSQL & " VALUES('" & sNome & "','" & sCPF & "','" & sSenha & "','" & sEmail & "')"
                conexao.execute(sSQL)
            else    

                sSQL = "update cadastros"
                sSQL = sSQL & " set nm_pessoa=('" & sNome & "'),"
                sSQL = sSQL & " senha =(" & sSenha & ")"
                sSQL = sSQL & " email =(" & sEmail & ")"
                sSQL = sSQL & " cpf =(" & sCPF & ")"
                sSQL = sSQL & " where idcadastro =0" & sId'pode causar problema


                conexao.execute(sSQL)
                Gravar = sId ' <<
  
            end if 
        
        END function


 Function Consultar()

    Dim result
    
    sSQL = "SELECT idcadastro FROM cadastros WHERE email = '" & sEmail & "' AND senha = '" & sSenha & "' "
    Set rs = conexao.execute(sSQL)
    
    If Not rs.EOF And Not rs.BOF Then
        result = rs("idcadastro")
    Else
        result = 0
    End If
    
    If result > 0 Then
        Consultar = True
    Else
        Consultar = False
        
    End If
End Function









    
    end class
%>