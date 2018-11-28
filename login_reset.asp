<%

    LName = Session("LName")
    Email = Session("Email")
    Zip = Session("Zip")

    M = Session("userid")
    V = Server.HtmlEncode(Request("V"))
    W = Server.HtmlEncode(Request("W"))
    X = Server.HtmlEncode(Request("X"))
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

    <!-- Scripts -->
	    <script type="text/javascript" src="html5/imperfect/assets/js/jquery.min.js"></script>
	    <script type="text/javascript" src="html5/imperfect/assets/js/skel.min.js"></script>
	    <script type="text/javascript" src="html5/imperfect/assets/js/util.js"></script>
	    <!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
	    <script type="text/javascript" src="html5/imperfect/assets/js/main.js"></script>


	<script Language="JavaScript" Type="text/javascript"><!--
	    function FrontPage_Form1_Validator(theForm) {


	        if (theForm.LName.value.length > 1) {
	            alert("Please enter at least 1 characters in the \"LName\" field.");
	            theForm.LName.focus();
	            return (false);
	        }

	        if (theForm.Email.value.length > 8) {
	            alert("Please enter at most 255 characters in the \"Email\" field.");
	            theForm.Email.focus();
	            return (false);
	        }
	        if (theForm.Zip.value.length > 4) {
	            alert("Please enter a 5-digit postal code characters in the \"Zip\" field.");
	            theForm.Zip.focus();
	            return (false);
	        }

	        return (true);

	    }
//--></script>

	</head>
	<body>

<!-- Wrapper -->
	<div id="wrapper">

                
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
								
                        <!--#include file="search.html"-->

					</section>

				<!-- Links -->
                       
                <!--#include file="links_menu.html"-->

			</section>
            
		<!-- Main -->
	<div id="main">
           
    <% If X <> 2 then %>
        <article class="post">
            <header>
                <section>
                <br />
                <% If X = 1 then %>
                    &nbsp;&nbsp;&nbsp;&nbsp;I'm sorry, the credentials you entered do not match our records. Please try again or register new credentials.
                <% Else %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you have forgotten your password and need to reset it, enter the same information you registered with: 
                <% End If %>
	                <form style="margin: 50px" method="post" action="login_reset_verify.asp">

                        <span class="published">Last Name*</span><br />
		                <input type="text" name="LName" placeholder="Last Name" />
                    <br /><br />
                        <span class="published">E-mail*</span><br />
		                <input type="text" name="Email" placeholder="Email" />
                    <br /><br />
                        <span class="published">Zip Code*</span><br />
		                <input type="text" name="Zip" placeholder="Zip Code" />
                    <br /><br />
                    
                    <input type="submit" value="    SUBMIT    " class="" />
                    <a href="login_new.asp" class="author">register</a>
	                </form>
                </section>
			</header>
        </article>				
		
    <% Else %>    

        <article class="post">
            <header>
                <section>
                <br />
                <% If X = 1 then %>
                    &nbsp;&nbsp;&nbsp;&nbsp;I'm sorry, the credentials you entered do not match our records. Please try again or register new credentials.
                <% Else %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please enter a new password for your account: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <% End If %>
	                <form style="margin: 50px" method="post" action="login_update.asp">

                        <span class="published">Last Name*</span><br />
		                <input type="text" name="LName" Value="<% =LName %>" Disabled />
                    <br /><br />
                        <span class="published">E-mail*</span><br />
		                <input type="text" name="Email" Value="<% =Email %>" Disabled />
                    <br /><br />
                        <span class="published">Zip Code*</span><br />
		                <input type="text" name="Zip" Value="<% =Zip %>" Disabled />
                    <br /><br />
                    
                    <span class="published">Enter a new Password*</span><br />
		                <input type="text" name="Password" Placeholder="Password" />
                    <br /><br />
                    <input type="submit" value="    SUBMIT    " class="" />
                    <a href="login_new.asp" class="author">register</a>
	                </form>
                </section>
			</header>
        </article>		
    
    <% End If %>
	</div>

<!-- Sidebar -->
	<section id="sidebar">

	<!-- Intro -->
		<section id="intro">
			<a href="home.asp" class="image featured" ><img src="images/header_doffo.png" alt="" /></a>
			<header>
				<span style="font-size: 37px; font-weight:bold; color:Black">Save The Cork: Temecula</span>
				<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
			</header>
		</section>


<!-- Database results for last 3 reviewed vines -->        
		<section>Some of my recent visits...
		<div class="mini-posts">

		<!-- Mini Post -->
		<article class="post">
			<ul class="posts">    

            <!--#include file="vineyard_qry_visits.asp"-->
                        
            </ul>
		</article>
            
		<ul class="actions">
			<li><a href="vineyard_list.asp" class="button big">View all of Temecula's wineries</a></li>
		</ul>

	</div>

</section>
			<!-- Posts List -->

            


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
	</body>
</html>