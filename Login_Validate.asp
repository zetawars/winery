<%

    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
	
    'response.write PrevURL

    If W <> "" then
        R = Server.HtmlEncode(Request("requester")) & "&W=" & W
    Else
        R = Server.HtmlEncode(Request("requester"))
    End if

    Response.Write(R)
    
'If Request.Form("action")="Login_Validate" Then
   'the form has been submitted
Dim Connection
Dim ConnString
Dim Recordset
Dim SQL
Dim rsUser


'declare the SQL statement that will query the database
SQL = "SELECT * FROM User_Accounts WHERE User_Name='" & fixQuotes(Request.Form("login")) & "' AND Password='" & fixQuotes(Request.Form("password")) & "'"
'Response.write SQL
'define the connection string, specify database driver
ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

'create an instance of the ADO connection and Recordset objects
Set Connection = Server.CreateObject("ADODB.Connection")
Set rsUser = Server.CreateObject("ADODB.RecordSet")

'Open the connection to the database
Connection.Open ConnString

'Open the Recordset object executing the SQL statement and return records 
rsUser.Open SQL,Connection

'first of all determine whether there are any records 
If rsUser.EOF  Then 
     MsgErr = "<h3>Authorization Failed.</h3>" & "<br />" & "<a href=login.asp>Please try again.</a>"
     Response.Write MsgErr

    If R = "" then
        Response.Redirect "login.asp?LoginFail=1"
    Else
        Response.Redirect "login.asp?LoginFail=1&requester=" & R
    End If
 Else
          'check password
          If rsUser("Password")=Request.Form("password") Then
               'username/password valid
               'save session data
               Session("loggedin") = True
               Session("userid") = rsUser("User_ID")
               Session("locale") = rsUser("Locale")
			   Session("Role") = rsUser("Role")
               Session("ID") = rsUser("ID")
               Session("username") = rsUser("F_Name")
               'redirect to members area
                
				Response.Cookies("user").Expires=dateadd("D",1,Date())
				Response.Cookies("user")("loggedin") = True
				Response.Cookies("user")("userid") = rsUser("User_ID")
				Response.Cookies("user")("ID") = rsUser("ID")
				Response.Cookies("user")("username") = rsUser("F_Name")
				Response.Cookies("user")("Role") = rsUser("Role")
				
    'testing for Boisset login
                If Session("locale") = "Boisset" then 
                    Response.Redirect "boissetcollection.asp"
                End If

                If Len(Request("requester")) > 0 Then
                	Response.Redirect R
                    'response.write R 
                Else
                  	Response.Redirect "home.asp"
                    Response.End

                End if

          Else
               'invalid password
               MsgErr = "<h3>Your user and password combination does not match our records :(</h3>" & "<br />" & "<a href=login.asp>Please try again.</a>"
               Response.Write MsgErr
          End If
      End If
'End If

'function to manage qoutes in string data for SQL Query
Function fixQuotes(strData)
  fixQuotes = Replace(strData,"'","''")
End Function


're-set session data (ie log out)
For each x in Request.Cookies
			Response.Cookies(x).Expires = DateAdd("d",-1,now())
		  if Request.Cookies(x).HasKeys then
			For each y in Request.Cookies(x)
			  Response.Cookies(x)(y).Expires = DateAdd("d",-1,now())
			next
		  end if
		Next
	
Session("loggedin")=false
Session("userid")=""
Session("ID")=""

%>



