' <%
    M = Session("userid")
    T = Session("locale")
    V = Server.HtmlEncode(Request("V"))
    W = Server.HtmlEncode(Request("W"))
    
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=user_profile.asp")
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
		<title>Save Your Cork</title>
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
				<h1><!-- #include file="callout.asp"--> </h1>
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

        <div class="post">
									
        <% 

        'declare the variables 
        Dim Connection, Connection1
        Dim ConnectionString
        Dim Recordset
        Dim SQL1,SQLu
        Dim rsFav, rsUser


        'declare the SQL statement that will query the database
         SQLu = "SELECT * FROM User_Accounts WHERE User_ID=" & M
         
         SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' ORDER BY Vineyard_ID DESC"
       'Response.write SQL1
        'define the connection string, specify database driver
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set Connection1 = Server.CreateObject("ADODB.Connection")


        Set rsUser = Server.CreateObject("ADODB.RecordSet")
        Set rsFav = Server.CreateObject("ADODB.RecordSet")

        'Open the connection to the database
        Connection.Open ConnString
        Connection1.Open ConnString


        'Open the Recordset object executing the SQL statement and return records 
        rsUser.Open SQLu,Connection
        rsFav.Open SQL1,Connection1


        'first of all determine whether there are any records 
        If rsUser.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsUser.Eof   
            'Do While NOT rsFav.Eof
        %>

	    <%
	    If not rsFav.EOF Then
            F_fav=rsFav("Member_ID")
	        'Response.write F_fav

            F_FavID = rsFav("Vineyard_ID")
            'Response.write F_abc
        end if



        'W_Fave = rsWinesList("Winery_Number")
        'Response.write W_Fave

	    %>


        <header>

            <div class="title2" style="margin-left: 0px">

            <table style="width:100%; border-bottom: dotted 1px rgba(150, 0, 50, 0.65);">
                <tr>
                    <td><B>Account ID</B></td><td><%=rsUser("User_ID") %></td>
                    

                </tr>
                <tr>
                    <td ><B>Information</B></td><td><%=rsUser("F_Name") %>&nbsp;<%=rsUser("L_Name") %>
                    <br />

                <% if rsUser("Address1") <> "" then %>
                    <%=rsUser("Address1") %>, &nbsp;<%=rsUser("Address2") %>
                    
                <% end if %>                           
                <br />
                <% if rsUser("City") <> "" then %>
                    <%=rsUser("City") %>, &nbsp;<%=rsUser("State") %>&nbsp;<%=rsUser("Zip") %>
                <% end if %>
                <br />
                
                <% if rsUser("Phone") <> "" then %>
                    <%=rsUser("Phone") %>&nbsp;
                <% end if %>

                <br />

                <% if rsUser("E_Mail") <> "" then %>
                    <%=rsUser("E_Mail") %>&nbsp;
                <% end if %>                        
                
                </td>
                </tr>
            </table>
                                                
            </div>
        </header>
        
                        
        <%
        rsUser.MoveNext     
        Loop
        End if
        %>

        <%
        'close the connection and Recordset objects freeing up resources
        rsUser.Close
        Set rsUser=nothing
        Connection.Close
        Set Connection=nothing
        Connection1.Close
        Set Connection1=nothing

        %>        

        <% 

        'declare the variables 
        Dim Connection2
        Dim ConnString

        Dim SQLTaste
        Dim rsTaste


        SQLTaste = "SELECT * FROM ( SELECT COUNT( * ) AS TotalWhite FROM qry_Member_Notes WHERE Type = 'White' and Member = " & M & " ) AS T1, " &_
        "(SELECT COUNT( * ) AS TotalRed FROM qry_Member_Notes WHERE Type = 'Red' and Member = " & M & " ) AS T2, " &_ 
        "(SELECT COUNT( * ) AS TotalSparkling FROM qry_Member_Notes WHERE Type = 'Sparkling' and Member = " & M & ") AS T3, " &_
        "(SELECT COUNT( * ) AS TotalDessert FROM qry_Member_Notes WHERE Type = 'Sweet' AND Member = " & M & " OR Type = 'Dessert' and Member = " & M & " ) AS T4, " &_ 
        "(SELECT COUNT( * ) AS TotalRose FROM qry_Member_Notes WHERE Type = 'Rosé' and Member = " & M & " ) AS T5, " &_ 
        "(SELECT COUNT( * ) AS TotalTaste FROM qry_Member_Notes WHERE Member = " & M & ") AS T6"
        'SQLCount="SELECT COUNT(Type) AS TotalWhite FROM qry_Member_Notes WHERE Type = 'White' "
        
        
        ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        Set Connection2 = Server.CreateObject("ADODB.Connection")
        
        Set rsTaste = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        Connection2.Open ConnString
        
        'Open the Recordset object executing the SQL statement and return records 
        rsTaste.Open SQLTaste,Connection2

        'first of all determine whether there are any records 
        If rsTaste.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsTaste.Eof   
            'Do While NOT rsFav.Eof

        TTaste = cInt(rsTaste("TotalTaste"))

        TSpark = cInt(rsTaste("TotalSparkling"))
        TWhite = cInt(rsTaste("TotalRose")) + cInt(rsTaste("TotalWhite")) 
        TRed = cInt(rsTaste("TotalRed"))
        TDessert = cInt(rsTaste("TotalDessert"))

        If TSpark <> 0 then              
            Pct_Spark = cInt((TSpark/TTaste)*100)
        else
            Pct_Spark = 0                 
        end if
        
        If TWhite <> 0 then
            Pct_White = cInt((TWhite/TTaste)*100)
        Else
            Pct_White = 0
        End if

        If TRed <> 0 then
            Pct_Red = cInt((TRed/TTaste)*100)
        Else
            Pct_Red = 0
        End if

        If TDessert <> 0 then
            Pct_Dessert = cInt((TDessert/TTaste)*100)
        Else
            Pct_Dessert = 0
        end if

        response.Write TSpark
        response.Write TWhite
        response.Write TRed
        response.Write TTaste
        response.Write TDessert

        %>

   <H3>your tasting results <a href="tasting_history.asp" class="fa fa-file-text-o" style="font-size:16px"></a></H3>

        <table width="100%">
            <tr >
                <td width="20%"><a href="" class="author"><b>Tastings</td>
                <td width="20%"><a href="" class="author"><b>Sparkling</td>
                <td width="20%"><a href="" class="author"><b>White</td>
                <td width="20%"><a href="" class="author"><b>Red</td>
                <td width="20%"><a href="" class="author"><b>Dessert</td>
            </tr>
            <tr>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =TTaste %></a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =rsTaste("TotalSparkling") %></a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =rsTaste("TotalWhite") %></a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =rsTaste("TotalRed") %></a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =rsTaste("TotalDessert") %></a></td>
            </tr>
             <tr>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"></a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =Pct_Spark %>%</a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =Pct_White %>%</a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =Pct_Red %>%</a></td>
                <td width="20%"><a href="tasting_history.asp" class="author" style="text-align:center"><% =Pct_Dessert %>%</a></td>
            </tr>                                          
        </table>      
          

        <%
        rsTaste.MoveNext     
        Loop   
        end if 

    'close the connection and Recordset objects freeing up resources
        rsTaste.Close
        Set rsTaste=nothing
        Connection2.Close
        Set Connection2=nothing

        %>                  

        <table  style="border-top-style: dotted; border-width: 1px; border-color: #800000; width: 100%;"><tr><td></td></tr></table>  
