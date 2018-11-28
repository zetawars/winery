<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=wine_list_test.asp")
    End If

    M = Session("userid")
    V = Server.HtmlEncode(Request("V"))
    W = Server.HtmlEncode(Request("W"))
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
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">

	<script>
	    var mydate = new Date()
	    var year = mydate.getYear()
	    if (year < 1000)
	        year += 1900
	    var day = mydate.getDay()
	    var month = mydate.getMonth()
	    var daym = mydate.getDate()
	    if (daym < 10)
	        daym = "0" + daym
	    var dayarray = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
	    var montharray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
   	</script>

    <script LANGUAGE="javascript">
    <!--
        function gotoFunction() {
            self.location = document.productGoto.productList.options[document.productGoto.productList.selectedIndex].value;
        }
    // -->
    </script>

        
    <script>
        $(document).ready(function () {
            $("img.favico").click(function () {
                var icon = $(this).parent("span").data("fav");
                //alert(icon);
                if (icon == 0) {
                    $(this).parent("span").data("fav", 1);
                    $(this).attr("src", "images/fav_heart_true.png");

                    var wineid = $(this).parent("span").attr("id");
                    var userid = $(this).parent("span").data("userid");
                    //alert(vineyardid+userid);

                    $.post("fav_handler.asp",
                    {
                        wineid: wineid,
                        userid: userid,
                        action: "insertWine"
                    });
                }

                if (icon == 1) {

                    $(this).parent("span").data("fav", 0);
                    $(this).attr("src", "images/fav_heart_vote.png");

                    var wineid = $(this).parent("span").attr("id");
                    var userid = $(this).parent("span").data("userid");
                    //alert(vineyardid+userid);
                    $.post("fav_handler.asp",
                    {
                        wineid: wineid,
                        userid: userid,
                        action: "deleteWine"
                    });
                }

            });
        });

    </script>

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
	<div id="main"  style="padding: 20px; background-color: #FFFFFF;">

	<iframe src="wine_varietals.asp?Var=Muscat" style="width:400px;height:644px;max-width:300;overflow:hidden;border:5px none #00FFFF; padding:0;margin:0 auto;display:block;" marginheight="0" marginwidth="0"></iframe>
      

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
		<section>Some of my recent visits...
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
            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" & session("userid") & "' ORDER BY Tstamp DESC, Winery ASC Limit 4"
            VarSQL = "SELECT Varietal FROM Wines GROUP BY Varietal ORDER BY Varietal"
            'Response.write SQL1
            'define the connection string, specify database driver
            wConnStringx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

            'create an instance of the ADO connection and Recordset objects
            Set wConnectionx = Server.CreateObject("ADODB.Connection")
            Set VarConnections = Server.CreateObject("ADODB.Connection")

            Set rsWines = Server.CreateObject("ADODB.RecordSet")
            Set rsVarietal = Server.CreateObject("ADODB.RecordSet")

            'Open the connection to the database
            wConnectionx.Open wConnStringx
            VarConnections.Open wConnStringx


            'Open the Recordset object executing the SQL statement and return records 
            rsWines.Open wSQLx,wConnectionx
            rsVarietal.Open VarSQL,VarConnections

            Varits = rsVarietal("Varietal")
            response.write Varits


            'first of all determine whether there are any records 
            If rsWines.EOF  Then 
            Response.Write("where is this") 
            Else
            'if there are records then loop through the fields 
            Do While NOT rsWines.Eof   

            Tstamp = rsWines("Tstamp")
            TStamp = FormatDateTime(Tstamp,1)
            'response.write(FormatDateTime(Tstamp,1))
            'Response.Write "M=" & M


	    %>

			<li>
				<article>
					<header>
						<h3><a href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a></h3>
						<time class="published" datetime="2015-10-15"><% =TStamp %></time>
                        <br /> 
					</header>
					<a href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>" class="image"><img src="<% =rsWines("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
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
<a href="#logo" onclick="window.external.AddFavorite('http://www.saveyourcork.com','Save Your Cork: Temecula')" style="text-decoration: none">
  	<font color="#888888" face="arial" size="1"></font></a><font color="#888888" face="arial" size="1"> </font></p>
			<!-- Posts List -->

<script>
	document.write("<font size='2' color='666666' face='Arial'><center><b>" + dayarray[day] + ", " + montharray[month] + " " + daym + "</b></font></H6><p>")
</script>

    <FORM NAME="productGoto" ACTION="" METHOD="POST" CLASS="mstmnu">
    <SPAN CLASS="pull">
	<SELECT NAME="productList" ONCHANGE="gotoFunction()" ONBLUR="return options[0].selected = true">
	    <OPTION VALUE="#">Select A Varietal...
        <% Do While NOT rsVarietal.Eof  %>
	    <OPTION VALUE="wine_varietals.asp?WV=<% =varits %>"> <% =varits %></OPTION>
        <% 
            rsVarietal.MoveNext
            loop 
        %>
    </SELECT>
    </SPAN> 
    </FORM>
				<section>
					<ul class="posts">Advertisements
						<li>
							<article>
								<header>

								</header>
								<a href="#" class="image"><img src="html5/Imperfect/images/pic09.jpg" alt="" /></a>
							</article>
						</li>
					</ul>
				</section>

			<!-- About -->

				<section class="blurb">
                <span class="title2">
					<h2>Tasting School</h2>
					<p style="text-align:left"><img alt="" src="images/tasting_notes.jpg" width="136" style="float: right; margin-left: 5px;" />
                    Learning how to taste wines is a simple adventure that will deepen  your appreciation for wines and winemakers. 
                            Look, smell, taste: Starting with your basic senses, you will learn how to appreciate wines in no time! You can smell thousands of unique scents, 
                            but your taste perception is limited to salty, sweet, sour and bitter. It is the combination of smell and taste that allows you to discern flavor.</p>
					<ul class="actions">
						<li><a href="tasting_school.asp" class="button">Learn More</a></li>
					</ul>
                    </span>
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