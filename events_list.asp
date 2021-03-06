<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=events_list.asp")
        
    End If
    M=Session("userid")
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    E=Server.HtmlEncode(Request("E"))
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

		<style>
		.button {
    display: block;
    width: 150px;

}
		</style>
		
      <script> 
            $(document).ready(function(){
                $("img.favico").click(function(){
                    var icon = $(this).parent("span").data("fav");
                    //alert(icon);
                    if (icon==0)
                    {
                        $(this).parent("span").data("fav", 1);
                        $(this).attr("src", "images/fav_heart_true.png");
                        
                        var eventid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);

                        $.post("fav_handler.asp",
                        {
                            eventid: eventid,
                            userid: userid,
                            action: "insertEvent"
                        });                    
                    }
                    
                    if (icon==1){

                        $(this).parent("span").data("fav", 0);
                        $(this).attr("src", "images/fav_heart_vote.png");

                        var eventid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);
                        $.post("fav_handler.asp",
                        {
                            eventid: eventid,
                            userid: userid,
                            action: "deleteEvent"
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
	<div id="main">
		<% If Session("Role") = "Admin" Then %>	
			<a href="#/" class="button" id="AddNewBtn">Add New Event</a>
			<br />
		<% end if %>
		

        <% 


        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsEvents, rsFav


        'declare the SQL statement that will query the database
         SQL = "SELECT * FROM Events ORDER BY S_Date DESC, Name ASC"
        SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' ORDER BY Event_ID DESC"
       'Response.write SQL1
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set Connection1 = Server.CreateObject("ADODB.Connection")

        Set rsEvents = Server.CreateObject("ADODB.RecordSet")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        Connection1.Open ConnString

        'Open the Recordset object executing the SQL statement and return records 
        rsEvents.Open SQL,Connection
        rsFav.Open SQL1,Connection1

        'first of all determine whether there are any records 
        If rsEvents.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsEvents.Eof   
            'Do While NOT rsFav.Eof
        %>

	    <%
	    If not rsFav.EOF Then
            F_fav=rsFav("Member_ID")
	        'Response.write F_fav

            F_FavID = rsFav("Event_ID")
            'Response.write F_abc
        end if

	    E_Hours=len(rsEvents("E_Time"))
	    'Response.write T_Hours
	
	    E_Mail=len(rsEvents("EMail"))
	    'Response.write T_Hours

        E_Desc = len(rsEvents("Description")) 
        
        Location = rsEvents("Location")


        E_Fave = (rsEvents("ID"))

	    %>

		
        <article class="post">
            <footer>
                <div class="post">
                    <a href='event_details.asp?E=<%=rsEvents("ID")%>' ><img alt="<%=rsEvents("Name")%>" src='<%=rsEvents("Event_Image")%>'  /></a>
                </div>
                <div class="title2" style="margin-left: 20px">

                    <h3>
                        <% if F_FavID = E_Fave then %>
                    
                            <span data-fav="1" float:"left" id="<%=E_EventID %>" data-userid="<%=M %>">
                            <img  class="favico" alt="Select as Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right" />
                             </span>      
                            <%  If not rsFav.EOF Then
                                rsFav.MoveNext
                                end if 
                               
                            %> 
                            <% else  %>
                            <span data-fav="0" float:"left" id="<%=rsEvents("ID") %>" data-userid="<%=M %>">
                            <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right"  />
                            </span>    
                    <% end if %>
                        <a class="published" href='event_details.asp?E=<%=rsEvents("ID")%>'><%=rsEvents("Name")%></a>
                       
                        
                    </h3>
                    <b>Location:   </b><a target="_blank" href="<% =Location %>"><span class="published"><% =rsEvents("Address") %></span></a>


                                
                    <br />
                    
                    <span class="published"><b>Phone: </b><a href="tel:<%=rsEvents("Phone")%>"><%=rsEvents("Phone")%></a></span>
                                                
                    
                    <br /><span class="published"><b>Dates:</b>   <% =rsEvents("E_Day")%>,  <%=rsEvents("E_Date")%> </span>     
                                                       
                    <% if E_Hours > 6 then %>     
                        <br /><span class="published"><b>Hours:</b> <%=rsEvents("E_Time")%> </span>
	                                                   
                    <% end if %>





                    <br /><span class="published"><b>Tickets:</b> <%=rsEvents("Cost")%></span>

                                                
                </div>
            </footer>
        </article>
                        
        <%
        rsEvents.MoveNext     
        Loop
        End If
        %>

                                
        <%

        'close the connection and Recordset objects freeing up resources
        rsEvents.Close
        Set rsEvents=nothing
        Connection.Close
        Set Connection=nothing

        %>
						

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
        
		<section>Your favorite wine events in Temecula...
		<div class="mini-posts">

		<!-- Mini Post -->
		<article class="post">
			   <ul class="posts">  
			       
<!-- Database results for last 3 reviewed vines -->
        <% 

            'declare the variables 
            Dim wConnectionx
            Dim wConnectionStringx
            Dim wRecordsetx
            Dim wSQLx
            Dim rsWines

            'declare the SQL statement that will query the database
            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" & session("userid") & "' ORDER BY Tstamp DESC, Winery ASC Limit 3"
            fSQLe = "SELECT * FROM qry_Fav_Events WHERE Member_ID = '" & session("userid") & "' ORDER BY S_Date DESC Limit 3"

            'Response.write SQL1
            'define the connection string, specify database driver
            wConnStringx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

            'create an instance of the ADO connection and Recordset objects
            Set wConnectionx = Server.CreateObject("ADODB.Connection")
            Set fConnectione = Server.CreateObject("ADODB.Connection")

            Set rsWines = Server.CreateObject("ADODB.RecordSet")
            Set rsEvents = Server.CreateObject("ADODB.RecordSet")

            'Open the connection to the database
            wConnectionx.Open wConnStringx
            fConnectione.Open wConnStringx

            'Open the Recordset object executing the SQL statement and return records 
            rsWines.Open wSQLx,wConnectionx
            rsEvents.Open fSQLe,fConnectione

            'first of all determine whether there are any records 
            If rsWines.EOF  Then 
            Response.Write("You don't have any favorites yet :( ") 
            Else

            'if there are records then loop through the fields 
            Do While NOT rsWines.Eof   

            Tstamp = rsWines("Tstamp")
            TStamp = FormatDateTime(Tstamp,1)
            'response.write(FormatDateTime(Tstamp,1))

	    %>
		<li>
			<article>
				<header>
					<h3><a href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a></h3>
					<time class="published" datetime="2015-10-15"><% =TStamp %></time>
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
			<!-- Posts List -->
				<section>
					<ul class="posts">Advertisements
						<li>
							<article>
								<header>
									<h3><a href="#">Convallis maximus nisl mattis nunc id lorem</a></h3>
									<time class="published" datetime="2015-10-15">October 15, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Euismod amet placerat vivamus porttitor</a></h3>
									<time class="published" datetime="2015-10-10">October 10, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic10.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Magna enim accumsan tortor cursus ultricies</a></h3>
									<time class="published" datetime="2015-10-08">October 8, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic11.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Congue ullam corper lorem ipsum dolor</a></h3>
									<time class="published" datetime="2015-10-06">October 7, 2015</time>
								</header>
								<a href="#" class="image"><img src="images/pic12.jpg" alt="" /></a>
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
						<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
						<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					<p class="copyright">&copy; Save Your Cork. Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
				</section>

		</section>

</div>




	</body>
</html>