<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=wine_list.asp")
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
    <script language="javascript">
    <!--
        function gotoFunction() {
            self.location = document.productGoto.productList.options[document.productGoto.productList.selectedIndex].value;
        }
    // -->
    </script>
    	
    <div id="main" style="padding: 10px; background-color: #FFFFFF;">
    <FORM NAME="productGoto" ACTION="" METHOD="POST" CLASS="mstmnu">
    <SPAN CLASS="pull">
	<SELECT NAME="productList" ONCHANGE="gotoFunction()" ONBLUR="return options[0].selected = true">
	    <OPTION VALUE="#">Select A Varietal...
        
	    <OPTION VALUE="wine_list.asp#Aglianico">Aglianico</option>
        <OPTION VALUE="wine_list.asp#Aleatico">Aleatico</option>
        <OPTION VALUE="wine_list.asp#Arneis">Arneis</option>
        <OPTION VALUE="wine_list.asp#Barbera">Barbera</option>
        <OPTION VALUE="wine_list.asp#Barile%20Chardonnay">Barile Chardonnay</option>
        <OPTION VALUE="wine_list.asp#Blanc%20de%20Noir">Blanc de Noir</option>
        <OPTION VALUE="wine_list.asp#Blend">Blend</option>
        <OPTION VALUE="wine_list.asp#Bordeaux">Bordeaux</option>
        <OPTION VALUE="wine_list.asp#Bordeaux%20Blend">Bordeaux Blend</option>
        <OPTION VALUE="wine_list.asp#Brunello%20di%20Sangiovese">Brunello di Sangiovese</option>
        <OPTION VALUE="wine_list.asp#Cabernet%20Franc">Cabernet Franc</option>
        <OPTION VALUE="wine_list.asp#Cabernet%20Sauvignon">Cabernet Sauvignon</option>
        <OPTION VALUE="wine_list.asp#Cabernet%20Sauvignon%20Reserve">Cabernet Sauvignon Reserve</option>
        <OPTION VALUE="wine_list.asp#Calliope%20Red">Calliope Red</option>
        <OPTION VALUE="wine_list.asp#Cantata">Cantata</option>
        <OPTION VALUE="wine_list.asp#Castelletto%20Sangiovese">Castelletto Sangiovese</option>
        <OPTION VALUE="wine_list.asp#Chardonnay">Chardonnay</option>
        <OPTION VALUE="wine_list.asp#Chenin%20Blanc">Chenin Blanc</option>
        <OPTION VALUE="wine_list.asp#Claret">Claret</option>
        <OPTION VALUE="wine_list.asp#Concerto">Concerto</option>
        <OPTION VALUE="wine_list.asp#Cuvee">Cuvee</option>
        <OPTION VALUE="wine_list.asp#Dessert">Dessert</option>
        <OPTION VALUE="wine_list.asp#Dolcetto">Dolcetto</option>
        <OPTION VALUE="wine_list.asp#Estate%20Syrah">Estate Syrah</option>
        <OPTION VALUE="wine_list.asp#Fiore%20di%20Fano">Fiore di Fano</option>
        <OPTION VALUE="wine_list.asp#Franc%20De%20Blanc">Franc De Blanc</option>
        <OPTION VALUE="wine_list.asp#Fume%20Blanc">Fume Blanc</option>
        <OPTION VALUE="wine_list.asp#Garnacha">Garnacha</option>
        <OPTION VALUE="wine_list.asp#Garnacha%20Rosa">Garnacha Rosa</option>
        <OPTION VALUE="wine_list.asp#Gewürztraminer">Gewürztraminer</option>
        <OPTION VALUE="wine_list.asp#Grenache">Grenache</option>
        <OPTION VALUE="wine_list.asp#Grenache%20Rosé">Grenache Rosé</option>
        <OPTION VALUE="wine_list.asp#Grenache%20Sparkling%20Wine">Grenache Sparkling Wine</option>
        <OPTION VALUE="wine_list.asp#La%20Rosa%20(Rosé%20of%20Sangiovese)">La Rosa (Rosé of Sangiovese)</option>
        <OPTION VALUE="wine_list.asp#Lambrusca">Lambrusca</option>
        <OPTION VALUE="wine_list.asp#Malbec">Malbec</option>
        <OPTION VALUE="wine_list.asp#Malbec%20Oak">Malbec Oak</option>
        <OPTION VALUE="wine_list.asp#Malbec%20Rose">Malbec Rose</option>
        <OPTION VALUE="wine_list.asp#Malvasia%20Bianca">Malvasia Bianca</option>
        <OPTION VALUE="wine_list.asp#Meritage">Meritage</option>
        <OPTION VALUE="wine_list.asp#Merlot">Merlot</option>
        <OPTION VALUE="wine_list.asp#Miscuglio">Miscuglio</option>
        <OPTION VALUE="wine_list.asp#Montepulciano">Montepulciano</option>
        <OPTION VALUE="wine_list.asp#Moscato">Moscato</option>
        <OPTION VALUE="wine_list.asp#Moscato%20d’%20Asti">Moscato d’ Asti</option>
        <OPTION VALUE="wine_list.asp#Mourvèdre">Mourvèdre</option>
        <OPTION VALUE="wine_list.asp#Mourvèdre%20Rosé">Mourvèdre Rosé</option>
        <OPTION VALUE="wine_list.asp#Muscat">Muscat</option>
        <OPTION VALUE="wine_list.asp#Muscat%20Canelli">Muscat Canelli</option>
        <OPTION VALUE="wine_list.asp#Nebbiolo">Nebbiolo</option>
        <OPTION VALUE="wine_list.asp#Opulente">Opulente</option>
        <OPTION VALUE="wine_list.asp#Paradiso%20Port">Paradiso Port</option>
        <OPTION VALUE="wine_list.asp#Petit%20Syrah">Petit Syrah</option>
        <OPTION VALUE="wine_list.asp#Petit%20Verdot">Petit Verdot</option>
        <OPTION VALUE="wine_list.asp#Petite%20Sirah">Petite Sirah</option>
        <OPTION VALUE="wine_list.asp#Petite%20Syrah">Petite Syrah</option>
        <OPTION VALUE="wine_list.asp#Petite%20Verdot">Petite Verdot</option>
        <OPTION VALUE="wine_list.asp#Pinot%20Grigio">Pinot Grigio</option>
        <OPTION VALUE="wine_list.asp#Pinot%20Gris">Pinot Gris</option>
        <OPTION VALUE="wine_list.asp#Pinot%20Noir">Pinot Noir</option>
        <OPTION VALUE="wine_list.asp#Port">Port</option>
        <OPTION VALUE="wine_list.asp#Port%20Blends">Port Blends</option>
        <OPTION VALUE="wine_list.asp#Primitivo">Primitivo</option>
        <OPTION VALUE="wine_list.asp#Prosecco%20Superiore%20Brut">Prosecco Superiore Brut</option>
        <OPTION VALUE="wine_list.asp#Riesling">Riesling</option>
        <OPTION VALUE="wine_list.asp#Rosé">Rosé</option>
        <OPTION VALUE="wine_list.asp#Rousanne">Rousanne</option>
        <OPTION VALUE="wine_list.asp#Roussane">Roussane</option>
        <OPTION VALUE="wine_list.asp#Roussanne">Roussanne</option>
        <OPTION VALUE="wine_list.asp#Sangiovese">Sangiovese</option>
        <OPTION VALUE="wine_list.asp#Sauvignon%20Blanc">Sauvignon Blanc</option>
        <OPTION VALUE="wine_list.asp#Sherry">Sherry</option>
        <OPTION VALUE="wine_list.asp#Sonata">Sonata</option>
        <OPTION VALUE="wine_list.asp#Syrah">Syrah</option>
        <OPTION VALUE="wine_list.asp#Tempranillo">Tempranillo</option>
        <OPTION VALUE="wine_list.asp#Torrontes">Torrontes</option>
        <OPTION VALUE="wine_list.asp#Varietal">Varietal</option>
        <OPTION VALUE="wine_list.asp#Vecchio%20Frate">Vecchio Frate</option>
        <OPTION VALUE="wine_list.asp#Verdelho">Verdelho</option>
        <OPTION VALUE="wine_list.asp#Verdot">Verdot</option>
        <OPTION VALUE="wine_list.asp#Vermentino">Vermentino</option>
        <OPTION VALUE="wine_list.asp#Viognier">Viognier</option>
        <OPTION VALUE="wine_list.asp#White%20Merlot">White Merlot</option>
        <OPTION VALUE="wine_list.asp#White%20Zinfandel">White Zinfandel</option>
        <OPTION VALUE="wine_list.asp#Zinfandel">Zinfandel</option>
        <OPTION VALUE="wine_list.asp#Old%20Vine%20Zinfandel">Old Vine Zinfandel</option>

    </SELECT>
    </SPAN> 
    </FORM>     
   
								
   <script>
       function showCustomer(str) {
           if (str == "") {
               document.getElementById("txtHint").innerHTML = "";
               return;
           }
           if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
               xmlhttp = new XMLHttpRequest();
           }
           else {// code for IE6, IE5
               xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
           }
           xmlhttp.onreadystatechange = function () {
               if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                   document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
               }
           }
           xmlhttp.open("GET", "getcustomer.asp?q=" + str, true);
           xmlhttp.send();
       }