<!--'This section report Favorite Vineyards -->
<h3>Your Favorite Vineyards</h3>

        <% 

        'declare the variables 
        Dim ConnectionV
        Dim ConnectionStringV
        Dim ConnStringV
        Dim SQLv
        Dim rsVineyards


        'declare the SQL statement that will query the database
        SQLv = "SELECT * FROM qry_Fav_Vineyards WHERE Member_ID='"&M&"' ORDER BY Winery_Name DESC"
       
        'Response.write SQLv
        'define the connection string, specify database driver
        ConnStringV = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set ConnectionV = Server.CreateObject("ADODB.Connection")
 
        Set rsVineyards = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        ConnectionV.Open ConnStringV
        

        'Open the Recordset object executing the SQL statement and return records 
        rsVineyards.Open SQLv,ConnectionV


        'first of all determine whether there are any records 
        If rsVineyards.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsVineyards.Eof   
            'Do While NOT rsFav.Eof
        %>

           <div class="title" style="margin-left: 30px; ">
                <a href="vineyard_details.asp?V=<%=rsVineyards("ID") %>"><%=rsVineyards("Winery_Name") %></a>
            </div>
                        
        <%
        rsVineyards.MoveNext     
        Loop
        End if
        %>

        <%
        'close the connection and Recordset objects freeing up resources
        rsVineyards.Close
        Set rsVineyards=nothing
        ConnectionV.Close
        Set ConnectionV=nothing

        %>  
						

