<%

    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Server.HtmlEncode(Request("M"))
    'response.write PrevURL
    
	If W <> "" then
		R = Server.HtmlEncode(Request("requester")) & "&W=" & W
	Else
		R = Server.HtmlEncode(Request("requester"))
	End if
	
	Logout = Server.HtmlEncode(Request("Logout"))
    If Logout = "1" then
		
		'Response.Write "Inside the Logout check"
		
		For each x in Request.Cookies
			Response.Cookies(x).Expires = DateAdd("d",-1,now())
		  if Request.Cookies(x).HasKeys then
			For each y in Request.Cookies(x)
              'Response.Cookies(x)(y).Expires = DateAdd("d",-1,now())
			next
		  end if
		Next
		Response.Cookies("user")("loggedin") = False
		Session("loggedin") = False
		Session("username") = "You're logged out"	
	End If


	If Request.Cookies("user")("loggedin") then 
		
		Session("loggedin") = True
	    Session("userid") = Request.Cookies("user")("userid")
	    Session("ID") = Request.Cookies("user")("ID")
	    Session("username") = Request.Cookies("user")("username")	   				
			
		If Len(Request("requester")) > 0 Then
			Response.Redirect R 
	   Else
			'Response.Redirect "home.asp"
			'Response.End
	   End if
		
	End If
	
	
	
	
    LogErr = Server.HtmlEncode(Request("LoginFail"))
    If LogErr = "1" then
        LogErr = "Sorry, login credentials are incorrect"
    End If
    'response.write LogErr
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
		<title>Save Your Cork: Login Home</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />

        <!--[if lte IE 8]><script src="html5/imperfect/html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="html5/imperfect/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="html5/imperfect/assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="#">Save Your Cork: Login</a></h1>
						<nav class="links">
                            <!-- #include file="links.html"-->
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="search_results.asp">
										<input type="text" name="query" placeholder="Search" />
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
								<form class="search" method="get" action="search_results.asp">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
						<!--#include file="links_menu.html"-->

					</section>


				<!-- Main -->
					<div id="main">
						<!-- Post -->
                          
								<div class="post">
                            
                                    <form action="Login_Validate.asp" method="post">

                                    <table width="100%" align="center" >	
	                                    <tr>
		                                    <td colspan="3" valign="top">
                                                <font color="red"><% response.write LogErr %></font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>User Name</strong>
                                                <br />
                                                <input type="text" name="login" size="10" value="<%=Server.HTMLEncode(Request.Form("login"))%>" required/>
                                            </td>
                                            <td>
                                                
                                                <strong>Password</strong>
            
                                                <br />
		                                        <input type="password" name="password" size="10" value="<%=Server.HTMLEncode(Request.Form("password"))%>" value="Enter Password" required /><br />
                                                <input type="hidden" name="requester" value="<%=Server.HtmlEncode(Request("requester"))%>" />
                                                <input type="hidden" name="V" value="<%=Server.HtmlEncode(Request("V"))%>" />
                                                <input type="hidden" name="W" value="<%=Server.HtmlEncode(Request("W"))%>" />
            
                                            </td>

                                            <td >
		                                       <br /> <input type="submit" name="submitlogin" value="Login" /> <br /><a href="login_reset.asp?X=0" class="author">Reset</a> <br /><a href="login_new.asp" class="author">Register</a>
                                                
                                            </td>
	                                    </tr>
                                    </table>

                                    </form>
                                    
                                </div>
							

							<article class="post">
								<header>

									<div class="title">
										<h2><a href="vineyard_details.asp?V=8">Carter Estate Winery and Resort</h2>
                                        <h3>Featured Winery</h3>
										<p>The charm and splendor of California wine country abounds at Carter Estate Winery and Resort. With their lush vineyards and luxury suites, come indulge your senses and unwind with beautiful award winning wines.</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-11-01">March 28, 2016</time>
										<a href="vineyard_details.asp?V=42" class="author"><img src="images/logo_carter_estate.png" alt="" /></a>
									</div>
								</header>
								<a href="vineyard_details.asp?V=8" class="image featured"><img src="images/carter_luxury.jpg" alt="" /></a>
								<p>Experience exquisite charm in one of their 42 luxurious, Mediterranean-inspired Bungalow Suites surrounded by vineyards that have produced award-winning wines. Their passion for great wine and exquisite accommodations is apparent everywhere. For an added wine tasting experience, a Carter Estate Winery Food and Wine Pairing makes an excellent choice.</p>
								<footer>
									<ul class="actions">
										<li><a target="_blank" href="http://www.carterestatewinery.com/" class="button big">Continue Reading</a></li>
									</ul>
									<ul class="stats">

									</ul>
								</footer>
							</article>



					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a name="login"><img src="images/header_doffo.png" alt="" class="image featured"/></a>

								<header>
									<center><span style="font-size: 37px; font-weight:bold; color:Black; align-content:center">Save Your Cork</span></center>
                                    <br />
									<p>Welcome to the new way to learn about and find great local wines</p>
                                </header>
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
    
                        <!--#include file="footer.html"-->

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