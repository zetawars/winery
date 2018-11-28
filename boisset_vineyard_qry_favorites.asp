  <% 

    'declare the variables 
    Dim Connection
    Dim ConnectionString
    Dim Recordset
    Dim SQL
    Dim rsDining

    M = Session("userid")



        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM qry_Fav_Vineyards where Member_ID<>'"&M&"' and Trail = 'Boisset' ORDER BY ID DESC, Winery_Name ASC Limit 3"

        'Response.write SQL1
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")

        Set rsDining = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString


        'Open the Recordset object executing the SQL statement and return records 
        rsDining.Open SQL,Connection


        'first of all determine whether there are any records 
        If rsDining.EOF  Then 
        Response.Write("You haven't selected any favorite Vineyards") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsDining.Eof   
            'Do While NOT rsFav.Eof
    
	    T_Rest=len(rsDining("Restaurant"))
	    'Response.write T_Rest
	
	    T_Hours=len(rsDining("Hours"))
	    'Response.write T_Hours
	
	    T_Taste=len(rsDining("Tastings"))
	    'Response.write T_Taste

        W_Fave = rsDining("ID")
        'Response.write W_Fave

        GAdd = replace(rsDining("location")," ","+")
        GAdd2 = rsDining("Winery_Name") & ", " & rsDining("Location") 
	    %>


    <header>
        <a href='vineyard_details.asp?V=<% = rsDining("Vineyard_ID") %>' class="image"><img alt="<% = rsDining("Winery_Name") %>" src='<% = rsDining("Winery_Image") %>' /></a>
	    <br />
        <br />
        <h3><a href='vineyard_details.asp?V=<% = rsDining("Vineyard_ID") %>'><% = rsDining("Winery_Name") %></h3>
                                               
        <!--  <a target="_blank" href="https://www.google.com/maps/search/<% =GAdd2 %>"><span class="published"><% = rsDining("Location") %></span></a>  -->

        <a href="tel:<% = rsDining("Winery_Phone") %>"><span class="published"><% = rsDining("Winery_Phone") %></span></a>
        
        <hr />

    </header>
    <%
    rsDining.MoveNext     
    Loop
    End If
    %>

                                                
    
    <%

    'close the connection and Recordset objects freeing up resources
    rsDining.Close
    Set rsDining=nothing
    Connection.Close
    Set Connection=nothing

    %>