<!--'This section report Favorite Wines -->
<br  />
<table  style="border-top-style: dotted; border-width: 1px; border-color: #800000; width: 100%;"><tr><td></td></tr></table>

<h3>Your Favorite Wines</h3>
        <% 

        'declare the variables 
        Dim ConnectionW
        Dim ConnectionStringW
        Dim ConnStringW
        Dim SQLW
        Dim rsFavWines


        'declare the SQL statement that will query the database
        SQLW = "SELECT * FROM qry_Fav_Wines WHERE Member_ID='"&M&"' ORDER BY Type DESC, Winery ASC, Vintage ASC"
       
        'Response.write SQLv
        'define the connection string, specify database driver
        ConnStringW = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

        'create an instance of the ADO connection and Recordset objects
        Set ConnectionW = Server.CreateObject("ADODB.Connection")
 
        Set rsFavWines = Server.CreateObject("ADODB.RecordSet")
        
        'Open the connection to the database
        ConnectionW.Open ConnStringW
        

        'Open the Recordset object executing the SQL statement and return records 
        rsFavWines.Open SQLW,ConnectionW


        'first of all determine whether there are any records 
        If rsFavWines.EOF  Then 
        Response.Write("No records returned.") 
        Else
        'if there are records then loop through the fields 
        Do While NOT rsFavWines.Eof   
        
        Vint = rsFavWines("Vintage")

       
        %>


        <%
            DIM GroupName,tmpGroupName
            GroupName = rsFavWines("Type")
            If GroupName <> tmpGroupName then
            tmpGroupName=GroupName
        %>
            <br />
            <b><% =tmpGroupName %>&nbsp;</b>
            <br />
        <%end if%>


           <div class="title" style="margin-left: 30px">
            <% IF IsNULL(Vint) then %>
                <a href="wine_details.asp?V=<%=rsFavWines("Winery_Number") %>&W=<%=rsFavWines("Wine_ID") %>"><%=rsFavWines("Winery") %>&nbsp;<%=rsFavWines("Name") %></a>
            <% else %>
                <a href="wine_details.asp?V=<%=rsFavWines("Winery_Number") %>&W=<%=rsFavWines("Wine_ID") %>"><%=rsFavWines("Winery") %>&nbsp; <%=rsFavWines("Vintage") %>&nbsp; <%=rsFavWines("Name") %></a>
            <% End If %>
            </div>
                        
        <%
        rsFavWines.MoveNext     
        Loop
        End if
        %>

        <%
        'close the connection and Recordset objects freeing up resources
        rsFavWines.Close
        Set rsFavWines=nothing
        ConnectionW.Close
        Set ConnectionW=nothing

        %>  
        <br />
        <br />
        
        </div>
    </div>


<!-- Sidebar -->
	<section id="sidebar">

	<!-- Intro -->
		
        <!-- #include file="intro.asp" -->
        
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
			<li><a href="vineyard_list.asp" class="button big">View Temecula's wineries</a></li>
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
					<p class="copyright">&copy; Save The Cork. Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
				</section>

		</section>

</div>
	</body>
</html>