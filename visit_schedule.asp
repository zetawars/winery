<%

    M=Session("userid")
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    D=Server.HtmlEncode(Request("D"))
    
     
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=visit_schedule.asp")  
    End If


%>

<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Save Your Cork: Temecula by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">
	</head>
	<body>

<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
			<header id="header">
				<h1><a href="home.asp">Save Your Cork: Temecula</a></h1>
				<nav class="links">
                    <!-- #include file="links.html"-->
				</nav>
				<nav class="main">
					<ul>
						<li class="search">
							<!--#include file="search_anime.html"-->
						</li>
						<li class="menu">
							<a class="fa-bars" href="#menu">Menu</a>
						</li>
					</ul>
				</nav>
			</header>

		<!-- Menu -->
			<section id="menu">

				<!-- Actions -->
					<!--#include file="login_action.html"-->

				<!-- Search -->
					<!--#include file="search.html"-->

				<!-- Links -->
                        
                <!--#include file="links_menu.html"-->

			</section>


<!-- Main -->
<div id="main">
    <article class="post">
		
									
        <% 
    
        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsTour, rsFav
        Dim Loca


        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM qry_Vineyard_Tour WHERE Member_ID='" &M& "' ORDER BY Visit_Date DESC, Winery_Name ASC"
        SQL1 = "SELECT * FROM Favorites WHERE Member_ID='" &M& "' ORDER BY Vineyard_ID DESC"
        'Response.write SQL1
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set Connection1 = Server.CreateObject("ADODB.Connection")

        Set rsTour = Server.CreateObject("ADODB.RecordSet")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        Connection1.Open ConnString

        'Open the Recordset object executing the SQL statement and return records 
        rsTour.Open SQL,Connection
        rsFav.Open SQL1,Connection1

        'first of all determine whether there are any records 
        If rsTour.EOF  Then 
        Response.Write("No wineries have been scheduled for visit. <a href='vineyard_list.asp'>Click here for the winery list.</a>") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsTour.Eof   
            'Do While NOT rsFav.Eof

        GAdd = replace(rsTour("Location")," ","+")
        GMapName = replace(rsTour("Winery_Name")," ","+")
        
        GDir = GMapName & "+" & GAdd
        
        VDate = rsTour("Visit_Date")

        
        GMAP="https://www.google.com/maps/dir"

        Response.write GAdd2
        Loca =Left(rsTour("Location"),(InStrRev(rsTour("Location"),",") -1))

	    %>

        
	    <%
	    DIM GroupName,tmpGroupName
	    GroupName=rsTour("Visit_Date")
	    If GroupName <> tmpGroupName then
	    tmpGroupName=GroupName   

        Dim VDate
        Dim SQL2
        Dim rsMap
        Dim MapTest, MapTest2, DirMap, VCount
        
        VDate = Year(VDate) & "-" & Month(VDate) & "-" & Day(VDate)
        SQL2 = "SELECT * FROM qry_Vineyard_Tour WHERE Member_ID ='" & M & "' AND Visit_Date ='" & VDate & "'"
        'ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"
        Set Connection2 = Server.CreateObject("ADODB.Connection")
        Set rsMap = Server.CreateObject("ADODB.RecordSet")
        Connection2.Open ConnString
        rsMap.Open SQL2,Connection2
        
        VCount = 0
        Do Until rsMap.EOF
            MapTest = replace(rsMap("Winery_Name")," ","+") & "+" & replace(rsMap("Location")," ","+")'rsMap("Winery_Name")
            MapTest2 = "/" & MapTest & MapTest2
            VCount = VCount+1
            rsMap.MoveNext
        Loop
        
        If VCount = 1 then
            DirMap = "https://www.google.com/maps/search" & MapTest2
        Else
            DirMap = "https://www.google.com/maps/dir" & MapTest2
        End If
            
        'response.write GMAP & MapTest2
        'response.write VCount

        MapTest2=""

        rsMap.Close
        Set rsMap=nothing
        Connection2.Close
        Set Connection2=nothing           
	    %>
        
        <span class="author" style="text-align: left; font-size:14px; font-weight:bold; width: 150px">Visit Date: <%=tmpGroupName%></span>
        <span style="margin-left: 55%"></span><a target="_blank" href="<% =DirMap %>"><span style="text-align: right; font-size:14px; font-weight:bold; " class=""><img alt="winery visit" src='images/icon_tour.png' width="30" height="30" border="0" style="float: right; " /></span></a>

	    <% end if %> 

      <article class="post"> 
        <header>
            <div class="title2">
                <a href='vineyard_details.asp?V=<%=rsTour("Winery_ID")%>' ><img width="300" alt="<%=rsTour("Winery_Name")%>" src='<%=rsTour("Winery_Image")%>'  /></a>
                <br />
                <ul class="icons" style="font-size:12px;color:#990033; float: right;">
                    <li><a class="xfa-pencil" ></a></li>
                    <li><a class="xfa-trash-o" ></a></li>
                </ul>                

