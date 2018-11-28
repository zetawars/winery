<%

    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")

    If Session("loggedin") <> true Then
        Response.Redirect("Login.asp?requester=wine_details.asp?V=" & Server.HtmlEncode(Request("V")) & "&W=" & Server.HtmlEncode(Request("W")))
        
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


<style>

.rating {
    float:center;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
   follow these rules. Every browser that supports :checked also supports :not(), so
   it doesn’t make the test unnecessarily selective */
.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rating:not(:checked) > label {
    float:right;
    width:1em;
    padding:0 .1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    line-height:1.2;
    color:#ddd;
    text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:before {
    content: '★ ';
}

.rating > input:checked ~ label {
    color: #f70;
    text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
    color: gold;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
    color: #ea0;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > label:active {
    position:relative;
    top:2px;
    left:2px;
}

    #user-likes, #comments {
        display:none;
    }

</style>

<script>
    $(document).ready(function () {
        $("#tasting-score").click(function () {
            $("#user-likes").show();    
        });
        
        $(".like-btn").click(function () {
            $("#comments").show();  
            var ele = $(this).data("like");
            $("input[name='likesVal']").val(ele);
            alert(ele);
        });

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
                            Dim rsWines, rsFav


                            'declare the SQL statement that will query the database
                            SQL = "SELECT * FROM qry_Wine_Details WHERE ID =" & W
                            SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Wine_ID =" &W& " ORDER BY Vineyard_ID DESC"
                            'Response.write SQL1
                            'define the connection string, specify database driver
                            ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                            'create an instance of the ADO connection and Recordset objects
                            Set Connection = Server.CreateObject("ADODB.Connection")
                            Set Connection1 = Server.CreateObject("ADODB.Connection")

                            Set rsWines = Server.CreateObject("ADODB.RecordSet")
                            Set rsFav = Server.CreateObject("ADODB.RecordSet")

                            'Open the connection to the database
                            Connection.Open ConnString
                            Connection1.Open ConnString

                            'Open the Recordset object executing the SQL statement and return records 
                            rsWines.Open SQL,Connection
                            rsFav.Open SQL1,Connection1

                            'first of all determine whether there are any records 
                            If rsWines.EOF  Then 
                            Response.Write("No records returned.") 
                            Else
                            'if there are records then loop through the fields 
                            Do While NOT rsWines.Eof   
                                'Do While NOT rsFav.Eof
                            %>

	                            <%
	                            If not rsFav.EOF Then
                                F_fav = rsFav("Member_ID")
                                'response.write F_fav & "test"

                                F_FavID = rsFav("Wine_ID")
                                'response.write F_favID
                                end if

                                W_Fave = rsWines("ID")

                                FoodP = len(rsWines("Food_Pairing"))

                                W_Comp = len(rsWines("Composition"))
                                W_Alc = len(rsWines("Alcohol"))
                                Alc= rsWines("Alcohol")*100 & "%"
                                W_Age = len(rsWines("Aging"))
                                W_Web = len(rsWines("Website"))

	                            %>

                        <article class="post">
                            <header>

                                <div class="title2">

                                    <h3>
                                        <span class="published" style="text-align: left"><a href="vineyard_details.asp?V=<%=rsWines("Winery_Number")%>"><%=rsWines("Winery")%></a></span>
                                    </h3>
                                    <br /><br />

	                                <% 'if image exists, use image location, else, use filler image  %>

                                    <% if len(rsWines("Image_Location")) > 7 then %>
		                                <a href="vineyard_details.asp?V=<%=rsWines("Winery_Number")%>"><img border="0" src="<%=rsWines("Image_Location")%>" alt="<%=rsWines("Name")%>" hspace="00" style="float: left; margin-right: 20px;" width="150" height="200" /></a>
                                    <% else %>
		                                <img border="0" src="http://www.postcardsfromthenet.com/images/No_Image_Red.jpg" alt="no image" width="150" height="200" style="float: left" />
	                                <% end if %>

                                    
                                    <% ' if Wine id is in favorite table display red heart, else display empty heart %>
                                    <% if F_FavID = W_Fave then %>
                                        <span data-fav="1" float:"left" id="<%=F_FavID %>" data-userid="<%=M %>">
                                        <img  class="favico" alt="Favorite" src='images/fav_heart_true.png' width="13" height="13" border="0" style="float: right; " />
                                         </span>      
                                        <%  If not rsFav.EOF Then
                                            rsFav.MoveNext
                                            end if        
                                        %> 

                                    <% else  %>
                                        
                                        <span data-fav="0" float:"left" id="<%=rsWines("ID") %>" data-userid="<%=M %>">
                                        <img class="favico" alt="Favorite" src='images/fav_heart_vote.png' width="13" height="13" border="0" style="float: right; " />
                                        </span>    

                                    <% end if %>

                                                                              
                                    
                                    

                                    <b><%=rsWines("Name")%>
                                    <br />
                                    
	                                
                                    <% if (rsWines("Vintage")) > "1900" then %>
		                                (<%=rsWines("Vintage")%>)
	                                <% end if %>

                                    </b>
                                    <br />
	                                <br />

                                    <%=rsWines("Tasting_Notes")%>
                                    <br />
                                    <br />

	                                <% If FoodP > 1 then %>
		                                <br /><b>Food Pairing:</b>&nbsp;<%=rsWines("Food_Pairing")%>
                                    <% End If %>

		                            <br />
                                    <b>Type:</b>&nbsp;<%=rsWines("Type")%>
		                                
			                        <br />
                                    <b>Varietal:</b>&nbsp;<%=rsWines("Varietal")%>
		                                
		                            <% If W_Comp > 1 then %>
		                                <br /><b>Composition:</b>&nbsp;<%=rsWines("Composition")%>
                                    <% End If %>

		                            <% If W_Alc > 1 then %>
		                                <br /><b>Alcohol:</b>&nbsp;<% = Alc %>
                                    <% End If %>
                                        
		                            <% If W_Age > 1 then %>
		                                <br /><b>Aging:</b>&nbsp;<%=rsWines("Aging")%>
                                    <% End If %>                                                                                
		                            <br /><br />


		                            <table class="cell_bg" border="0" width="100%">
			                            <tr>
				                            <td width="25%" align="center">
                                            <b><span class="auto-style6">Public Bottle</span></b></td>
				                            <td width="25%" align="center">
				                            <span class="auto-style6"><b>Wine Club</b></span></td>
				                            <td width="25%" align="center">
				                            <span class="auto-style6"><b>Public Case </b></span></td>
				                            <td width="25%" align="center">
                                            <b><span class="auto-style6">Wine Club</span></b></td>
			                            </tr>
			                            <tr>
				                            <td width="25%" align="center"><span class="auto-style6"><%= FormatCurrency(rsWines("Price_Public"),2)%></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= FormatCurrency(rsWines("Price_WC"),2)%></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= FormatCurrency(rsWines("Price_Case_Pub"),2)%></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= FormatCurrency(rsWines("Price_Case_WC"),2)%></span></td>
			                            </tr>
		                            </table>
                                    <br />

                                    <% If W_Web > 1 then %>
		                                <center><a target="_blank" href="<%=rsWines("Website")%>" class=" button big" >Buy this wine</a></center>
                                        <hr />
                                    <% End If %>

                                    <% 
                                    rsWines.MoveNext     
                                    Loop
                                    End If

                                    'close the connection and Recordset objects freeing up resources
                                    rsWines.Close
                                    Set rsWines=nothing
                                    Connection.Close
                                    Set Connection=nothing
                                    %>




            
<!-- Database results for Wines associated with Vineyard-->

                                        <% 
                                        'declare the variables 
                                        Dim mnConnection1
                                        Dim mnConnectionString1
                                        Dim mnRecordset1
                                        Dim mnSQL1
                                        Dim mnWines1


                                        'declare the SQL statement that will query the database
                                        mnSQL1 = "SELECT * FROM qry_Member_Notes WHERE Member =" & M & " AND Wine =" & W

                                        'Response.write SQL1
                                        'define the connection string, specify database driver
                                        mnConnString1 = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                        'create an instance of the ADO connection and Recordset objects
                                        Set mnConnection1 = Server.CreateObject("ADODB.Connection")

                                        Set mnWines1 = Server.CreateObject("ADODB.RecordSet")

                                        'Open the connection to the database
                                        mnConnection1.Open mnConnString1


                                        'Open the Recordset object executing the SQL statement and return records 
                                        mnWines1.Open mnSQL1,mnConnection1

                                        'first of all determine whether there are any records 
                                        If mnWines1.EOF  Then 
                                        Response.Write("") 
                                        Else
                                        'if there are records then loop through the fields 
                                        Do While NOT mnWines1.Eof   

                                        TScore = len(mnWines1("Tasting_Score"))
                                        'response.write mnWines1("Tasting_Score") & " = TScore Value"
	                                    %>
                                            
				                <article class="published">
					                <header>
		                                <br/><br/>
                                       
		                                <b>Tasting Score:</b>

        	                                <% if mnWines1("Tasting_Score") = 5 then %> 
					                            <a href='edit_tasting.asp?W=<%=W%>&ID=<%=mnWines1("Winery_Number")%>'>
				                            <img src="images/5-star.png" alt="check yes" height="20" width="100"/></a>
				                            <% end if %>

				                            <% if mnWines1("Tasting_Score") = 4 then %> 
					                            <a href='edit_tasting.asp?W=<%=W%>&ID=<%=mnWines1("Winery_Number")%>'>
				                            <img src="images/4-star.png" alt="check yes" height="20" width="100"/></a>
				                            <% end if %>					

		    	                            <% if mnWines1("Tasting_Score") = 3 then %> 
					                            <a href='edit_tasting.asp?W=<%=W%>&ID=<%=mnWines1("Winery_Number")%>'>
				                            <img src="images/3-star.png" alt="check yes" height="20" width="100"/></a>
				                            <% end if %>
								
			                                <% if mnWines1("Tasting_Score") = 2 then %> 
					                            <a href='edit_tasting.asp?W=<%=W%>&ID=<%=mnWines1("Winery_Number")%>'>
				                            <img src="images/2-star.png" alt="check yes" height="20" width="100"/></a>
				                            <% end if %>
									
			                                <% if mnWines1("Tasting_Score") = 1 then %> 
					                            <a href='edit_tasting.asp?W=<%=W%>&ID=<%=mnWines1("Winery_Number")%>'>
				                            <img src="images/1-star.png" alt="check yes" height="20" width="100"/></a>
				                            <% end if %>
                                    
                                        <br />
                                        <br />
                                        <b>Tasting Result:</b>
		                                    <% if mnWines1("User_Like") = 1 then %>I Drank This <% end if %>
                                            <% if mnWines1("User_Like") = 2 then %>I Like This <% end if %>
                                            <% if mnWines1("User_Like") = 3 then %>I Want This <% end if %>
                                            <% if mnWines1("User_Like") = 4 then %>I Bought This <% end if %>
                                    <br />
                                    <br />

                                    <%=mnWines1("Comments")%>


                                </header>
										            
     				        </article>

                            <%
                            mnWines1.MoveNext     
                            Loop
                            End If
                            %>
                             
                            <% if TScore = "" then %>
                            
                    <form name="wine_note" target="_self" action="wine_details.asp" method="post" onclick="OnClickBtn(this)">                                
                                <br />
                                    <div id="tasting-score"> 
                                        <span data-star="1" class="button small star-btn"> 
                                            <img  class="star1" alt="Favorite" src='images/1-star.png' />
                                        </span> 
                                        <span data-star="2" class="button small star-btn"> 
                                            <img  class="star2" alt="Favorite" src='images/1-star.png' />
                                        </span> 
                                        <span data-star="3" class="button small star-btn"> 
                                            <img  class="star3" alt="Favorite" src='images/1-star.png' />
                                        </span> 
                                        <span data-star="4" class="button small star-btn"> 
                                            <img  class="star4" alt="Favorite" src='images/1-star.png' />
                                        </span> 
                                        <span data-star="5" class="button small star-btn"> 
                                            <img  class="star5" alt="Favorite" src='images/1-star.png' />
                                        </span> 

                                    </div>

                                <br />
                            <div id="user-likes">
                                <span data-like="1" class="button small like-btn">I Drank </span> 
                                <span data-like="2" class="button small like-btn"> I Liked </span> 
                                <span data-like="3" class="button small like-btn"> I Want </span> 
                                <span data-like="4" class="button small like-btn" > I Bought </span> 
                            </div>
                            <br />  
                            <div id="comments">
                                <input type="hidden" name="starsVal" value="" />
                                <input type="hidden" name="likesVal" value="" />                                
                                <p><textarea rows="5" name="Comments" cols="10" placeholder="Enter your notes..."></textarea></p>
                                <span class="intro">Make this comment public</span><input type="checkbox" id="chkPublic" name="public-private" value="0" />  <br />
                                <input class="button small" name="save" value="Save" />
                            </div>
                                </form>
                                
                               
                            <% end if  %>
     				</div>
		                                             
    
                        <%

                        'close the connection and Recordset objects freeing up resources
                        mnWines1.Close
                        Set mnWines1=nothing
                        mnConnection1.Close
                        Set mnConnection1=nothing

                        %>

                </header>

            

                <footer>
                     <section>						
        
        				<!-- Pagination -->
                        
							<ul class="actions pagination">
                                <% if V > 3 then %>
                                    <li><a href="wine_details.asp?W=2&V=<% =V %>" class=" button big first" ><<</a></li>
								    <li><a href="wine_details.asp?W=<% =W-1 %>&V=<% =V %>" class="button big previous">Previous Wine</a></li>
                                <% else %> 
                                    <li><a href="wine_details.asp?W=2&V=<% =V %>" class=" disabled button big last" ><<</a></li>
                                    <li><a href="wine_details.asp?W=<% =W-1 %>&V=<% =V %>" class=" disabled button big previous">Previous Wine</a></li>
                                <% end if %>

                                <% if V < 42 then %>
			    					<li><a href="wine_details.asp?W=<% =W+1 %>&V=<% =V %>" class="button big next">Next Wine</a></li>
                                    <li><a href="wine_details.asp?W=42&V=<% =V %>" class=" button big last" >>></a></li>
                                <% else %> 
                                    <li><a href="wine_details.asp?W=<% =W+1 %>&V=<% =V %>" class=" disabled button big next">Next Wine</a></li>
                                    <li><a href="wine_details.asp?W=42&V=<% =V %>" class=" disabled button big last" >>></a></li>
                                <% end if %>
							</ul>
			    </div>
                </section>
            </footer>
			
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
            Dim rsfavWine


                'declare the SQL statement that will query the database
                wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member ='" & Session("userid") & "' AND User_Like > 3 ORDER BY Tstamp DESC, Winery ASC Limit 3"

                'Response.write SQL1
                'define the connection string, specify database driver
                wConnStringx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                'create an instance of the ADO connection and Recordset objects
                Set wConnectionx = Server.CreateObject("ADODB.Connection")

                Set rsfavWine = Server.CreateObject("ADODB.RecordSet")

                'Open the connection to the database
                wConnectionx.Open wConnStringx


                'Open the Recordset object executing the SQL statement and return records 
                rsfavWine.Open wSQLx,wConnectionx

                'first of all determine whether there are any records 
                If rsfavWine.EOF  Then 
                Response.Write("You have not selected any wine as Favorite yet :(") 
                Else
                'if there are records then loop through the fields 
                Do While NOT rsfavWine.Eof   
                
                Tstamp = rsfavWine("Tstamp")
                TStamp = FormatDateTime(Tstamp,1)

	            %>

                                            
			    <li>
				    <article>
					    <header>
						    <h3><a href="vineyard_details.asp?V=<% =rsfavWine("Vineyard") %>"><% =rsfavWine("Winery") %></a></h3>
						    <time class="published" datetime="2015-10-15"><% =TStamp %></time>
					    </header>
					    <a href="vineyard_details.asp?V=<% =rsfavWine("Vineyard") %>" class="image"><img src="<% =rsfavWine("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
				    </article>
			    </li>

                <%
                rsfavWine.MoveNext     
                Loop
                End If

                'close the connection and Recordset objects freeing up resources
                rsfavWine.Close
                Set rsfavWine=nothing
                wConnectionx.Close
                Set wConnectionx=nothing

                %>
            </ul>
			</article>


	<ul class="actions">
		<li><a href="tasting_cellar.asp" alt="test" class="button big">View All My Wines</a></li>
	</ul>


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