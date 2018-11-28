        <% 

            'declare the variables 
            Dim wConnectionx
            Dim wConnectionStringx
            Dim wRecordsetx
            Dim wSQLx
            Dim rsWines

            'declare the SQL statement that will query the database
            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" &M& "' ORDER BY Tstamp DESC, Winery ASC Limit 3"

            'Response.write SQL1
            'define the connection string, specify database driver
            wConnStringx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

            'create an instance of the ADO connection and Recordset objects
            Set wConnectionx = Server.CreateObject("ADODB.Connection")

            Set rsWines = Server.CreateObject("ADODB.RecordSet")

            'Open the connection to the database
            wConnectionx.Open wConnStringx


            'Open the Recordset object executing the SQL statement and return records 
            rsWines.Open wSQLx,wConnectionx

            'first of all determine whether there are any records 
            If rsWines.EOF  Then 
            Response.Write("") 
            Else
            'if there are records then loop through the fields 
            Do While NOT rsWines.Eof   

            Tstamp = rsWines("Tstamp")
            TStamp = FormatDateTime(Tstamp,2)
            'response.write(FormatDateTime(Tstamp,1))
            'Response.Write "M=" & M

	    %>

		<li>
			<article>
				    <header>
						<h3><a href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>"><% =rsWines("Name") %></a></h3>
                        <a class="author" href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a>
                                                    
						<br />

                        <a href='wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>'>
                            <img alt="<%=rsWines("Tasting_Score")%> star taste!" src="images/<%=rsWines("Tasting_Score")%>-star.png"/>
                        </a>

                        <time class="published" datetime="2015-10-15"><% =TStamp %></time>
					</header>
					<a href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>" class="image"><img src="<% =rsWines("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
				</article>
			</li>

            <%
            rsWines.MoveNext     
            Loop
            End If

            'close the connection and Recordset objects freeing up resources
            rsWines.Close
            Set rsWines=nothing
            wConnectionx.Close
            Set wConnectionx=nothing

            %>

