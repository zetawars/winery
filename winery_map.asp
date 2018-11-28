<%  
    M=Session("userid")
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp#temecula?requester=winery_map.asp")
        
    End If
%>


<script type="text/javascript">
    function myPopup() {
        var myWindow = window.open("", "MsgWindow", "width=400, height=300");
        myWindow.document.write("<p>To view this function, you must be signed in.</p> Thank you, <br /> The Management");
    }
</script>


<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Save Your Cork: Temecula</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="html5/imperfect/html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="html5/imperfect/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="html5/imperfect/assets/css/ie8.css" /><![endif]-->
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
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
                        <!--#include file="links_menu.html"-->
					</section>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">

								<a href="vineyard_details.asp?V=8" class="image featured"><img src="images/Temecula_Valley_Wine_Map.png" alt="" /></a>
								<font face="arial, helvetica" size=2>Temecula has over 45 wineries spread across 27,000 square acres for you to sample, taste, and enjoy.</font>
                                <br /><br />
								<iframe class="image featured" height="400" scrolling="no" frameborder="0" src="https://www.google.com/fusiontables/embedviz?q=select+col1+from+1kQhm2oxe9wKf-1_kB5zez00fgZhFg3toBJWRDio&amp;viz=MAP&amp;h=false&amp;lat=33.56152890790234&amp;lng=-117.02711937863762&amp;t=1&amp;z=11&amp;l=col1&amp;y=2&amp;tmplt=2&amp;hml=GEOCODABLE"></iframe>
                                <footer>
									<ul class="actions">
										<li><a target="_blank" href="http://www.carterestatewinery.com/our-wines.htm" class="button big">View the Google map</a></li>
									</ul>
								
								</footer>
							</article>

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<img src="images/header_doffo.png" alt="" class="image featured"/>
								<header>
									<span style="font-size: 37px; font-weight:bold; color:Black">Save Your Cork: Temecula</span>
									<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>Some of my favorites...
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
                                            <% 

                                            'declare the variables 
                                            Dim Connection
                                            Dim ConnectionString
                                            Dim Recordset
                                            Dim SQL
                                            Dim rsVineyard


                                                'declare the SQL statement that will query the database
                                                SQL = "SELECT * FROM qry_Vineyard_Favorites WHERE Vineyard_ID > 1 ORDER BY Vineyard_ID DESC, Winery_Name ASC Limit 3"

                                                'Response.write SQL1
                                                'define the connection string, specify database driver
                                                ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                                'create an instance of the ADO connection and Recordset objects
                                                Set Connection = Server.CreateObject("ADODB.Connection")

                                                Set rsVineyard = Server.CreateObject("ADODB.RecordSet")

                                                'Open the connection to the database
                                                Connection.Open ConnString


                                                'Open the Recordset object executing the SQL statement and return records 
                                                rsVineyard.Open SQL,Connection


                                                'first of all determine whether there are any records 
                                                If rsVineyard.EOF  Then 
                                                Response.Write("No records returned.") 
                                                Else
                                                'if there are records then loop through the fields 
                                                Do While NOT rsVineyard.Eof   
                                                    'Do While NOT rsFav.Eof
    
	                                            T_Rest=len(rsVineyard("Restaurant"))
	                                            'Response.write T_Rest
	
	                                            T_Hours=len(rsVineyard("Hours"))
	                                            'Response.write T_Hours
	
	                                            T_Taste=len(rsVineyard("Tastings"))
	                                            'Response.write T_Taste

                                                W_Fave = rsVineyard("Vineyard_ID")
                                                'Response.write W_Fave

                                                GAdd = replace(rsVineyard("location")," ","+")
                                                GAdd2 = rsVineyard("Winery_Name") & ", " & rsVineyard("Location") 
	                                            %>


                                            <header>
                                                <a href='vineyard_details.asp?V=<% = rsVineyard("Vineyard_ID") %>' class="image"><img alt="<% = rsVineyard("Winery_Name") %>" src='<% = rsVineyard("Winery_Image") %>' /></a>
												<h3><a href='vineyard_details.asp?V=<% = rsVineyard("Vineyard_ID") %>'><% = rsVineyard("Winery_Name") %></h3>

                                                
                                                <a target="_blank" href="https://www.google.com/maps/place/<% =GAdd2 %>"><span class="published"><% = rsVineyard("Location") %></span></a>

                                                <a href="tel:<% = rsVineyard("Winery_Phone") %>"><span class="published"><% = rsVineyard("Winery_Phone") %></span></a>

                                            </header>
                                            <%
                                            rsVineyard.MoveNext     
                                            Loop
                                            End If
                                            %>

                                                
    
                                            <%

                                            'close the connection and Recordset objects freeing up resources
                                            rsVineyard.Close
                                            Set rsVineyard=nothing
                                            Connection.Close
                                            Set Connection=nothing

                                            %>
										</article>
									<ul class="actions">
										<li><a href="vineyard_list.asp" class="button big">View all of Temecula's wineries</a></li>
									</ul>
								</div>
							</section>

						<!-- Posts List -->
							<section><h2>Local Events</h2><br />
                                <ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="#">Temecula Balloon Festival</a></h3>
												<time class="published" datetime="2015-10-20">MAY 20, 21 & 22</time>
											</header>
											<a href="http://www.tvbwf.com/" class="image"><img src="images/temecula_hotair_balloon.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">Ponte Winery Sing-Off</a></h3>
												<time class="published" datetime="2015-10-15">October 15, 2015</time>
											</header>
											<a href="#" class="image"><img src="http://www.pontewinery.com/assets/files/template_files/ponte-winery-logo-2x.png" alt="" /></a>
										</article>
									</li>

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
			<script src="html5/imperfect/assets/js/jquery.min.js"></script>
			<script src="html5/imperfect/assets/js/skel.min.js"></script>
			<script src="html5/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="html5/imperfect/assets/js/main.js"></script>

	</body>
</html>