
<%

Dim Connection
Dim ConnString
Dim Recordset
Dim SQL, insert
Dim rsUser
Dim User_ID, UserName

        User_Name =Left(Request.Form("Email"),(InStrRev(Request.Form("Email"),"@") -1))

        SQL = "SELECT * FROM User_Accounts"
        lastID = "SELECT Max(User_Accounts.ID) AS LastID FROM User_Accounts;"

        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsUser = Server.CreateObject("ADODB.RecordSet")
        Set rsLastID = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        rsLastID.Open lastID, Connection,adLockPessimistic

        
        Select Case len(rsLastID("LastID"))
        Case 1 
            User_ID = "2016000" & rsLastID("LastID")+1
        Case 2
            User_ID = "201600" & rsLastID("LastID")+1
        Case 3
            User_ID = "20160" & rsLastID("LastID")+1
        Case 4
            User_ID = "2016" & rsLastID("LastID")+1
        End Select

        insert = "INSERT INTO User_Accounts (User_ID, User_Name, F_Name, L_Name, E_Mail, Zip, Password) VALUES('" & User_ID & "', '" & User_Name & "', '" & Request.Form("FName") & "', '" & Request.Form("LName") & "', '" & Request.Form("Email") & "', '" & Request.Form("Zip") & "', '" & Request.Form("Password") &"')"
        
        'Open the Recordset object executing the SQL statement and return records 
        rsUser.Open SQL, Connection
        

on error resume next
connection.Execute insert,recaffected
if err<>0 then
  Response.Write("The system failed to add a new member. <a href='login_new.asp'>Click here to try again.</a>")
else
  'Response.Write("<h3>" & recaffected & " record added</h3>")
  'Response.Write Last_ID
  'Response.Write User_ID
               Session("loggedin") = True
               Session("userid") = User_ID
               
               Session("username") = Request.Form("FName")
   Response.Redirect "home.asp"
end if
connection.close






%>



