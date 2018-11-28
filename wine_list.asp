<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=wine_list.asp#login")
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

    <script language="javascript">
    <!--
        function gotoFunction() {
            self.location = document.productGoto.productList.options[document.productGoto.productList.selectedIndex].value;
        }
    // -->
    </script>
    	
    <div id="main" style="padding: 10px; background-color: #FFFFFF;">

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
               xmlhttp.open("GET", "getvarietal.asp?q=" + str, true);
               xmlhttp.send();
           }
</script>


<form> 
    <select name="customers" onchange="showCustomer(this.value)">
    <option value="">Select a Wine Varietal:</option>
	    <option value="Aglianico">Aglianico</option>
        <option value="Aleatico">Aleatico</option>
        <option value="Arneis">Arneis</option>
        <option value="Barbera">Barbera</option>
        <option value="Blanc%20de%20Noir">Blanc de Noir</option>
        <option value="Blend">Blend</option>
        <option value="Bordeaux">Bordeaux</option>
        <option value="Brunello">Brunello</option>
        <option value="Cabernet%20Franc">Cabernet Franc</option>
        <option value="Cabernet%20Sauvignon">Cabernet Sauvignon</option>
        <option value="Calliope%20Red">Calliope Red</option>
        <option value="Cantata">Cantata</option>
        <option value="Chardonnay">Chardonnay</option>
        <option value="Chenin%20Blanc">Chenin Blanc</option>
        <option value="Claret">Claret</option>
        <option value="Cuvee">Cuvee</option>
        <option value="Dessert">Dessert</option>
        <option value="Dolcetto">Dolcetto</option>
        <option value="Fiore%20di%20Fano">Fiore di Fano</option>
        <option value="Franc%20De%20Blanc">Franc De Blanc</option>
        <option value="Fume%20Blanc">Fume Blanc</option>
        <option value="Garnacha">Garnacha</option>
        <option value="Garnacha%20Rosa">Garnacha Rosa</option>
        <option value="Gewürztraminer">Gewürztraminer</option>
        <option value="Grenache">Grenache</option>
        <option value="Grenache%20Rosé">Grenache Rosé</option>
        <option value="Grenache%20Sparkling%20Wine">Grenache Sparkling Wine</option>
        <option value="Lambrusca">Lambrusca</option>
        <option value="Malbec">Malbec</option>
        <option value="Malbec%20Rose">Malbec Rose</option>
        <option value="Malvasia%20Bianca">Malvasia Bianca</option>
        <option value="Meritage">Meritage</option>
        <option value="Merlot">Merlot</option>
        <option value="Miscuglio">Miscuglio</option>
        <option value="Montepulciano">Montepulciano</option>
        <option value="Moscato">Moscato</option>
        <option value="Mourvèdre">Mourvèdre</option>
        <option value="Mourvèdre%20Rosé">Mourvèdre Rosé</option>
        <option value="Muscat">Muscat</option>
        <option value="Muscat%20Canelli">Muscat Canelli</option>
        <option value="Nebbiolo">Nebbiolo</option>
        <option value="Opulente">Opulente</option>
        <option value="Paradiso%20Port">Paradiso Port</option>
        <option value="Petit%20Syrah">Petit Syrah</option>
        <option value="Petit%20Verdot">Petit Verdot</option>
        <option value="Petite%20Sirah">Petite Sirah</option>
        <option value="Petite%20Syrah">Petite Syrah</option>
        <option value="Petite%20Verdot">Petite Verdot</option>
        <option value="Pinot%20Grigio">Pinot Grigio</option>
        <option value="Pinot%20Gris">Pinot Gris</option>
        <option value="Pinot%20Noir">Pinot Noir</option>
        <option value="Port">Port</option>
        <option value="Primitivo">Primitivo</option>
        <option value="Riesling">Riesling</option>
        <option value="Rosé">Rosé</option>
        <option value="Roussanne">Roussanne</option>
        <option value="Sangiovese">Sangiovese</option>
        <option value="Sauvignon%20Blanc">Sauvignon Blanc</option>
        <option value="Sherry">Sherry</option>
        <option value="Sonata">Sonata</option>
        <option value="Syrah">Syrah</option>
        <option value="Tempranillo">Tempranillo</option>
        <option value="Torrontes">Torrontes</option>
        <option value="Varietal">Varietal</option>
        <option value="Vecchio%20Frate">Vecchio Frate</option>
        <option value="Verdelho">Verdelho</option>
        <option value="Verdot">Verdot</option>
        <option value="Vermentino">Vermentino</option>
        <option value="Viognier">Viognier</option>
        <option value="White%20Merlot">White Merlot</option>
        <option value="White%20Zinfandel">White Zinfandel</option>
        <option value="Zinfandel">Zinfandel</option>
    </select>
    </form>
    <br>
<div id="txtHint">&nbsp;&nbsp;&nbsp;&nbsp;Wineries with your Varietal listed here...</div>

 

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
            wConnStringx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; option=3"

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
			<!-- Posts List for Advertisement -->


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