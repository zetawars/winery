<%

    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")

    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=vineyard_details.asp?V=" & Server.HtmlEncode(Request("V")))
        
    End If
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
			<script src="html5/imperfect/assets/js/jquery.min.js"></script>
			<script src="html5/imperfect/assets/js/skel.min.js"></script>
			<script src="html5/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="html5/imperfect/assets/js/main.js"></script>

        
        <script>
            $(document).ready(function () {
                $("img.favico").click(function () {
                    var icon = $(this).parent("span").data("fav");
                    //alert(icon);
                    if (icon == 0) {
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

                    if (icon == 1) {

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
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="home.asp">Save the Cork: Temecula</a></h1>
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

<!-- Database results for selected Vineyard and associated Favorite icon status -->
			    <%		
                'declare the variables 
                Dim Connection
                Dim ConnectionString
                Dim Recordset
                Dim SQL, SQL1
                Dim rsVineyard, rsFav


                'declare the SQL statement that will query the database
                SQL = "SELECT * FROM Vineyards WHERE ID =" & V
                SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Vineyard_ID =" &V& " ORDER BY Vineyard_ID DESC"
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


	            If not rsFav.EOF Then
                    F_fav=rsFav("Member_ID")
	                'Response.write "MID=" & F_fav & " / "

                    F_FavID = rsFav("Vineyard_ID")
                    'Response.write "FavVineyard=" & F_FavID & " /"
                end if

	            T_Rest=len(rsVineyard("Restaurant"))
	            'Response.write T_Rest
	
	            T_Hours=len(rsVineyard("Hours"))
	            'Response.write T_Hours
	
	            T_Taste=len(rsVineyard("Tastings"))
	            'Response.write T_Taste

                W_Fave = rsVineyard("ID")
                'Response.write "Vineyard ID=" & W_Fave & " /"


                GAdd = replace(rsVineyard("location")," ","+")
                GMapName = replace(rsVineyard("winery_name")," ","+")
                                                
                GAdd2 = GMapName + ",Temecula" '& "+" & GAdd 

                Notes = Replace(rsVineyard("Winery_Notes"),vbCrLf,"<br />")
	            %>

            <article class="post">
                <header>
                    <div class="title">
                        <img width="320" alt="<%=rsVineyard("Winery_Name")%>" src='<%=rsVineyard("Winery_Image")%>' style="border: 1px solid #C0C0C0" />
                        <br /><a href=""><img alt="winery visit" src='images/icon_planning.jpg' width="30" height="30" border="0" style="float: left; " /></a>

                                   
                    </div>
                    <div class="title2">

                        <h3>
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

                            <span class="published"><%=rsVineyard("Winery_Name")%></span>
                        </h3>

                        <a target="_blank" href="https://www.google.com/maps/place/<% =GAdd2 %>"><span class="published"><%=rsVineyard("Location")%></span></a>
                                
                        <br /><span class="published"><b>Phone: </b><a href="tel:<%=rsVineyard("Winery_Phone")%>"><%=rsVineyard("Winery_Phone")%></a></span>
                                

                        <% if T_Email > 7 then %>
                            <br/>
                            <span class="published"><b>E-Mail:</b><%="<a href=""mailto:" & rsVineyard("E_Mail") & """>" & rsVineyard("E_Mail") & "</a>"%></span>
                        <% end if %>
                                                
                        <% if T_Rest > 6 then %>
	                        <br /><span class="published"><b>Restaurant: </b><a href="dining_details.asp?D=<% =rsVineyard("Dining_ID") %>&V=<% =V %>"><%=rsVineyard("Restaurant")%></a></span>
                                    
                        <% end if %>
                                                
                        <% if T_Hours > 6 then %>     
                            <br /><span class="published"><b>Hours:</b> <%=rsVineyard("Hours")%> </span>
	                                                   
                        <% end if %>

	                    <% if T_Taste > 6 then %>     
	                        <br /><span class="published"><b>Tastings:</b> <%=rsVineyard("Tastings")%></span>
                                    
  	                    <% end if %>

                                   
                        <br/>
                        <span class="published"><b>Amenities:</b> <%=rsVineyard("Key_Amenities")%></span>


                        <br/> 

                        <span class="published"><b>Wine Production: </b> <%=rsVineyard("Wine_Types")%> </span>
    
                        <br/>
    
                        <span class="published"><b>Established:</b>    <%=rsVineyard("Established")%> </span>
                                              
                    </div>
                </header>
                
                <hr />
                
                <footer>
                    
                    <span class="published"><% =Notes %><hr /></span>
                    
                </footer>
                <footer>

			        <ul class="stats">
		        <section>
			        <div class="published">
                        
                        <h3>Wines available at this Vineyards</h3>
				        <!-- Mini Post -->
            
<!-- Database results for wines associated with Vineyard-->

                            <% 
                            'declare the variables 
                            Dim wvConnectionvx,mConnectionn
                            Dim wvConnectionStringvx
                            Dim wvRecordsetvx
                            Dim wvSQLvx,mSQLn
                            Dim rsvWinesv
                            Dim rsMemNote


                                'declare the SQL statement that will query the database
                                wvSQLvx = "SELECT * FROM Wines WHERE Winery_Number =" & V & " ORDER BY Type DESC, Name ASC, Vintage ASC"
                                mSQLn = "SELECT * FROM Members_Notes WHERE Winery=" & V & " AND Member='" & M & "'"

                                'Response.write mSQLn
                                'define the connection string, specify database driver
                                wvConnStringvx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                'create an instance of the ADO connection and Recordset objects
                                Set wvConnectionvx = Server.CreateObject("ADODB.Connection")
                                Set mConnectionn = Server.CreateObject("ADODB.Connection")

                                Set rsvWinesv = Server.CreateObject("ADODB.RecordSet")
                                Set rsMemNote = Server.CreateObject("ADODB.RecordSet")

                                'Open the connection to the database
                                wvConnectionvx.Open wvConnStringvx
                                mConnectionn.Open wvConnStringvx


                                'Open the Recordset object executing the SQL statement and return records 
                                rsvWinesv.Open wvSQLvx,wvConnectionvx
                                rsMemNote.Open mSQLn,mConnectionn

                                'first of all determine whether there are any records 
                                If rsvWinesv.EOF  Then 
                                    Response.Write("This winery has not listed any wines yet") 
                                Else
                                'if there are records then loop through the fields 
                                Do While NOT rsvWinesv.Eof   
                                %>

                                <%

                                'Do until rsMemNote.EOF 
                                '    If MN_Wine = rsvWinesv("ID") Then
                                '        Drank = True
                                '        Exit Do
                                '    Else
                                '        rsMemNote.MoveNext
                                '        Drank = False
                                '    end if 
                                'Loop


                                If not rsMemNote.EOF Then
                                    MN_Member = rsMemNote("Member")
	                                'Response.write rsMemNote("Member") & "b/"

                                    MN_Wine = rsMemNote("Wine")
                                    'Response.write MN_Wine & "w/"
                                End If

	                            %>
									<article class="published">
											<header>
                                                <%
                                                    DIM GroupName,tmpGroupName
                                                    GroupName = rsvWinesv("Type")
                                                    If GroupName <> tmpGroupName then
                                                    tmpGroupName=GroupName
                                                %>
                                                <br />
                                                <b><% =tmpGroupName %>&nbsp;</b>
                                                <br />
                                                <%end if%>
                                                
                                                
                                                <% if MN_Wine = rsvWinesv("ID") then %>
                                                <span data-fav="1" float:"left" id="<%=MN_Wine %>" data-userid="<%=M %>">
                                                    <img alt="I had this before" src="images/spacer_blue.jpg" style="vertical-align: middle; margin-right: 10px;" /><a class="" href='wine_details.asp?V=<% =rsvWinesv("Winery_Number") %>&W=<% =rsvWinesv("ID") %>'><% =rsvWinesv("Vintage") %>&nbsp;<% =rsvWinesv("Name") %></a>
                                                </span>
                                                    <%  If not rsMemNote.EOF Then
                                                            rsMemNote.MoveNext
                                                        end if 
                               
                                                    %> 
                                                
                                                <% else %>
                                                <span data-fav="1" float:"left" id="<%=rsvWinesv("ID") %>" data-userid="<%=M %>">
                                                    <img alt="" src="images/spacer_white.jpg" style="vertical-align: middle; margin-right: 10px;" /><a class="" href='wine_details.asp?V=<% =rsvWinesv("Winery_Number") %>&W=<% =rsvWinesv("ID") %>'><% =rsvWinesv("Vintage") %>&nbsp;<% =rsvWinesv("Name") %></a>
                                                </span>
                                                <% end if %> 
											
												            
       
											</header>
											            
										</article>

                            <%
                            rsvWinesv.MoveNext     
                            Loop
                            End If
                            %>

 					
							</section>                                               
    
                            <%

                            'close the connection and Recordset objects freeing up resources
                            rsvWinesv.Close
                            Set rsvWinesv=nothing
                            wvConnectionvx.Close
                            Set wvConnectionvx=nothing

                            %>

								</ul>
							</footer>
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
						



						<!-- Pagination -->
							<ul class="actions pagination">
                            
                                <% if V > 3 then %>
                                    <li><a href="vineyard_details.asp?V=2" class=" button big first" ><<</a></li>
								    <li><a href="vineyard_details.asp?V=<% =V-1 %>" class="button big previous">Previous Winery</a></li>
                                <% else %> 
                                    <li><a href="vineyard_details.asp?V=2" class=" disabled button big last" ><<</a></li>
                                    <li><a href="vineyard_details.asp?V=<% =V-1 %>" class=" disabled button big previous">Previous Winery</a></li>
                                <% end if %>

                                <% if V < 42 then %>
			    					<li><a href="vineyard_details.asp?V=<% =V+1 %>" class="button big next">Next Winery</a></li>
                                    <li><a href="vineyard_details.asp?V=42" class=" button big last" >>></a></li>
                                <% else %> 
                                    <li><a href="vineyard_details.asp?V=<% =V+1 %>" class=" disabled button big next">Next Winery</a></li>
                                    <li><a href="vineyard_details.asp?V=42" class=" disabled button big last" >>></a></li>
                                <% end if %>
							</ul>

					</div>

<!-- Sidebar -->
	<section id="sidebar">

		<!-- Intro -->
			<section id="intro">
				<a href="home.asp" class="image featured" ><img src="images/header_doffo.png" alt="" /></a>
				<header>
					<span style="font-size: 37px; font-weight:bold; color:Black">Save The Cork: Temecula</span>
					<p>Welcome to Southern California's Favorite Wine Country: <a name="V">Temecula</a></p>
				</header>
			</section>

		<!-- Mini Posts -->
			<section>
					<!-- header text to start column off. Does not display if memeber has no records -->
					<!-- Mini Post -->Some of my favorite wines...
                    <div class="mini-posts">
                                        
                        <article class="post">
                        <ul class="posts">  
<!-- Database results for last 3 reviewed vines indicated as I want or I Bought -->
                            <% 
                            'declare the variables 
                            Dim wConnectionx
                            Dim wConnectionStringx
                            Dim wRecordsetx
                            Dim wSQLx
                            Dim rsWines
                            Dim Count 
                            Count = 0

                            'declare the SQL statement that will query the database
                            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member ='" & Session("userid") & "' AND User_Like > 3 ORDER BY Tstamp DESC, Winery ASC Limit 3"

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
                            Response.Write("You have not selected any wine as a Favorite yet :(") 
                            Else
                            'if there are records then loop through the fields 
                            Do While NOT rsWines.Eof  
                                         
                            Tstamp = rsWines("Tstamp")
                            TStamp = FormatDateTime(Tstamp,2)
                            'response.write(FormatDateTime(Tstamp,1))
 
	                        %>
    

			                <li>
				                <article>
					                <header>
						                <h4><a class="time" href="wine_details.asp?W=<% =rsWines("Wine") %>&V=<% =rsWines("Vineyard") %>"><% =rsWines("Name") %></a></h4>
                                        <a class="published" href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a>
                                                    
						                <time class="published" datetime="2015-10-15"><% =TStamp %></time>
					                </header>
					                <a href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>" class="image"><img src="<% =rsWines("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
				                </article>
			                </li>
					
                            <%
                                rsWines.MoveNext
                                Count = Count + 1
                                'repsonse.write ("Count")
                                Loop
                                End If
                            %>
                        
                            <%

                            'close the connection and Recordset objects freeing up resources
                            rsWines.Close
                            Set rsWines=nothing
                            wConnectionx.Close
                            Set wConnectionx=nothing

                            %>
                        </ul>
                        </article>
 					</div>
				</section> 

                <% If Count > 1 then %>
  				<ul class="actions">
					<li><a href="tasting_cellar.asp" class="button big">View All My Wines</a></li>
				</ul>  
                <% end if %>

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