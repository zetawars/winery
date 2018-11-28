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
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">

      <script>
          $(document).ready(function () {
              $("img.favico").click(function () {
                  var icon = $(this).parent("span").data("fav");
                  //alert(icon);
                  if (icon == 0) {
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

                  if (icon == 1) {

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

									
        <% 

        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsEvents, rsFav


        'declare the SQL statement that will query the database
         SQL = "SELECT * FROM Events WHERE ID=" & E & " ORDER BY S_Date DESC, Name ASC"
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


        E_Fave = (rsEvents("ID"))



        If rsEvents("Address") = "Various" then
            Location = "https://www.google.com/maps/place/Temecula,+CA/@33.5360982,-117.0560976,14z/data=!4m2!3m1!1s0x80db6252f51abe23:0x68bc0e88a03806a8"
        Else
            GAdd = replace(rsEvents("Address")," ","+")
            GMapName = replace(rsEvents("Name")," ","+")
                                                
            Location = "https://www.google.com/maps/place/" & GAdd + ",Temecula" '& "+" & GAdd 
            'Loca =Left(rsEvents("Address"),(InStrRev(rsEvents("Address"),",") -1))
        End If


	    %>

        <article class="post">
            <footer>
                <div class="post">
                    <a href='event_details.asp?E=<%=rsEvents("ID")%>' ><img alt="<%=rsEvents("Name")%>" src='<%=rsEvents("Event_Image")%>'  /></a>
                </div>
                <div class="title2" style="margin-left: 20px">

                    <h3>
                        <% if F_FavID = E_Fave then %>
                    
                            <span data-fav="1" float:"left" id="<%= F_FavID %>" data-userid="<%=M %>">
                            <img  class="favico" alt="Select as Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right" />
                             </span>      
                            <%  If not rsFav.EOF Then
                                rsFav.MoveNext
                                end if 
                               
                            %> 
                            <% else  %>
                            <span data-fav="0" float:"left" id='<%=rsEvents("ID") %>' data-userid="<%=M %>">
                            <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right"  />
                            </span>    
                        <% end if %>
                        <a class="published" href='event_details.asp?E=<%=rsEvents("ID")%>'><%=rsEvents("Name")%></a>
                       
                        
                    </h3>
                    <b>Location:   </b><a target="_blank" href="<% =Location %>"><span class="published"><% =rsEvents("Address") %></span></a>


                                
                    <br />
                    
                    <span class="published"><b>Phone: </b><a href="tel:<%=rsEvents("Phone")%>"><%=rsEvents("Phone")%></a></span>
                                                
                    <br /><br /><span class="published"><b>Days:</b> <% =rsEvents("E_Day")%></span>
                    <br /><span class="published"><b>Dates:</b> <%=rsEvents("E_Date")%> </span>     
                                                       
                    <% if E_Hours > 6 then %>     
                        <br /><span class="published"><b>Hours:</b> <%=rsEvents("E_Time")%> </span>
	                                                   
                    <% end if %>

    
	                
                    <br /><span class="published"><b>Description:</b> <%=rsEvents("Description")%></span>
                    <br />
                    <br /><span class="published"><b>Additional:</b> <%=rsEvents("Special_Note")%></span>
                    <br />
                    
                    <br /><span class="published"><b>Website:</b> <a target="_blank" href="<%=rsEvents("Website")%>">For more info, check the website</A></span>

                    <% if E_Mail > 6 then %>
                    <br /><span class="published"><b>E-Mail:</b> <a href="mailto:<%=rsEvents("EMail")%>?Subject=<%=rsEvents("Name")%>">e-mail the event for more info</a></span>
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
        
		<section>Upcoming events...
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
            wSQLx = "SELECT * FROM Events ORDER BY S_Date DESC Limit 3"

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
            Response.Write("You don't have any favorites yet :( ") 
            Else
            'if there are records then loop through the fields 
            Do While NOT rsWines.Eof   

            TStamp = rsWines("S_Date")
            TStamp = FormatDateTime(Tstamp,1)
            'response.write(FormatDateTime(Tstamp,1))

	    %>
		<li>
			<article>
				<header>
					<h3><a href="event_details.asp?E=<% =rsWines("ID") %>"><% =rsWines("Name") %></a></h3>
					<time class="published" datetime="2015-10-15"><% =rsWines("E_Date") %></time>
				</header>
				<a href="event_details.asp?E=<% =rsWines("ID") %>" class="image"><img src="<% =rsWines("Event_Image") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
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
									
								
								<a href="#" class="image"><div class="ad">
						<script type='text/javascript'><!--						    //<![CDATA[
						    var m3_u = (location.protocol == 'https:' ? 'https://www2.cleverconcepts.net/ads/www/delivery/ajs.php' : 'http://ads.cleverconcepts.net/www/delivery/ajs.php');
						    var m3_r = Math.floor(Math.random() * 99999999999);
						    if (!document.MAX_used) document.MAX_used = ',';
						    document.write("<scr" + "ipt type='text/javascript' src='" + m3_u);
						    document.write("?zoneid=4");
						    document.write('&amp;cb=' + m3_r);
						    if (document.MAX_used != ',') document.write("&amp;exclude=" + document.MAX_used);
						    document.write(document.charset ? '&amp;charset=' + document.charset : (document.characterSet ? '&amp;charset=' + document.characterSet : ''));
						    document.write("&amp;loc=" + escape(window.location));
						    if (document.referrer) document.write("&amp;referer=" + escape(document.referrer));
						    if (document.context) document.write("&context=" + escape(document.context));
						    if (document.mmm_fo) document.write("&amp;mmm_fo=1");
						    document.write("'><\/scr" + "ipt>");
						//]]>--></script><noscript><a href='http://ads.cleverconcepts.net/www/delivery/ck.php?n=a7686cff&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://ads.cleverconcepts.net/www/delivery/avw.php?zoneid=4&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a7686cff' border='0' alt='' /></a></noscript></a>
							</header></article>
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
	</body>
</html>