</*img*/ alt="winery visit" src='images/icon_planning.jpg' width="30" height="30" border="0" style="float: right; " />
            </div>
            <div class="title2" style="margin-left: 20px">

                <h3>
                        <a class="published" href='vineyard_details.asp?V=<%=rsTour("Winery_ID")%>'><%=rsTour("Winery_Name")%></a>   
                </h3>    
                <a target="_blank" href="https://www.google.com/maps/search/<% =GDir %>"><span class="published"><% =Loca %></span></a>
                                
               <br /><span class="published"><b>Phone: </b><a href="tel:<%=rsTour("Winery_Phone")%>"><%=rsTour("Winery_Phone")%></a></span>
                                                
                <% if T_Rest > 6 then %>
	                <br /><span class="published"><b>Restaurant: </b><a class="published" href='dining_details.asp?VD=<%=rsTour("Winery_ID")%>'><%=rsTour("Restaurant")%></a></span>
                                    
                <% end if %>
                                                
                <% if T_Hours > 6 then %>     
                    <br /><span class="published"><b>Hours:</b> <%=rsTour("Hours")%> </span>
	                                                   
                <% end if %>
                      
            </div>
        </header>  
        </article> 
                        
        <%
        rsTour.MoveNext     
        Loop
        End If

        'close the connection and Recordset objects freeing up resources
        rsTour.Close
        Set rsTour=nothing
        Connection.Close
        Set Connection=nothing
        %>

	</div>

<!-- Sidebar -->
	<section id="sidebar">

	<!-- Intro -->
		<section id="intro">
			<a href="home.asp" class="image featured" ><img src="images/header_doffo.png" alt="" /></a>
			<header>
				<span style="font-size: 37px; font-weight:bold; color:Black">Save Your Cork: Temecula</span>
				<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
			</header>
		</section>
        

<!-- Database results for last 3 reviewed vines -->        
		<section>Some of my recent tastings...
		<div class="mini-posts">

		<!-- Mini Post -->
		<article class="post">
		<ul class="posts">    

        <% 

            'declare the variables 
            Dim wConnectionx
            Dim wConnectionStringx
            Dim wRecordsetx
            Dim wSQLx
            Dim rsWines

            'declare the SQL statement that will query the database
            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" & session("userid") & "' ORDER BY Tstamp DESC, Winery ASC Limit 3"

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
						<h3><a href="wine_details.asp?W=<% =rsWines("Wine") %>&V=<% =rsWines("Vineyard") %>"><% =rsWines("Name") %></a></h3>
                        <time class="published" datetime="2015-10-15"><a href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a></time>
						
                        <br />
                        <time class="published" datetime="2015-10-15"><% =TStamp %></time>
                        
					</header>
					<a href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>" class="image"><img src="<% =rsWines("Image_Location") %>" alt="<% =rsWines("Winery") %>: <% =rsWines("Name") %>" style="border: 1px dotted #C0C0C0" /></a>
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
            
            </ul>
			</article>        
        	<ul class="actions">
			<li><a href="vineyard_list.asp" class="button big">View all of Temecula's wineries</a></li>
		</ul>
	</div>
</section>
			<!-- Posts List for Advertisements-->


			<!-- About -->
				<section class="blurb">
					<h2>Tasting School</h2>
					<p><img alt="" src="images/tasting_notes.jpg" width="136" style="float: right; margin-left: 5px;" />
                    Learning how to taste wines is a simple adventure that will deepen  your appreciation for wines and winemakers. 
                            Look, smell, taste: Starting with your basic senses, you will learn how to appreciate wines in no time! You can smell thousands of unique scents, 
                            but your taste perception is limited to salty, sweet, sour and bitter. It is the combination of smell and taste that allows you to discern flavor.</p>
					<ul class="actions">
						<li><a href="tasting_school.asp" class="button">Learn More</a></li>
					</ul>
				</section>

			<!-- Footer -->
				<section id="footer">
					<ul class="icons">
						<li><a class="fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a class="fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a class="fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a class="fa-rss"><span class="label">RSS</span></a></li>
						<li><a class="fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					<p class="copyright">&copy; Save Your Cork. Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
				</section>

		</section>

</div>

<!-- Scripts -->
	<script type="text/javascript" src="html5/imperfect/assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="html5/imperfect/assets/js/skel.min.js"></script>
	<script type="text/javascript" src="html5/imperfect/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
	<script type="text/javascript" src="html5/imperfect/assets/js/main.js"></script>

	</body>
</html>