<%

Dim Connection
Dim ConnString
Dim Recordset
Dim SQL, insert
Dim rsRating
Dim comment
Dim BottleCount

if Request.Form("score") <> "" And Request.Form("wine") <> "" And Request.Form("member") <> "" And  Request.Form("action") = "insertScore" Then
        
        'Dim rating = Request.Form("rate")
        'Dim member = Request.Form("member")
        'Dim wine = Request.Form("wine")
        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM Members_Notes WHERE Member='" & Request.Form("member") & "' AND Wine='" & Request.Form("wine") & "'"
        insert = "INSERT INTO Members_Notes (Member, Wine, Tasting_Score) VALUES('" & Request.Form("member") & "', '" & Request.Form("wine") & "', '" & Request.Form("score") & "');"
        lastID = "SELECT last_insert_id() as last_id"
        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsRating = Server.CreateObject("ADODB.RecordSet")
        Set rsLastID = Server.CreateObject("ADODB.RecordSet")
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsRating.Open SQL,Connection

        
        If rsRating.EOF Then 
            Connection.execute(insert)
            rsLastID.Open lastID, Connection,adLockPessimistic
            Response.Write rsLastID("last_id") 
            Connection.Close
        Else
            Response.Write rsRating("Tasting_Score") 
            Connection.Close     
        End If
           
                    
end if

if Request.Form("id") <> "" And  Request.Form("action") = "updateScore" Then
        
        'declare the SQL statement that will query the database
        update = "UPDATE Members_Notes SET Tasting_Score='" & Request.Form("score") & "' WHERE ID=" & Request.Form("id")
        'Response.Write update
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        Connection.execute(update)
        Connection.Close
        Response.Write("<br />1")
           
                    
end if

if Request.Form("liked") <> "" And Request.Form("wine") <> "" And Request.Form("member") <> "" And  Request.Form("action") = "insertLike" Then
        
		 
		 Response.Write("Reached")
		 BottleCount = Request.Form("BottleCount")
		
        'Dim rating = Request.Form("rate")
        'Dim member = Request.Form("member")
        'Dim wine = Request.Form("wine")
        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM Members_Notes WHERE Member='" & Request.Form("member") & "' AND Wine='" & Request.Form("wine") & "'"
		If Trim(BottleCount) <> "" Then
			insert = "INSERT INTO Members_Notes (Member, Wine, User_Like, User_Like_Value) VALUES('" & Request.Form("member") & "', '" & Request.Form("wine") & "', '" & Request.Form("liked") & "', '" & Request.Form("BottleCount") & "')"    
		Else
			insert = "INSERT INTO Members_Notes (Member, Wine, User_Like) VALUES('" & Request.Form("member") & "', '" & Request.Form("wine") & "', '" & Request.Form("liked") & "')"
		End If
        lastID = "SELECT last_insert_id() as last_id"
 Response.Write(BottleCount)
        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsRating = Server.CreateObject("ADODB.RecordSet")
        Set rsLastID = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
       
        'Open the Recordset object executing the SQL statement and return records 
        rsRating.Open SQL,Connection
        
        If rsRating.EOF Then 
        Response.Write(insert)
			Connection.execute(insert)
            rsLastID.Open lastID, Connection,adLockPessimistic
            Response.Write rsLastID("last_id")
            Connection.Close
        Else
            Response.Write rsRating("user_like") 
            Connection.Close     
        End If
     
		
                    
end if

if Request.Form("id") <> "" And  Request.Form("action") = "updateLike" Then
        
		'Response.Write("Update Called")
		
        'declare the SQL statement that will query the database
		
		 BottleCount = Request.Form("BottleCount")
		 'Response.Write(BottleCount)
		If Trim(BottleCount) <> "" Then	
			update = "UPDATE Members_Notes SET User_Like='" & Request.Form("liked") & "', User_Like_Value = '" & BottleCount &  "' WHERE ID=" & Request.Form("id")
        Else
			update = "UPDATE Members_Notes SET User_Like='" & Request.Form("liked") & "' WHERE ID=" & Request.Form("id")
        End if
		Response.Write update
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        Connection.execute(update)
        Connection.Close
        'Response.Write("1")
           
                    
end if

