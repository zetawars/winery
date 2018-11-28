<%
    D=Server.HtmlEncode(Request("D"))
    'M="20110001-free"
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")
    'response.write M

    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=dining_details.asp?D=" & Server.HtmlEncode(Request("V")))
        
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
		<title>Save Your Cork: Temecula by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="html5/imperfect/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">
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
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
                       
                        <!--#include file="links_menu.html"-->

					</section>
            
				<!-- Main -->
			<div id="main">

<!-- Database results for selected Dining record and associated Favorite icon status -->
			    <%		
                'declare the variables 
                Dim Connection
                Dim ConnectionString
                Dim Recordset
                Dim SQL, SQL1
                Dim rsDining, rsFav


                'declare the SQL statement that will query the database
                SQL = "SELECT * FROM Dining WHERE ID=" & D
                SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Dining_ID =" &D& " ORDER BY Vineyard_ID DESC"
                'Response.write SQL
                
                'define the connection string, specify database driver
                ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                'create an instance of the ADO connection and Recordset objects
                Set Connection = Server.CreateObject("ADODB.Connection")
                Set Connection1 = Server.CreateObject("ADODB.Connection")

                Set rsDining = Server.CreateObject("ADODB.RecordSet")
                Set rsFav = Server.CreateObject("ADODB.RecordSet")

                'Open the connection to the database
                Connection.Open ConnString
                Connection1.Open ConnString

                'Open the Recordset object executing the SQL statement and return records 
                rsDining.Open SQL,Connection
                rsFav.Open SQL1,Connection1

                'first of all determine whether there are any records 
                If rsDining.EOF  Then 
                Response.Write("No records returned.") 
                Else
                'if there are records then loop through the fields 
                Do While NOT rsDining.Eof   
                    'Do While NOT rsFav.Eof


	            If not rsFav.EOF Then
                    F_memberID=rsFav("Member_ID")
	                'Response.write F_fav

                    F_FavID = rsFav("Dining_ID")
                    'Response.write F_abc
                end if

                D_DiningID = rsDining("ID")


	            T_Rest=len(rsDining("Restaurant"))
	            'Response.write T_Rest
	
	            T_Hours=len(rsDining("Hours"))
	            'Response.write T_Hours
	
	            T_Taste=len(rsDining("Specials"))
	            'Response.write T_Taste

                W_Fave = rsDining("ID")
                'Response.write "Vineyard ID=" & W_Fave & " /"


                GAdd = replace(rsDining("Address")," ","+")
                GMapName = replace(rsDining("Restaurant")," ","+")
                                                
                GAdd2 = GMapName + ",Temecula" '& "+" & GAdd 

                Notes = Replace(rsDining("Style"),vbCrLf,"<br />")



                If len(rsDining("Menu_Lunch")) > 6 then 
                    Lunch = rsDining("Menu_Lunch")
                    DinnerCl = 2
                end if

                If len(rsDining("Menu_Dinner")) > 6 then
                    Dinner = rsDining("Menu_Dinner")
                    DinnerCD = 3
                end if

                If len(rsDining("Menu_Brunch")) > 6 then
                    Brunch = rsDining("Menu_Brunch")
                    DinnerCb = 4
                end if


                Dim Menu_Legend
                Menu_Legend = DinnerCD+ DinnerCL + DinnerCB
                'create a legend for menu displays
                '2 = display Lunch only
                '3 display dinner ponly
                '4 display brunch only
                '5 display lunch and dinner
                '6 display lunch and brunch
                '7 display dinner and brunch
                '9 display all three
                'Response.write Menu_Legend

                'Response.write "Lunch" & Lunch & " / Dinner=" &  Dinner & " / Brunch=" &  Brunch
                %>

            <article class="post">
                <header>
                    <div class="title">
                        <img width="300" alt="<%=rsDining("Restaurant")%>" src='<%=rsDining("Dining_Image")%>' style="border: 1px solid #C0C0C0" />
                                   
                    </div>
                    <div class="title">

                        <h3>
                            <% if F_FavID = D_DiningID then %>
                    
                                 <span data-fav="1" float:"left" id="<%=F_FavID %>" data-userid="<%=M %>">
                                <img  class="favico" alt="Select as Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right" />
                                 </span>      
                                <%  If not rsFav.EOF Then
                                    rsFav.MoveNext
                                    end if 
                               
                                %> 
                                <% else  %>
                                <span data-fav="0" float:"left" id="<%=D_DiningID %>" data-userid="<%=M %>">
                                <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right"   />
                                </span>    
                         <% end if %>

                            <span class="published"><%=rsDining("Restaurant")%></span>
                        </h3>

                        <a target="_blank" href="https://www.google.com/maps/place/<% =GAdd2 %>"><span class="published"><%=rsDining("Address")%></span></a>
                                
                        <br /><br /><span class="published"><b>Phone: </b><a href="tel:<%=rsDining("Phone")%>"><%=rsDining("Phone")%></a></span>
                                


                                                
                        <% if T_Rest > 6 then %>
	                        <br /><span class="published"><b>Winery: </b><a href='vineyard_details.asp?V=<%=rsDining("Vineyard_ID")%>' ><%=rsDining("Vineyard")%></a></span>
                                    
                        <% end if %>
                                                
                        <% if T_Hours > 6 then %>     
                            <br /><span class="published"><b>Hours:</b> <%=rsDining("Hours")%> </span>
	                                                   
                        <% end if %>

	                    <% if T_Taste > 6 then %>     
	                        <br /><span class="published"><b>Style:</b> <%=rsDining("Style")%></span>
                                    
  	                    <% end if %>
                                       
                        <br/>
                        <span class="published"><b>Amenities:</b> <%=rsDining("Specials")%></span>

                        <% If Menu_Legend = 2 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Lunch %>"> Menu</a></span>
                        <% End if %>                        
                        
                        <% If Menu_Legend = 3 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Dinner %>"> Menu</a></span>
                        <% End if %>
                        
                        <% If Menu_Legend = 4 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Brunch %>"> Menu</a></span>
                        <% End if %>
                        
                        <% If Menu_Legend = 5 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Lunch %>">Lunch Menu</a></span>
                            <br /><span class="published"><b></b> <a target="_blank" href="<% = Dinner %>" style="margin-left: 54px">Dinner Menu</a></span>
                        <% End if %>
                        
                        <% If Menu_Legend = 6 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Lunch %>">Lunch Menu</a></span>
                            <br /><span class="published"><b></b> <a target="_blank" href="<% = Brunch %>" style="margin-left: 54px">Brunch Menu</a></span>
                        <% End if %>
                        
                        <% If Menu_Legend = 7 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Dinner %>">Dinner Menu</a></span>
                            <br /><span class="published"><b></b> <a target="_blank" href="<% = Brunch %>" style="margin-left: 54px">Brunch Menu</a></span>
                        <% End if %>                                                                                                

                        <% If Menu_Legend = 9 then %>
                            <br /><span class="published"><b>Menu:</b> <a target="_blank" href="<% = Lunch %>">Lunch</a></span>
                            <br /><span class="published"><b></b> <a target="_blank" href="<% = Dinner %>" style="margin-left: 54px">Dinner</a></span>
                            <br /><span class="published"><b></b> <a target="_blank" href="<% = Brunch %>" style="margin-left: 54px">Brunch</a></span>
                        <% End if %>  

                        <br/> 
                        <span class="published"><b>Price: </b> 
                        <font color="#cc0033">
                        <%
                        P= rsDining("Pricing")
                        select case P
                            Case 1
                            response.write("$")
                            Case 2
                            response.write("$$")
                            Case 3
                            response.write("$$$")
                            Case 4
                            response.write("$$$$")
                        End Select
                        %>

                        </font>
                        
                        
                        
                        </span>
    
                        <br/>

                                              
                    </div>
                </header>

                 
                        <%
                        rsDining.MoveNext     
                        Loop
                        End If
                        %>

                                                
    
                        <%

                        'close the connection and Recordset objects freeing up resources
                        rsDining.Close
                        Set rsDining=nothing
                        Connection.Close
                        Set Connection=nothing

                        %>
						



						<!-- Pagination -->
							<ul class="actions pagination">
                            
                                <% if D > 1 then %>
                                    <li><a href="dining_details.asp?D=1" class=" button big first" ><<</a></li>
								    <li><a href="dining_details.asp?D=<% =D-1 %>" class="button big previous">Previous Dining</a></li>
                                <% else %> 
                                    <li><a href="dining_details.asp?D=2" class=" disabled button big last" ><<</a></li>
                                    <li><a href="dining_details.asp?D=<% =D-1 %>" class=" disabled button big previous">Previous Dining</a></li>
                                <% end if %>

                                <% if D < 12 then %>
			    					<li><a href="dining_details.asp?D=<% =D+1 %>" class="button big next">Next Dining</a></li>
                                    <li><a href="dining_details.asp?D=12" class=" button big last" >>></a></li>
                                <% else %> 
                                    <li><a href="dining_details.asp?D=<% =D+1 %>" class=" disabled button big next">Next Dining</a></li>
                                    <li><a href="dining_details.asp?D=12" class=" disabled button big last" >>></a></li>
                                <% end if %>
							</ul>

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

			<!-- Mini Posts -->
		        <section>Some of my recent visits...
		        <div class="mini-posts">

		        <!-- Mini Post -->
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
                            wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member ='" & Session("userid") & "' ORDER BY Tstamp DESC, Winery ASC Limit 3"

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
                            TStamp = FormatDateTime(Tstamp,1)
                            'response.write(FormatDateTime(Tstamp,1))
                            'NewImage = replace(rsWines("Image_Location"),"header","logo")
                            'Response.Write NewImage

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

                            <% If Count > 1 then %>
  							<ul class="actions">
								<li><a href="tasting_cellar.asp" class="button big">View All My Wines</a></li>
							</ul>  
                            <% end if %>

						<!-- About -->
							<section class="blurb">
								<h2>add'l info</h2>
								<p><img alt="" src="" width="136" style="float: right; margin-left: 5px;" />
                                
                                </p>
								<ul class="actions">
									<li><a href="tasting_school.asp" class="button"></a></li>
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
			<script src="html5/imperfect/assets/js/jquery.min.js"></script>
			<script src="html5/imperfect/assets/js/skel.min.js"></script>
			<script src="html5/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="html5/imperfect/assets/js/main.js"></script>


                        <script> 
            $(document).ready(function(){
                $("img.favico").click(function(){
                    var icon = $(this).parent("span").data("fav");
                    //alert(icon);
                    if (icon==0)
                    {
                        $(this).parent("span").data("fav", 1);
                        $(this).attr("src", "images/fav_heart_true.png");
                        
                        var diningid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);

                        $.post("fav_handler.asp",
                        {
                            diningid: diningid,
                            userid: userid,
                            action: "insertDining"
                        });                    
                    }
                    
                    if (icon==1){

                        $(this).parent("span").data("fav", 0);
                        $(this).attr("src", "images/fav_heart_vote.png");

                        var diningid = $(this).parent("span").attr("id");
                        var userid = $(this).parent("span").data("userid");
                        //alert(vineyardid+userid);
                        $.post("fav_handler.asp",
                        {
                            diningid: diningid,
                            userid: userid,
                            action: "deleteDining"
                        });                       
                    }
            
                    
                
                });
            });


        </script>


	</body>
</html>