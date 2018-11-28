<!DOCTYPE html>

<html>
<head>
    
</head>
<body>

    <%
    response.expires=-1
    sql="SELECT * FROM Wines WHERE Varietal=" & "'" & request.querystring("q") & "' ORDER BY Vintage"

    ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

    Set Conn = Server.CreateObject("ADODB.Connection")

    set rs=Server.CreateObject("ADODB.recordset")

    Conn.Open ConnString

    rs.Open sql,conn


    response.write("<b>" & rs("Varietal") & "</b>")
    response.write("<table>")
    do until rs.EOF
      'for each x in rs.Fields
      '  response.write("<tr><td><b>" & x.name & "</b></td>")
      '  response.write("<td>" & x.value & "</td></tr>")
      'next
      response.write("<tr><td><span class=author>&nbsp;&nbsp;&nbsp;<a href='wine_details.asp?V=" & rs("Winery_Number") & "&W=" & rs("ID") & "'>" & rs("Vintage") & " &nbsp; " & rs("Winery") & "</a></span></td>")
      rs.MoveNext
    loop
    response.write("</table>")
    %>

    <%
    'close the connection and Recordset objects freeing up resources
    rs.Close
    Set rs=nothing
    Conn.Close
    Set Conn=nothing

    %>
</body>
</html>
