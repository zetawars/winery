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
							<a class="fa-search" href="#search">Search</a>
							<form id="search" method="get" action="#">
								<input type="text" name="query" value="Search" />
							</form>
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
					<section>
						<form class="search" method="get" action="#">
							<input type="text" name="query" value="Search" />
						</form>
					</section>

				<!-- Links -->
                        
                <!--#include file="links_menu.html"-->

			</section>


<!-- Main -->
<div id="main">
    <article class="post">
		<span class="author"><b>Welcome to your wine cellar. Here are the wines you've purchased from a Temecula Winery</b></span>
		<br />
        <br />

        <% 
        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsWine, rsFav
        Dim Loca


        'declare the SQL statement that will query the database
        SQL = "SELECT * FROM qry_Tasting_Notes WHERE User_Like = 4 AND Member='" &M& "' ORDER BY TStamp DESC, Winery ASC"
        SQL1 = "SELECT * FROM Favorites WHERE Member_ID='" &M& "' ORDER BY Vineyard_ID DESC"
        'Response.write SQL1
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set Connection1 = Server.CreateObject("ADODB.Connection")

        Set rsWine = Server.CreateObject("ADODB.RecordSet")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        Connection1.Open ConnString

        'Open the Recordset object executing the SQL statement and return records 
        rsWine.Open SQL,Connection
        rsFav.Open SQL1,Connection1

        'first of all determine whether there are any records 
        If rsWine.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsWine.Eof   
            'Do While NOT rsFav.Eof

	    If not rsFav.EOF Then
            F_fav=rsFav("Member_ID")
	        'Response.write F_fav & "/"

            F_FavID = rsFav("Vineyard_ID")
            'Response.write F_FavID & "/"
        end if

        W_Fave = rsWine("Wine")
        'Response.write W_Fave

        Tstamp = rsWine("Tstamp")
        TStamp = FormatDateTime(Tstamp,2)
        
        EComm= len(rsWine("Comments"))
        
        TScore = rsWine("Tasting_Score")
        ULike = rsWine("User_Like")

	    %>
        

		<article class="post">
			<header>
            <div id="intro">
			    <a href="wine_details.asp?V=<% =rsWine("Vineyard") %>&W=<% =rsWine("Wine") %>" class="image"><img src="<% =rsWine("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0; float: left; margin-left: 30px; margin-top: 60px;" height="200" /></a>
            </div>
            <div class="title2" style="margin-left: 00px">
				<h4><a class="time" href="wine_details.asp?V=<% =rsWine("Vineyard") %>&W=<% =rsWine("Wine") %>"><% =rsWine("Name") %></a></h4>
                <a class="author" href="vineyard_details.asp?V=<% =rsWine("Vineyard") %>"><% =rsWine("Winery") %></a>

                <br />

                <% If TScore > 0 Then %>
                    <a href='wine_details.asp?V=<% =rsWine("Vineyard") %>&W=<% =rsWine("Wine") %>'><span class="published" >
                        <img alt="<%=rsWine("Tasting_Score")%> star taste!" src="images/<%=rsWine("Tasting_Score")%>-star.png"/></span></a>
                <% End If %>
                <br />


                <% If EComm > 40 then %>
                    <% =left(rsWine("Comments"),100) %>
                <% Else %>
                    <% =rsWine("Comments") %>
                <% End If %>
                <br />
                <span class="author"><i>Tasting Date: <% = TStamp %></i></span>

            </div>
			</header>
		</article>
                        
        <%
        rsWine.MoveNext     
        Loop
        End If

        'close the connection and Recordset objects freeing up resources
        rsWine.Close
        Set rsWine=nothing
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
		<section>Other wines you've liked...
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
            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE User_Like = 3 AND Member='" &M& "' ORDER BY Tstamp DESC, Winery ASC Limit 4"

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
			<!-- Posts List -->
				<section>
					<ul class="posts">Advertisements
						<li>
							<article>
								<header>
									<h3><a href="#">Convallis maximus nisl mattis nunc id lorem</a></h3>
									<time class="published" datetime="2015-10-15">October 15, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Euismod amet placerat vivamus porttitor</a></h3>
									<time class="published" datetime="2015-10-10">October 10, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic10.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Magna enim accumsan tortor cursus ultricies</a></h3>
									<time class="published" datetime="2015-10-08">October 8, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic11.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Congue ullam corper lorem ipsum dolor</a></h3>
									<time class="published" datetime="2015-10-06">October 7, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic12.jpg" alt="" /></a>
							</article>
						</li>
					</ul>
				</section>

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