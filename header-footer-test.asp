

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

        

	</head>
	<body>

<!-- Wrapper -->
	<div id="wrapper">



<!-- Main -->
	<div id="main">
    **********    this section uses the header formatting    *****************
<br /><br />
									
        <% 

        'declare the variables 
        Dim Connection
        Dim ConnectionString
        Dim Recordset
        Dim SQL, SQL1
        Dim rsVineyard, rsFav


        'declare the SQL statement that will query the database
         SQL = "SELECT * FROM qry_Vineyard_Favorites ORDER BY Vineyard_ID DESC, Winery_Name ASC limit 5"
        SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' ORDER BY Vineyard_ID DESC"
       'Response.write SQL1
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
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsVineyard.Eof   
            'Do While NOT rsFav.Eof
        %>

	    <%
	    If not rsFav.EOF Then
            F_fav=rsFav("Member_ID")
	        'Response.write F_fav

            F_FavID = rsFav("Vineyard_ID")
            'Response.write F_abc
        end if

	    T_Rest=len(rsVineyard("Restaurant"))
	    'Response.write T_Rest
	
	    T_Hours=len(rsVineyard("Hours"))
	    'Response.write T_Hours
	
	    T_Taste=len(rsVineyard("Tastings"))
	    'Response.write T_Taste

        W_Fave = rsVineyard("Vineyard_ID")
        'Response.write W_Fave

        GAdd = replace(rsVineyard("Location")," ","+")
        GMapName = replace(rsVineyard("Winery_Name")," ","+")
                                                
        GAdd2 = GMapName + ",Temecula" '& "+" & GAdd 
        Loca =Left(rsVineyard("Location"),(InStrRev(rsVineyard("Location"),",") -1))
	    %>

        <article class="post">
            <header>

                <div class="title">
                    <a href='vineyard_details.asp?V=<%=rsVineyard("ID")%>' ><img width="320" alt="<%=rsVineyard("Winery_Name")%>" src='<%=rsVineyard("Winery_Image")%>'  /></a>
                </div>
                <div class="title2" style="margin-left: 20px">

                    
                        <% if F_FavID = W_Fave then %>
                            <span data-fav="1" float:"left" id="<%=F_FavID %>" data-userid="<%=M %>">
                            <img  class="favico" alt="Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right; " />
                             </span>      
                            <%  If not rsFav.EOF Then
                                rsFav.MoveNext
                                end if 
                               
                            %> 
                            <% else  %>
                            <span data-fav="0" float:"left" id="<%=rsVineyard("ID") %>" data-userid="<%=M %>">
                            <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right; " />
                            </span>    
                            <% end if %>
                    
                    <h3>    <a class="published" href='vineyard_details.asp?V=<%=rsVineyard("ID")%>'><%=rsVineyard("Winery_Name")%></a>
                    </h3>
                    <a target="_blank" href="https://www.google.com/maps/place/<% =GAdd2 %>"><span class="published"><% =Loca %></span></a>
                                
                    <br /><br /><span class="published"><b>Phone: </b><a href="tel:<%=rsVineyard("Winery_Phone")%>"><%=rsVineyard("Winery_Phone")%></a></span>
                                                
                    <% if T_Rest > 6 then %>
	                    <br /><span class="published"><b>Restaurant: </b><a href=""><%=rsVineyard("Restaurant")%></a></span>
                                    
                    <% end if %>
                                                
                    <% if T_Hours > 6 then %>     
                        <br /><span class="published"><b>Hours:</b> <%=rsVineyard("Hours")%> </span>
	                                                   
                    <% end if %>

	                <% if T_Taste > 6 then %>     
	                    <br /><span class="published"><b>Tastings:</b> <%=rsVineyard("Tastings")%></span>
                                    
  	                <% end if %>
                    
                    
                                                
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

        %>
<br /><br />					

	

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
        
        <span class="author" >Legend: T = Total Tastings Recorded; S = Sparkling Wines, W = White/Rose Wines, R = Red Wines, D = Dessert/Sweet Wines</span>
        <br />
        <span class="intro" >Legend: T = Total Tastings Recorded; S = Sparkling Wines, W = White/Rose Wines, R = Red Wines, D = Dessert/Sweet Wines</span>

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
            TStamp = FormatDateTime(Tstamp,1)
            'response.write(FormatDateTime(Tstamp,1))
            'Response.Write "M=" & M

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
						<li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
						<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					<p class="copyright">&copy; Save The Cork. Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
				</section>

		</section>

</div>
	</body>
</html>