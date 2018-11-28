  <% 

    'declare the variables 
    Dim wfavConn
    Dim wfavConnStr
    Dim Recordset
    Dim wfavSQL
    Dim rsWine_Fav


        'declare the SQL statement that will query the database
        wfavSQL = "SELECT * FROM qry_Vineyard_Favorites WHERE Vineyard_ID > 1 ORDER BY Vineyard_ID DESC, Winery_Name ASC Limit 3"

        'Response.write SQL1
        'define the wfavConn string, specify database driver
        wfavConnStr = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO wfavConn and Recordset objects
        Set wfavConn = Server.CreateObject("ADODB.wfavConn")

        Set rsWine_Fav = Server.CreateObject("ADODB.RecordSet")

        'Open the wfavConn to the database
        wfavConn.Open wfavConnStr


        'Open the Recordset object executing the SQL statement and return records 
        rsWine_Fav.Open wfavSQL,wfavConn


        'first of all determine whether there are any records 
        If rsWine_Fav.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsWine_Fav.Eof   
            'Do While NOT rsFav.Eof
    
	    T_Rest=len(rsWine_Fav("Restaurant"))
	    'Response.write T_Rest
	
	    T_Hours=len(rsWine_Fav("Hours"))
	    'Response.write T_Hours
	
	    T_Taste=len(rsWine_Fav("Tastings"))
	    'Response.write T_Taste

        W_Fave = rsWine_Fav("Vineyard_ID")
        'Response.write W_Fave

        GAdd = replace(rsWine_Fav("location")," ","+")
        GAdd2 = rsWine_Fav("Winery_Name") & ", " & rsWine_Fav("Location") 
	    %>


    <header>
        <a href='vineyard_details.asp?V=<% = rsWine_Fav("Vineyard_ID") %>' class="image"><img alt="<% = rsWine_Fav("Winery_Name") %>" src='<% = rsWine_Fav("Winery_Image") %>' /></a>
	    <br />
        <br />
        <h3><a href='vineyard_details.asp?V=<% = rsWine_Fav("Vineyard_ID") %>'><% = rsWine_Fav("Winery_Name") %></h3>
                                               
        <!--  <a target="_blank" href="https://www.google.com/maps/place/<% =GAdd2 %>"><span class="published"><% = rsWine_Fav("Location") %></span></a>  -->

        <a href="tel:<% = rsWine_Fav("Winery_Phone") %>"><span class="published"><% = rsWine_Fav("Winery_Phone") %></span></a>
        
        <hr />

    </header>
    <%
    rsWine_Fav.MoveNext     
    Loop
    End If
    %>

                                                
    
    <%

    'close the wfavConn and Recordset objects freeing up resources
    rsWine_Fav.Close
    Set rsWine_Fav=nothing
    wfavConn.Close
    Set wfavConn=nothing

    %>
