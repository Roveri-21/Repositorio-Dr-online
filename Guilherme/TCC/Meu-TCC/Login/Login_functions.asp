<%
Sub StartSession(userId)
    Session("LoggedIn") = True
    Session("UserId") = userId
End Sub

Sub EndSession()
    Session.RemoveAll
End Sub

Function IsLoggedIn()
    IsLoggedIn = (Session("LoggedIn") = True)
End Function

Function GetLoggedInUserId()
    GetLoggedInUserId = Session("UserId")
End Function
%>
