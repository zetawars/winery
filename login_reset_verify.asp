
<%

Dim Connection
Dim ConnString
Dim Recordset
Dim SQL, insert
Dim rsUser
Dim User_ID, UserName

        'User_Name =Left(Request.Form("Email"),(InStrRev(Request.Form("Email"),"@") -1))

        SQL = "SELECT * FROM User_Accounts WHERE L_Name = '" & Request.Form("LName") & "' AND E_Mail = '" & Request.Form("EMail") & "' AND Zip = '" & Request.Form("Zip") & "'"
        
        response.write SQL & "<br />"
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsUser = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString

        rsUser.Open SQL,Connection

        'first of all determine whether there are any records 
        If rsUser.EOF  Then 
            
            Response.Redirect "login_reset.asp?X=1 "
            'Response.Write "<br />" & Request.Form("LName") & "-" & Request.Form("EMail") & "-" & Request.Form("zip")
        Else
        'if there are records then loop through the fields 
        Do While NOT rsUser.Eof  

            'response.write rsUser("User_ID") & rsUser("L_Name") & ", " & rsUser("F_Name")
            Session("userid") = rsUser("User_ID")
            Session("LName") = rsUser("L_Name")
            Session("EMail") = rsUser("E_Mail")
            Session("Zip") = rsUser("Zip")

            Response.Redirect "login_reset.asp?X=2"

        rsUser.MoveNext     
        Loop
        End If



        'close the connection and Recordset objects freeing up resources
        rsUser.Close
        Set rsUser=nothing
        Connection.Close
        Set Connection=nothing



%>