</script>


<form> 
<select name="customers" onchange="showCustomer(this.value)">
<option value="">Select a Wine Varietal:</option>
<option value="Riesling">Alfreds Futterkiste</option>
<option value="Chardonnay">North/South</option>
<option value="	Moscato">Wolski Zajazd</option>
</select>
</form>
<br>
<div id="txtHint">Wineries with your Varietal listed here...</div>




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
					<h4><a class="time" href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>"><% =rsWines("Name") %></a></h4>
                    <a class="published" href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a>
                                                    
					<time class="published" datetime="2015-10-15"><% =TStamp %></time>
                    <br />
                            <a href='wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>'><span class="published" >
                                <%select case rsWines("User_Like") %>
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
                            <br />
                            <a href='wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>'><span class="published" >
                                Score: <img alt="<%=rsWines("Tasting_Score")%> star taste!" src="images/<%=rsWines("Tasting_Score")%>-star.png"/>
                            </span></a>

				</header>
				<a href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>" class="image"><img src="<% =rsWines("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
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
								<a href="#" class="image"><img src="html5/Imperfect/images/pic09.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Euismod amet placerat vivamus porttitor</a></h3>
									<time class="published" datetime="2015-10-10">October 10, 2015</time>
								</header>
								<a href="#" class="image"><img src="html5/Imperfect/images/pic10.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Magna enim accumsan tortor cursus ultricies</a></h3>
									<time class="published" datetime="2015-10-08">October 8, 2015</time>
								</header>
								<a href="#" class="image"><img src="html5/Imperfect/images/pic11.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Congue ullam corper lorem ipsum dolor</a></h3>
									<time class="published" datetime="2015-10-06">October 7, 2015</time>
								</header>
								<a href="#" class="image"><img src="html5/Imperfect/images/pic12.jpg" alt="" /></a>
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
	</body>
</html>