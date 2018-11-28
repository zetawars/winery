
<%

Dim Connection
Dim ConnString
Dim Recordset
Dim SQL
Dim rsFav

if Request.Form("action")="insert" Then
        
        'declare the SQL statement that will query the database
        'SQL = "SELECT * FROM User_Accounts WHERE User_Name='" & Request.Form("login") & "' AND Password='" & Request.Form("password") & "'"
        insert = "INSERT INTO Favorites (Member_ID, Vineyard_ID) VALUES ('" & Request.Form("userid") & "', '" & Request.Form("vineyardid") & "')"
        Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        'Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        'rsFav.Open insert,Connection
        
         Connection.execute(insert)
         Connection.Close
         'set rsFav = Nothing 
        
end if
if Request.Form("action")="delete" Then
        
        'declare the SQL statement that will query the database
        delete = "DELETE FROM Favorites WHERE Member_ID='" & Request.Form("userid") & "' AND Vineyard_ID='" & Request.Form("vineyardid") & "' " 
        Response.write delete
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsFav.Open delete,Connection
        
        Connection.execute(delete)
        
         Connection.Close

end if

if Request.Form("action")="insertEvent" Then
        
        'declare the SQL statement that will query the database
        insert = "INSERT INTO Favorites (Member_ID, Event_ID) VALUES ('" & Request.Form("userid") & "', '" & Request.Form("eventid") & "')"
        Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        'Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        'rsFav.Open insert,Connection
        
         Connection.execute(insert)
         Connection.Close
         'set rsFav = Nothing 
        
end if
if Request.Form("action")="deleteEvent" Then
        
        'declare the SQL statement that will query the database
        delete = "DELETE FROM Favorites WHERE Member_ID='" & Request.Form("userid") & "' AND Event_ID='" & Request.Form("eventid") & "' " 
        Response.write delete
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsFav.Open delete,Connection
        
        Connection.execute(delete)
        
         Connection.Close

end if


if Request.Form("action")="insertDining" Then
        
        'declare the SQL statement that will query the database
        insert = "INSERT INTO Favorites (Member_ID, Dining_ID) VALUES ('" & Request.Form("userid") & "', '" & Request.Form("diningid") & "')"
        Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        'Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        'rsFav.Open insert,Connection
        
         Connection.execute(insert)
         Connection.Close
         'set rsFav = Nothing 
        
end if

if Request.Form("action")="deleteDining" Then
        
        'declare the SQL statement that will query the database
        delete = "DELETE FROM Favorites WHERE Member_ID='" & Request.Form("userid") & "' AND Dining_ID='" & Request.Form("diningid") & "' " 
        Response.write delete
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsFav.Open delete,Connection
        
        Connection.execute(delete)
        
         Connection.Close

end if


if Request.Form("action")="insertWine" Then
        
        'declare the SQL statement that will query the database
        insert = "INSERT INTO Favorites (Member_ID, Wine_ID) VALUES ('" & Request.Form("userid") & "', '" & Request.Form("wineid") & "')"
        Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        'Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        'rsFav.Open insert,Connection
        
         Connection.execute(insert)
         Connection.Close
         'set rsFav = Nothing 
        
end if

if Request.Form("action")="deleteWine" Then
        
        'declare the SQL statement that will query the database
        delete = "DELETE FROM Favorites WHERE Member_ID='" & Request.Form("userid") & "' AND Wine_ID='" & Request.Form("wineid") & "' " 
        Response.write delete
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsFav.Open delete,Connection
        
        Connection.execute(delete)
        
         Connection.Close

end if

%>

