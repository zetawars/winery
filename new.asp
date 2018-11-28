<%  
    M=Session("userid")
    'response.write M
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))

    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=home.asp")
        
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
		<title>Save The Cork: Temecula</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="html5/imperfect/html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />
		<link href="DropDown.css" rel="stylesheet" type="text/css">
		<!--[if lte IE 9]><link rel="stylesheet" href="html5/imperfect/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="html5/imperfect/assets/css/ie8.css" /><![endif]-->

        <meta name="google-site-verification" content="nqPLLpX25VwFo5q59RF8ZhRZBHJ09lqXxwREZ3Moh8M" />


</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
					<div class="dropdown">
					  <h1><a href="#">Save the Cork: Temecula</a></h1>
						<div class="outer-list">
    <ul>
      <li>List item 1</li>
      <li>List item 2</li>
      <li>List item 3</li>
      <li>List item 4</li>
    </ul>
  </div>
</div>

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
								<header>
									<div class="title">
										<h2><a href="vineyard_details.asp?V=8">Carter Estate Winery and Resort</a></h2>
                                        <h3>Featured Winery</h3>
										<p>The charm and splendor of California wine country abounds at Carter Estate Winery and Resort. With their lush vineyards and luxury suites, come indulge your senses and unwind with beautiful award winning wines.</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-11-01">February 14, 2016</time>
										<a href="vineyard_details.asp?V=8" class="author"><span class="name"></span><img src="images/logo_carter_estate.png" alt="" /></a>
									</div>
								</header>
								<a href="vineyard_details.asp?V=8" class="image featured"><img src="images/carter_luxury.jpg" alt="" /></a>
								<p class="">Experience exquisite charm in one of their 42 luxurious, Mediterranean-inspired Bungalow Suites surrounded by vineyards that have produced award-winning wines. Their passion for great wine and exquisite accommodations is apparent everywhere. For an added wine tasting experience, a Carter Estate Winery Food and Wine Pairing makes an excellent choice.</p>
								<footer>
									<ul class="actions">
										<li><a target="_blank" href="http://www.carterestatewinery.com/" class="button big">Continue Reading</a></li>
									</ul>
									<ul class="stats">
										<li><a target="_blank" href="http://www.carterestatewinery.com/testimonials.htm">General</a></li>
										<li><a target="_blank" href="https://www.tripadvisor.com/Hotel_Review-g33165-d7395157-Reviews-Carter_Estate_Winery_and_Resort-Temecula_California.html" class="icon fa-tripadvisor">67</a></li>
										<li><a target="_blank" href="http://www.carterestatewinery.com/testimonials.htm" class="icon fa-comment">13</a></li>
									</ul>
								</footer>
							</article>

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h3><a href="user_profile.asp">Hi <% = session("username") %>, here's your latest cork action:</a></h3>
                                        
                                    <% 

                                    'declare the variables 
                                    Dim Connection2
                                    Dim ConnString

                                    Dim SQLTaste
                                    Dim rsTaste

                                    SQLTaste = "SELECT * FROM ( SELECT COUNT( * ) AS TotalWhite FROM qry_Member_Notes WHERE Type = 'Rose' and Member = " & M & " OR Type = 'White' and Member = " & M & " ) AS T1, " &_
                                    "(SELECT COUNT( * ) AS TotalRed FROM qry_Member_Notes WHERE Type = 'Red' and Member = " & M & " ) AS T2, " &_ 
                                    "(SELECT COUNT( * ) AS TotalSparkling FROM qry_Member_Notes WHERE Type = 'Sparkling' and Member = " & M & ") AS T3, " &_
                                    "(SELECT COUNT( * ) AS TotalDessert FROM qry_Member_Notes WHERE Type = 'Sweet' and Member = " & M & " OR Type = 'Dessert' and Member = " & M & " ) AS T4, " &_ 
                                    "(SELECT COUNT( * ) AS TotalRose FROM qry_Member_Notes WHERE Type = 'Rose' and Member = " & M & " ) AS T5, " &_ 
                                    "(SELECT COUNT( * ) AS TotalTaste FROM qry_Member_Notes WHERE Member = " & M & ") AS T6"
                                    'SQLCount="SELECT COUNT(Type) AS TotalWhite FROM qry_Member_Notes WHERE Type = 'White' "
        
        
                                    ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                    Set Connection2 = Server.CreateObject("ADODB.Connection")
                                    Set rsTaste = Server.CreateObject("ADODB.RecordSet")
        
                                    'Open the connection to the database
                                    Connection2.Open ConnString
        
                                    'Open the Recordset object executing the SQL statement and return records 
                                    rsTaste.Open SQLTaste,Connection2

                                    'first of all determine whether there are any records 
                                    If rsTaste.EOF  Then 
                                    Response.Write("No records returned.") 
                                    Else
                                    'if there are records then loop through the fields 
                                    Do While NOT rsTaste.Eof   
                                        'Do While NOT rsFav.Eof

                                    TTaste = cInt(rsTaste("TotalTaste"))

                                    TSpark = cInt(rsTaste("TotalSparkling"))
                                    TWhite = cInt(rsTaste("TotalWhite")) + cInt(rsTaste("TotalRose"))
                                    TRed = cInt(rsTaste("TotalRed"))
                                    TDessert = cInt(rsTaste("TotalDessert"))

                                    If TSpark > 1 then
                                        Pct_Spark = cInt((TSpark/TTaste)*100)
                                    Else
                                        Pct_Spark = 0
                                    End if

                                    If TWhite> 1 then
                                        Pct_White = cInt((TWhite/TTaste)*100)
                                    Else
                                        Pct_White = 0
                                    End If
        
                                    If TRed> 1 then
                                        Pct_Red = cInt((TRed/TTaste)*100)
                                    Else
                                        Pct_Red = 0
                                    End If

                                    If TDessert> 1 then
                                        Pct_Dessert = cInt((TDessert/TTaste)*100)
                                    Else
                                        Pct_Dessert = 0
                                    End If


                                    'response.Write TTaste
                                    %>

                                        your tasting results...
                                    <table >
                                        <tr>
                                            <td><a href="user_profile.asp" class="author">T</td>
                                            <td><a href="user_profile.asp" class="author">S</td>
                                            <td><a href="user_profile.asp" class="author">W</td>
                                            <td><a href="user_profile.asp" class="author">R</td>
                                            <td><a href="user_profile.asp" class="author">D</td>
                                        </tr>
                                        <tr>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =TTaste %></a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =rsTaste("TotalSparkling") %></a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =rsTaste("TotalWhite") %></a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =rsTaste("TotalRed") %></a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =rsTaste("TotalDessert") %></a></td>
                                        </tr>
                                         <tr>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"></a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =Pct_Spark %>%</a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =Pct_White %>%</a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =Pct_Red %>%</a></td>
                                            <td><a href="user_profile.asp" class="author" style="text-align:center"><% =Pct_Dessert %>%</a></td>
                                        </tr>                                          
                                    </table>      
                                    <span class="author2" style="font-size: 7px">Legend: T = Total Tastings Recorded; S = Sparkling Wines, W = White/Rose Wines, R = Red Wines, D = Dessert/Sweet Wines</span>
                                    <%
                                    rsTaste.MoveNext     
                                    Loop   
                                    end if 

                                'close the connection and Recordset objects freeing up resources
                                    rsTaste.Close
                                    Set rsTaste=nothing
                                    Connection2.Close
                                    Set Connection2=nothing

                                    %>                  

                                       
										
									</div>
									<div style="text-align:center" class="meta">
									
                                        <%
                                           'declare the variables 
                                            Dim ConnectionT
                                            Dim ConnectionStringT
                                            
                                            Dim SQLe
                                            Dim rsTours

                                            Visit_Today = Date()

                                            'response.write Visit_Today

                                            'declare the SQL statement that will query the database
                                            SQLe = "SELECT * FROM Vineyard_Tour WHERE Member_ID = " & M & " AND Visit_Date > " & Visit_Today & " ORDER BY Visit_Date DESC, Winery_Name ASC Limit 3"
                                            SQLfc = "SELECT * FROM ( SELECT COUNT( * ) AS TotalVines FROM Favorites WHERE Vineyard_ID > 1 and Member_ID = " & M & " ) AS T1, " &_
                                            "(SELECT COUNT( * ) AS TotalWines FROM Favorites WHERE Wine_ID > 1 and Member_ID = " & M & " ) AS T2," &_
                                            "(SELECT COUNT( * ) AS TotalDines FROM Favorites WHERE Dining_ID > 1 and Member_ID = " & M & " ) AS T3," &_
                                            "(SELECT COUNT( * ) AS TotalEvents FROM Favorites WHERE Event_ID > 1 and Member_ID = " & M & " ) AS T4"    
                                                   

                                            SQLtn = "SELECT COUNT( * ) AS TotalComments FROM Members_Notes WHERE Member = " & M 

                                
                                            'Response.write SQLe
                                            'define the connection string, specify database driver
                                            ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                            'create an instance of the ADO connection and Recordset objects
                                            Set ConnectionT = Server.CreateObject("ADODB.Connection")
                                            Set ConnectionFC = Server.CreateObject("ADODB.Connection")
                                            Set ConnectionTN = Server.CreateObject("ADODB.Connection")


                                            Set rsTours = Server.CreateObject("ADODB.RecordSet")
                                            Set rsFavCount = Server.CreateObject("ADODB.RecordSet")
                                            Set rsNotesCount = Server.CreateObject("ADODB.RecordSet")

                                            'Open the connection to the database
                                            ConnectionT.Open ConnString
                                            ConnectionFC.Open ConnString
                                            ConnectionTN.Open ConnString

                                            'Open the Recordset object executing the SQL statement and return records 
                                            rsTours.Open SQLe,ConnectionT
                                            rsFavCount.Open SQLfc, ConnectionFC
                                            rsNotesCount.Open SQLtn, ConnectionTN

                                            If Member_ID = M then
                                                Tour_Date = MaxofVisit_Date

                                            end if

                                            
                                            'Response.write rsTours("Visit_Date")

                                            'first of all determine whether there are any records 
                                            If rsTours.EOF  Then 
                                                Response.Write("You don't have any future visits planned") 
                                            Else
                                                Response.Write ("<A href=""tour_schedule.asp""><span class=""published"" datetime=""2015-10-25""> NEXT SCHEDULED VISIT <br /> </span>")
                                                Response.Write ("<span class=""published"" datetime=""2015-10-25"">" & formatdatetime(rsTours("Visit_Date"),2) & "</a><br /></b></span>")
                                            
                                            'if there are records then loop through the fields 
                                            Do While NOT rsTours.Eof   
                                                'Do While NOT rsFav.Eof
    
	                                        T_Rest=len(rsTours("Restaurant"))
	                                        'Response.write T_Rest
	
	                                        T_Hours=len(rsTours("Hours"))
	                                        'Response.write T_Hours
	
	                                        T_Taste=len(rsTours("Tastings"))
	                                        'Response.write T_Taste

                                            W_Fave = rsTours("Winery_ID")
                                            'Response.write W_Fave

                                            GAdd = replace(rsTours("Location")," ","+")
                                            GAdd2 = rsTours("Winery_Name") & ", " & rsTours("Location") 

                                            CountVines = cInt(rsFavCount("TotalVines"))
                                            CountWines = cInt(rsFavCount("TotalWines"))
                                            CountDines = cInt(rsFavCount("TotalDines"))
                                            CountEvents = cInt(rsFavCount("TotalEvents"))

                                            CountFav = CountVines + CountWines + CountDines + CountEvents
                                            CountComments = cInt(rsNotesCount("TotalComments"))
	                                        %>

                                                
                                            

                                                <a href="vineyard_details.asp?V=<% = rsTours("Winery_id") %>" class="author"><% = rsTours("Winery_Name") %></a>
                                                <br />

                                                

                                            <%
                                            rsTours.MoveNext     
                                            Loop
                                            End If
                                            %>

                                                
    
                                            <%

                                            'close the connection and Recordset objects freeing up resources
                                            rsTours.Close
                                            Set rsTours=nothing
                                            ConnectionT.Close
                                            Set ConnectionT=nothing

                                            %>

									</div>
								</header>
								<a href="#" class="image featured"><img src="images/vineyard_temecula.jpg" alt="" /></a>
								<footer>
									<ul class="actions">
										<li><a href="user_profile.asp" class="button big">Continue Reading</a></li>
									</ul>
									<ul class="stats">
										
										<li><a href="user_profile.asp" class="icon fa-heart"><% = CountFav %></a></li>
										<li><a href="user_profile.asp" class="icon fa-comment"><% = CountComments %></a></li>
									</ul>
								</footer>
							</article>





						<!-- Pagination -->
							<ul class="actions pagination">
								<li><a href="vineyard_list.asp" class="button big next">Next Page</a></li>
							</ul>
					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<img src="images/header_doffo.png" alt="" class="image featured"/>
								<header>
									<span style="font-size: 37px; font-weight:bold; color:Black">Save The Cork: Temecula</span>
									<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>Some fan favorites...
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
                                        
                                            <!-- #include file="vineyard_qry_favorites.asp" -->
                                          										
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

						<!-- About -->
							<section class="blurb">
								<h2>Wine Tasting</h2>
								<p>Although wine tasting may look like an elgant art, it's actually more science. What do they mean by "it's jammy"? And flavors of charcoal? In wine? 
                                How did they know that? Find out this and more by reviewing some wine tasting notes and read the terms used in wine flavorology. And yes... I made that last word up.
                                </p>
								<ul class="actions">
									<li><a href="tasting_school.asp" class="button big previous">Learn More ></a></li>
								</ul>
							</section>

						<!-- Footer -->
							<section id="footer">
								<ul class="icons">
									<li><a href="" class="fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="" class="fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="" class="fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="" class="fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="" class="fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; Save The Cork. Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
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