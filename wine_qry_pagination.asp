  <% 

  
    W=Server.HtmlEncode(Request("W"))

    'declare the variables 
    Dim Connection
    Dim ConnectionString
    Dim Recordset
    Dim SQL
    Dim rsWine_Pag


        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM Wines WHERE ID='" &W& "'"

        Response.write SQL
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")

        Set rsWine_Pag = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString

        rsWine_Pag.CursorLocation = 3 ' adUseClient

        'Open the Recordset object executing the SQL statement and return records 
        rsWine_Pag.Open SQL,Connection


        'first of all determine whether there are any records 
        If rsWine_Pag.EOF  Then 
            Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
            Do While NOT rsWine_Pag.Eof   
            
            Wine = rsWine_Pag("ID")
            Vineyard = rsWine_Pag("Winery_Number")

            ' Set the page size of the recordset
            rsWine_Pag.PageSize = 1

                        ' Get the number of pages
            nRecordCount = rsWine_Pag.RecordCount
            response.write "Record Count=" & nRecordCount
    
            ' Get the number of pages
            nPageCount = rsWine_Pag.PageCount
            response.write "Page Count=" & nPageCount

            nPage = CLng(Request.QueryString("Page"))
            response.write "Page=" & nPage


            Dim NWine
            'NWine = rsWine_Pag.NextRecordset
            Response.Write NWine

	    %>

<!-- Pagination -->
        <footer>
            <section>						
                       
				<ul class="actions pagination">
                    <% if W > 112 then %>
                        <li><a href="wine_details.asp?V=30&W=112" class=" button big first" ><<</a></li>
						<li><a href="wine_details.asp?V=<% =V %>&W=<% =W-1 %>" class="button big previous">Previous Wine</a></li>
                    <% else %> 
                        <li><a href="wine_details.asp?V=<% =V %>&W=2" class=" disabled button big last" ><<</a></li>
                        <li><a href="wine_details.asp?V=<% =V %>&W=<% =W-1 %>" class=" disabled button big previous">Previous Wine</a></li>
                    <% end if %>

                    <% if V < 42 then %>
			    		<li><a href="wine_details.asp?V=<% =V %>&W=<% =W+1 %>" class="button big next">Next Wine</a></li>
                        <li><a href="wine_details.asp?V=<% =V %>&W=782" class=" button big last" >>></a></li>
                    <% else %> 
                        <li><a href="wine_details.asp?V=<% =V %>&W=<% =W+1 %>" class=" disabled button big next">Next Wine</a></li>
                        <li><a href="wine_details.asp?V=40&W=865" class=" disabled button big last" >>></a></li>
                    <% end if %>
                              
				</ul>
		        </div>
            </section>
        </footer>


        <%
        rsWine_Pag.MoveNext 
       
        Loop
        End If
        %>

                                                
    
        <%

        'close the connection and Recordset objects freeing up resources
        rsWine_Pag.Close
        Set rsWine_Pag=nothing
        Connection.Close
        Set Connection=nothing

        %>
