
<%

Dim Connection
Dim ConnString
Dim Recordset
Dim SQL, insert
Dim rsUser
Dim User_ID, UserName


    'SQL = "SELECT * FROM User_Accounts"
    update = "UPDATE User_Accounts SET Password='" & Request.Form("Password") & "' WHERE User_ID ='" & Session("UserID") &"'"
 
    ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
    'create an instance of the ADO connection and Recordset objects
    Set Connection = Server.CreateObject("ADODB.Connection")
'    Set rsUser = Server.CreateObject("ADODB.RecordSet")

    Connection.Open ConnString

        
       
    'Open the Recordset object executing the SQL statement and return records 
    response.write update
    Connection.execute(update)

    Connection.Close
    Response.Write("<br />1")
    Session("loggedin") = True
    Response.Redirect "login.asp"




%>



