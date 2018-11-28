<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=vineyard_list.asp")
    End If

    M = Session("userid")
    V = Server.HtmlEncode(Request("V"))
    W = Server.HtmlEncode(Request("W"))
    query = Server.HtmlEncode(Request("query"))
%>

<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Save The Cork: Temecula by HTML5 UP</title>
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
            $(document).ready(function(){
                $("img.favico").click(function(){
                    var icon = $(this).parent("span").data("fav");
                    //alert(icon);
                    if (icon==0)
                    {
                        $(this).parent("span").data("fav", 1);
                        $(this).attr("src", "images/fav_heart_true.png");
                        
                        var vineyardid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);

                        $.post("fav_handler.asp",
                        {
                            vineyardid: vineyardid,
                            userid: userid,
                            action: "insert"
                        });                    
                    }
                    
                    if (icon==1){

                        $(this).parent("span").data("fav", 0);
                        $(this).attr("src", "images/fav_heart_vote.png");

                        var vineyardid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);
                        $.post("fav_handler.asp",
                        {
                            vineyardid: vineyardid,
                            userid: userid,
                            action: "delete"
                        });                       
                    }
            
                    
                
                });
            });


        </script>

<!-- jQuery calendar stuff -->

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
      $(function () {
          $("#datepicker").datepicker();
      });
  </script>
<!-- end jquery scripts -->



	</head>
	<body>

<!-- Wrapper -->
	<div id="wrapper">

                
	<header id="header">
		<h1><a href="home.asp">Save the Cork: Temecula</a></h1>
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
        
        <table width="100%" bgcolor="ButtonHighlight"><tr><td>
									
        <% 

        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsVineyard, rsFav


        'declare the SQL statement that will query the database
         SQL = "SELECT * FROM Vineyards WHERE Winery_Name LIKE '%" & query & "%' ORDER BY Winery_Name ASC "
        SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Vineyard_ID Is Not NUll ORDER BY Vineyard_ID ASC"
        'Response.write SQL
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set Connection1 = Server.CreateObject("ADODB.Connection")

        Set rsVineyard = Server.CreateObject("ADODB.RecordSet")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        Connection1.Open ConnString

        'Open the Recordset object executing the SQL statement and return records 
        rsVineyard.Open SQL,Connection
        rsFav.Open SQL1,Connection1

        'first of all determine whether there are any records 
        If rsVineyard.EOF  Then 
        Response.Write ("Your search of Vineyards for """ & query & """ returned no records. Maybe check your spelling or use fewer letters.") 
        Else
        'if there are records then loop through the fields 
        Response.Write ("Your search of Vineyards for """& query &""" returned the follwing results:")
         
         Do While NOT rsVineyard.Eof   
            'Do While NOT rsFav.Eof

        %>

	    <%

	    
        If not rsFav.EOF Then
            F_fav=rsFav("Member_ID")
	        'Response.write "Fav=" & F_fav

            F_FavID = rsFav("Vineyard_ID")
            'Response.write "Fav_D=" & F_FavID
        End If
        

	    %>
       
        <article class="post">
            <header>

                <div class="title">
                    <a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>' ><img width="320" alt="<%=rsVineyard("Winery_Name")%>" src='<%=rsVineyard("Winery_Image")%>'  /></a>
                    <br />
                    <!--  <a href=""><i class="fa fa-calendar-minus-o" style="font-size:22px;color:#960032"></i></a>  -->

                </div>
                <div class="title2" style="margin-left: 20px">

                   <h3>  
                        <% if W_Fave = F_FavID then %>
                            <span data-fav="1" float:"left" id="<%=F_FavID %>" data-userid="<%=M %>">
                            <img  class="favico" alt="Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right; " />
                             </span>      
                            <%  
                                If not rsFav.EOF Then
                                    rsFav.MoveNext
                                End if 
                            %> 
                            <% else  %>
                            <span data-fav="0" float:"left" id="<%=rsVineyard("ID") %>" data-userid="<%=M %>">
                            <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right; " />
                            </span>    
                            <% end if %>
                    
                       <a class="published" href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><%=rsVineyard("Winery_Name")%></a>
                    </h3>

                    <a target="_blank" href="https://www.google.com/maps/search/<% =GAdd2 %>"><span class="published"><% =Loca %></span></a>
                                
                    
                    <br /><span class="published"><b>Phone: </b><a href="tel:<%=rsVineyard("Winery_Phone")%>"><%=rsVineyard("Winery_Phone")%></a></span>
                                                

                                                
                </div>

            </header>
        </article>
                        
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

        rsFav.Close
        Set rsFav=nothing
        Connection1.Close
        Set Connection1=nothing

        %>
<br /><br />
        </td></tr></table>

		

        <table width="100%" bgcolor="ButtonHighlight"><tr><td>


        <% 

        'this is the results for the wines section
        'declare the variables 
        Dim wConnections
        Dim wConnectionStrings
        
        Dim wSQLs
        Dim rsWine


        'declare the SQL statement that will query the database
         wSQLs = "SELECT * FROM Wines WHERE Name LIKE '%" & query & "%' ORDER BY Winery ASC, Name ASC "
        
        'Response.write SQL
        'define the connection string, specify database driver
        wConnStrings = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set wConnections = Server.CreateObject("ADODB.Connection")
        Set rsWine = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        wConnections.Open wConnStrings
       
        'Open the Recordset object executing the SQL statement and return records 
        rsWine.Open wSQLs,wConnections
       
        'first of all determine whether there are any records 
        If rsWine.EOF  Then 
        Response.Write("Your search of Wines for """ & query & """ returned no records. Maybe check your spelling or use fewer letters.") 
        Else
        'if there are records then loop through the fields 
        Response.write "Your search of Wines for """ & query & """ returned the following results:<br /><br />"
        
        Do While NOT rsWine.Eof   
            'Do While NOT rsFav.Eof

        %>

        
        
               <div class="title2" style="margin-left: 20px; text-indent: 10px; line-height: 30px;">
                     
                       <a class="published" href='wine_details.asp?V=<%=rsWine("Winery_Number")%>&W=<%=rsWine("ID")%>'><%=rsWine("Winery")%>&nbsp;<%=rsWine("Name")%>&nbsp;<%=rsWine("Vintage")%></a>
                   
                </div>

                        
        <%
        rsWine.MoveNext     
        Loop
        End If
        %>
                      
        <%
        'close the connection and Recordset objects freeing up resources
        rsWine.Close
        Set rsWine=nothing
        wConnections.Close
        Set wConnections=nothing

        %>
 
        </td></tr></table>

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
			<!-- Posts List advertisements-->



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