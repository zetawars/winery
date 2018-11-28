<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp#temecula?requester=tasting_school.asp")
        
    End If

    M=Session("userid")
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))

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
							<section>
								<ul class="actions vertical">
									<li><a href="login.asp" class="button big fit">Log In</a></li>
								</ul>
							</section>

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
										<h2><a href="#">How to Taste Wine</a></h2>
										<p>
                                        <p align="justify"/>
		                                <img src="images/tasting_notes.jpg" width="136" style="float: left; margin-right: 5px;" />
                                            <dd>
                                            Learning how to taste wines is 
		                                    a simple adventure 
		                                    that will deepen your appreciation for wines and winemakers. Look, 
		                                    smell, taste: Starting with your basic senses, 
		                                    you will learn how to appreciate wines in no time! You can smell thousands of unique scents, but your taste perception 
		                                    is limited to salty, sweet, sour and bitter. It is the combination of 
		                                    smell and taste that allows you to discern flavor.
                                            <br />
                                            <br />
                                            Our sense of smell is critical in properly analyzing a 
		                                    glass of wine. To get a good impression of your wine's aroma, swirl your 
		                                    glass for a solid 10-12 seconds (this helps vaporize some of the wine's 
		                                    alcohol and release more of its natural aromas) and then take a quick 
		                                    whiff to gain a first impression. Still Smelling. Now stick your nose 
		                                    down into the glass and take a deep inhale through your nose. What are 
		                                    your second impressions? Do you smell oak, berry, flowers, vanilla or 
		                                    citrus? A wine's aroma is an excellent indicator of its quality and 
		                                    unique characteristics.
                                            <br />
		                                    <br />
		                                    
                                            Now take a taste. Start with a small sip and let it roll around your 
		                                    mouth. There are three stages of taste: the Attack phase, the Evolution 
		                                    phase and the Finish:
                                            <br />
		                                    <br />
		                                    
                                            <b>The Attack Phase</b>, is the initial impression that the wine makes on your 
		                                    palate. The Attack is comprised of four pieces of the wine puzzle: 
		                                    alcohol content, tannin levels, acidity and residual sugar. These four 
		                                    puzzle pieces display initial sensations on the palate. Ideally these 
		                                    components will be well-balanced and one piece will not be more 
		                                    prominent than the others. These four pieces meld together to offer 
		                                    impressions in intensity and complexity, soft or firm, light or heavy, 
		                                    crisp or creamy, sweet or dry.
                                            <br />
		                                    <br />
		                                    <b>The Evolution Phase</b> is the wines actual taste on the palate. In this 
		                                    phase you are looking to discern the flavor profile of the wine. If it's 
		                                    a red wine you may start noting fruit - berry, plum, prune or fig; 
		                                    perhaps some spice - pepper, clove, cinnamon, or maybe a woody flavor 
		                                    like oak. With a white wine you may taste apple, pear, tropical or 
		                                    citrus fruits, or the taste may be more floral in nature and consist of 
		                                    honey, butter, or herbs.
                                            <br />
		                                    <br />
		                                    <b>The Finish</b> is appropriately labeled as the final phase. The wine's 
		                                    finish is how long the flavor impression lasts after it is swallowed. 
		                                    Did it last several seconds? Can you taste the remnant of the wine on 
		                                    the back of your mouth and throat? Do you want another sip or was the 
		                                    wine too bitter at the end? What was your last flavor impression - 
		                                    fruit, butter, oak? Does the taste persist or is it short-lived? 
                                            
                                            </dd>
        
									</div>
									<div class="meta">
										<time class="published" datetime="2015-10-25">October 25, 2015</time>
										<a class="author"><span class="name">Anthony J. Hawkins</span>
                                        <br />
                                        <img src="images/grape_bunch.jpg" alt="" style="float:right" /></a>
									</div>
								</header>
								
							</article>


					<!-- Pagination -->
							<ul class="actions pagination">
								
								<li><a href="tasting_terms.asp" class="button big next">Next Page</a></li>
							</ul>

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a href="home.asp" class=""><img src="images/header_doffo.png" alt="" /></a>
								<header>
									<span style="font-size: 37px; font-weight:bold; color:Black">Save Your Cork: Temecula</span>
									<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>My Favorite Wines:
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
                                                SQL = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" & M & "' AND Tasting_Score > 3 ORDER BY Winery DESC, Name ASC Limit 3"

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
    
	                                            'T_Rest=len(rsVineyard("Restaurant"))
	                                            'Response.write T_Rest
	
	                                            'T_Hours=len(rsVineyard("Hours"))
	                                            'Response.write T_Hours
	
	                                            'T_Taste=len(rsVineyard("Tastings"))
	                                            'Response.write T_Taste

                                                'W_Fave = rsVineyard("Vineyard_ID")
                                                'Response.write W_Fave

                                                'GAdd = replace(rsVineyard("location")," ","+")
                                                'GAdd2 = rsVineyard("Winery_Name") & ", " & rsVineyard("Location") 

	                                            %>



                                            <header>
                                                <a class="author" href='wine_details.asp?V=<%=rsVineyard("Winery")%>&W=<%=rsVineyard("Wine")%>' ><img alt="<%=rsVineyard("Winery")%> <%=rsVineyard("Name")%>" src='<%=rsVineyard("Image_Location")%>' /></a>
												<h4><a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><span class="" ><%=rsVineyard("Winery")%></span></a></h4>
                                                <a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><span class="published" ><%=rsVineyard("Vintage")%>&nbsp;&nbsp;<%=rsVineyard("Name")%></span></a>
                                                <a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><span class="published" >
                                                    <%select case rsVineyard("User_Like") %>
       	                                            <%case 1:%>
                                                       Tasting: I Drank This
                                                    <%case 2:%>
                                                       Tasting: I Like This
                                                    <%case 3:%>
                                                       Tasting: I Want This
                                                    <%case else:%>
                                                       Tasting: I Bought This
                                                    <%end select%>
                                                </span></a>
                                                <a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><span class="published" >
                                                   Score: <img alt="<%=rsVineyard("Tasting_Score")%> star taste!" src="images/<%=rsVineyard("Tasting_Score")%>-star.png"/>
                                                </span></a>

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

								</div>
						<!-- About -->
							<section class="blurb">
								
								<ul class="actions">
									<li><a href="wine_list.asp" class="button">More Wines</a></li>
								</ul>
							</section>

							</section>

						<!-- Posts List -->
							<section>
								<ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="#">Carter Estate Winery and Resort</a></h3>
												<time class="published" datetime="2015-10-20">October 20, 2015</time>
											</header>
											<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
										</article>
									</li>

								</ul>
							</section>

						<!-- About -->
							<section class="blurb">
								
								<ul class="actions">
									<li><a href="vineyard_list.asp" class="button">More Wineries</a></li>
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
								<p class="copyright">&copy; Save Your Cork. 
                                <BR />Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
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