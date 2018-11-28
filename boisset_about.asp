<%  
    M=Session("userid")
    'response.write M
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    T=Session("locale")

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
		<title>Save Your Cork: Temecula</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="html5/imperfect/html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="html5/imperfect/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="html5/imperfect/assets/css/ie8.css" /><![endif]-->
        
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">

        <meta name="google-site-verification" content="nqPLLpX25VwFo5q59RF8ZhRZBHJ09lqXxwREZ3Moh8M" />

	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1>
                            <% If T= "T" then %>    
                             <a href="home.asp">   Save Your Cork: Temecula </a>
                            <% else %>
                             <a href="boissetcollection.asp">   Boissett Collection</a>
                            <% end if %>
                        </h1>

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
                          <div class="pane-content">
                              <style type="text/css">
                                <!--/*--><![CDATA[/* ><!--*/
                                .videoWrapper {
                                    position: relative;
	                                padding-bottom: 56.25%; /* 16:9 */
	                                padding-top: 0px;
	                                height: 0;
                                }
                                .videoWrapper iframe {
	                                position: absolute;
	                                top: 0;
	                                left: 0;
	                                width: 100%;
	                                height: 100%;
                                }

                                /*--><!]]>*/
                                </style><div class="videoWrapper">
                                <iframe allowfullscreen="" frameborder="0" scrolling="no" src="https://www.youtube.com/embed/reCTOGtF2yw?rel=0"></iframe></div>
                         </div>


						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h3><a href="">A THOUGHTFUL AND PASSIONATE LEADER</a></h3>
                                        
                                   <div class="panel-separator"></div><div class="panel-pane pane-fieldable-panels-pane pane-uuid-8a204767-76da-4f2d-b3f9-952a6d662d57 jcb-bio clearfix pane-bundle-left-photo-right-content-pane"   class="panel-pane pane-fieldable-panels-pane pane-uuid-8a204767-76da-4f2d-b3f9-952a6d662d57 jcb-bio clearfix pane-bundle-left-photo-right-content-pane">
    
  
                              <div class="pane-content">
                                <div class="fieldable-panels-pane" class="fieldable-panels-pane">
                                    <div class="jcb-bio-col1 grid-6 push-2">
                                        <div class="field field-name-field-photo field-type-image field-label-hidden">
                                            <div class="field-items"><div class="field-item even"><img typeof="foaf:Image" src="https://my.boissetcollection.com/sites/default/files/jcb-photo.jpg" width="230" height="310" alt="" />
                                            </div>
                                        </div>
                                    </div>    
                                        
                                   <div class="field field-name-field-caption field-type-text-long field-label-hidden">
                                       <div class="field-items">
                                           <div class="field-item even" style="font-size:10pt; font-style:italic"><p><br />
	                                                "I want to get people to dream and associate wine with other things.”</p>
                                           </div>
                                       </div>
                                   </div>  
                                    </div>
  <div class="jcb-bio-col1 grid-13 push-3">
    <div><div class="field-items"><div class="jcb-title-name">
	<div class="title"><h3><center>Jean-Charles Boisset</center></h3></div>
<p>
	As president of Boisset Family Estates, Jean-Charles Boisset leads one of the most prestigious, family-owned, wine companies in the world. Under his watchful eye, Jean-Charles continues to expand the family business with a fierce commitment to sustainable, organic, and Biodynamic<sup>®</sup> farming and the wine lifestyle. Today, the Boisset family’s historic vineyards extend from the rich terroirs of Burgundy and the South of France, across the globe to California’s Napa Valley and Russian River Valley.</p>
<p>
	Born in the village of Vougeot in the historic wine region of Burgundy, France, Jean-Charles’ destiny as a world-class winemaker was meant to be. His parents Jean-Claude and Claudine Boisset founded the family’s first winery in 1961 with the same innovative and entrepreneurial spirit that Jean-Charles carries on today. He is also dedicated to sharing his vision of the wine world, which is centered on family, passion, history, innovation, a commitment to fine wines, and a dedication to sustainable winegrowing.</p>
<p>
	The international wine community continues to recognize Jean-Charles for his leadership and innovation in the winemaking industry. He has been named to <em>Decanter</em> magazine’s annual “Power List” every year since its first publication in 2007. In 2008, Jean-Charles earned the titles of “Meininger’s International Wine Entrepreneur of the Year,” and <em>Wine Enthusiast</em> magazine’s “Wine Innovator of the Year”.</p>
<p>
	The French America Foundation awarded him their first-ever French-American Partnership Award in 2013 for creating a strong and enduring French-American partnership. In 2014, <em>Haute Living</em> magazine named him to the “Haute List San Francisco,” and JFK University named he and his wife, Gina Gallo-Boisset, their 2014 "Entrepreneur's of the Year”. Jean-Charles also serves as a member of several boards of directors and is active in a number of environmental groups around the world.</p>
</div></div></div>  </div>

  </div>

  
  </div>
                                       
										
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
										<li><a href="user_profile.asp" class="button big">User Profile</a></li>
									</ul>
									<ul class="stats">
										
										<li><a href="user_profile.asp" class="icon fa-heart"><% = CountFav %></a></li>
										<li><a href="user_profile.asp" class="icon fa-comment"><% = CountComments %></a></li>
									</ul>
								</footer>
							</article>





						<!-- Pagination 
							<ul class="actions pagination">
								<li><a href="vineyard_list.asp" class="button big next">Next Page</a></li>
							</ul>
                        -->
					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
                                <img src="images/boisset/BT_WineryImage_4_1200_675_65.jpg" alt="" class="image featured" />
								
								<header>
									<center><span style="font-size: 27px; text-align:justify; font-weight:bold; color:Black">THE BOISSET EXPERIENCE <br /> MEANT TO BE SHARED</span>
									    <br />
                                        <p>Independent Ambassador</p>
                                    </center>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>Some fan winery favorites...
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