if Request.Form("comment") <> "" And Request.Form("wine") <> "" And Request.Form("member") <> "" And  Request.Form("action") = "insertComment" Then
        
        comment = Replace(Request.Form("comment"), "'","\'")
        'Dim member = Request.Form("member")
        'Dim wine = Request.Form("wine")
        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM Members_Notes WHERE Member='" & Request.Form("member") & "' AND Wine='" & Request.Form("wine") & "'"
        insert = "INSERT INTO Members_Notes (Member, Wine, Comments, Publish_Comments) VALUES('" & Request.Form("member") & "', '" & Request.Form("wine") & "', '" & comment & "', '" & Request.Form("isPublish") & "')"
        lastID = "SELECT last_insert_id() as last_id"


        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsComment = Server.CreateObject("ADODB.RecordSet")
        Set rsLastID = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsComment.Open SQL,Connection
        
        If rsComment.EOF Then 
            Connection.execute(insert)
            rsLastID.Open lastID, Connection,adLockPessimistic
            Response.Write rsLastID("last_id")
            Connection.Close
        Else
            Response.Write rsComment("Comments") 
            Connection.Close     
        End If
           
                    
end if

if Request.Form("id") <> "" And  Request.Form("action") = "updateComment" Then
        
        comment = Replace(Request.Form("comment"), "'","\'")
        'declare the SQL statement that will query the database
        update = "UPDATE Members_Notes SET Comments='" & comment & "', Publish_Comments='" & Request.Form("isPublish") & "' WHERE ID=" & Request.Form("id")
        'Response.Write update
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        Connection.execute(update)
        Connection.Close
        Response.Write ("1")
           
                    
end if


if Request.Form("vUser") <> "" And Request.Form("vWID") <> "" And Request.Form("action") = "insertVDate" Then
        
        
        vResturant = Replace(Request.Form("vRest"), "'","\'")
        vTasting =   Replace(Request.Form("vTasting"), "'", "\'")
		vWName = Replace(Request.Form("vWName"), "'","\'")
		vRest  = Replace(Request.Form("vRest"), "'","\'")
		
        'declare the SQL statement that will query the database
        SQL = "SELECT *, count(*) count  FROM Vineyard_Tour WHERE Member_ID='" & Request.Form("vUser") & "' AND Winery_ID='" & Request.Form("vWID") & "'"
        insert = "INSERT INTO Vineyard_Tour (Member_ID, Winery_Name, Location, Winery_Phone, Winery_ID, Restaurant, Tastings, Winery_Logo, Visit_Date) VALUES('" & Request.Form("vUser") & "', '" & vWName & "', '" & Request.Form("vLoc") & "', '" & Request.Form("vPhone") & "', '" & Request.Form("vWID") & "', '" & vRest & "', '" & Request.Form("vTasting") & "', '" & Request.Form("vImg") & "', '" & Request.Form("visitDate") & "')"
        lastID = "SELECT last_insert_id() as last_id"


        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set rsTour = Server.CreateObject("ADODB.RecordSet")
        Set rsLastID = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsTour.Open SQL,Connection
        Dim count 
        count = rsTour.RecordCount
        If rsTour.EOF Then
            Connection.execute(insert)
            rsLastID.Open lastID, Connection,adLockPessimistic
            Response.Write rsTour("last_id") 
            Connection.Close
            
        ElseIf count >= 2 Then 
            
                Response.Write rsTour("Visit_Date") 
                Connection.Close
        ElseIf count < 2 Then

                Connection.execute(insert)
                rsLastID.Open lastID, Connection,adLockPessimistic
                Response.Write rsLastID("last_id")            
                Connection.Close
                
        End if           
                    
end if


if Request.Form("vUser") <> "" And Request.Form("futureID") <> "" And Request.Form("vWID") <> "" And Request.Form("TourID") And Request.Form("action") = "updateVDate" Then
        
        
        'declare the SQL statement that will query the database
        update = "UPDATE Vineyard_Tour SET Visit_Date='" & Request.Form("visitDate") & "' WHERE ID="&Request.Form("futureID")
        'lastID = "SELECT last_insert_id() as last_id"


        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        
        'Open the connection to the database
        Connection.Open ConnString
        Connection.execute(update)
        Connection.Close
        Response.Write("updated")
        
           
                    
end if


if Request.Form("TourID") <> "" And Request.Form("action") = "deleteVDate" Then
        
                'declare the SQL statement that will query the database
        delete = "DELETE FROM Vineyard_Tour WHERE ID="&Request.Form("TourID")
        'lastID = "SELECT last_insert_id() as last_id"


        'Response.write SQL
        'Response.write insert
        
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        
        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        
        'Open the connection to the database
        Connection.Open ConnString
        Connection.execute(delete)
        Connection.Close
        Response.Write("deleted")
                    
end if
%>



