<%
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")

    If Session("loggedin") <> True Then
        Response.Redirect("login.asp?requester=vineyard_details.asp?V=" & Server.HtmlEncode(Request("V")))
    End If
	
	FirstWineryID = 0
	LastWineryID = 0
	PreviousWineryID = 0
	NextWineryID = 0
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

    
    
            $("#CalendarShowDiv i").click(function () {
                $("#calendar").fadeIn(500);
                $("#CalendarShowDiv").fadeOut(500);
            });


        </script>

 
    <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">
      
  <script>
      $(function () {
          $("#datepicker").datepicker({
              dateFormat: "yy-mm-dd"
          });

          $(document).ready(function () {
              $("#datepicker").change(function () {

                  //var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );

                  // Setter
                  var visitDate = $(this).val();
                  var vWName = $(this).parent("span").data("vWName");
                  var vUser = $(this).parent("span").data("vuser");
                  var vWID = $(this).parent("span").data("vwid");
                  var vWName = $(this).parent("span").data("vwname");
                  var vPhone = $(this).parent("span").data("vphone");
                  var vLoc = $(this).parent("span").data("vloc");
                  var vRest = $(this).parent("span").data("vrest");
                  var vTasting = $(this).parent("span").data("vtasting");
                  var vImg = $(this).parent("span").data("vimg");
                  var vCheck = $("#vdateresponse").data("vcheck");
                  var pastID = $("#vpastid").data("pastid");
                  var futureID = $("#vfutureid").data("futureid");
                  var pastDate = $("#vpastid").data("pastdate");
                  var futureDate = $("#vfutureid").data("futuredate");

                  //alert(pastDate+" "+futureDate+ "  " + visitDate);
                  //$("#vDateSuccess").text(pastDate+" "+futureDate+" "+visitDate);
                  if (visitDate == pastDate || visitDate == futureDate) {
                      alert("You have already selected date: " + visitDate);

                  } else {

                      //alert(vCheck+" " +futureID+" "+pastID);
                      //if($(this).
                      if (vCheck == 0 || vCheck == null || futureID == null || futureID == 0) {

								  $.post("comments_handler.asp",
								{
									vUser: vUser,
									vWID: vWID,
									vWName: vWName,
									vPhone: vPhone,
									vLoc: vLoc,
									vRest: vRest,
									vTasting: vTasting,
									vImg: vImg,
									visitDate: visitDate,
									action: "insertVDate"
								},

						function (d) {
							if (d > 0) {
								alert("You Scheduled " +vWName+ " for "+ visitDate);
								$("#vdateresponse").fadeIn(500);
								$("#vdateresponse").attr("data-vcheck", d);
								$("#vdateresponse").text("Success! You selected: " + visitDate);
								//$("#vDateSuccess").text("You Last Scheduled This Date: " + visitDate);


							} else {

								$("input[name='vstdate']").val(d);
								$("#vdateresponse").text("Already Selected: " + d);
								$("#vdateresponse").fadeIn(500);

							}

						});
                     }
                      else if (vCheck > 0) {   //Update date
                          var TourID = $("#vdateresponse").data("vcheck");
                          $.post("comments_handler.asp",
                            {
                                futureID: futureID,
                                TourID: TourID,
                                vUser: vUser,
                                vWID: vWID,
                                visitDate: visitDate,
                                action: "updateVDate"
                            },


                        function (d) {
                            if (d = "updated") {
                                $("#vDateSuccess").text("Success! Date Updated: " + visitDate);
								$("#vdateresponse").attr("data-vcheck",null); //Make Last selected visitID NULL for allowing new entry
                                $("#vdateresponse").fadeOut(500);
                                $("#vDateSuccess").fadeIn(500);


                            } else {
                                //$("input[name='vstdate']").val(d);
                                $("#vDateSuccess").text("Cannot Update: " + d);
                                $("#vDateSuccess").fadeIn(500);

                            }

                        });

                      }
                  }

              });

          });
		  
		  
		  //Update Visit data ID in Picker
		  $(".fa-pencil").click(function() {
		  
			var visitID = $(this).prevAll("span").first().data("futureid"); 
			var visitDate = $(this).prevAll("span").first().data("futuredate");
			
			//If not future data clicked then check if it was past date to edit
			if (visitID === undefined || visitID === null)
			{
				visitID = $(this).prevAll("span").first().data("pastid"); 
				visitDate = $(this).prevAll("span").first().data("pastdate"); 
			}
			
			  //console.log(visitID);
			  //console.log(visitDate);
			$("input[name='vstdate']").val(visitDate);
			$("#vdateresponse").attr("data-vcheck",visitID);
			
		  });
		  
		  
		  //Delete visit date 
		  $(".fa-trash").click(function() {
			var trash = $(this);
			var TourID = $(this).prevAll("span").first().data("futureid"); 
			
			
			//If not future data clicked then check if it was past date to edit
			if (TourID === undefined || TourID === null)
			{
				TourID = $(this).prevAll("span").first().data("pastid"); 
			}
			  $.post("comments_handler.asp",
				{
					TourID: TourID,
					action: "deleteVDate"
				},
			function (d) {
				if (d = "deleted") {
					$("#vDateSuccess").text("Success! Date Deleted");
					$("#vdateresponse").text("");
					$("#vdateresponse").attr("data-vcheck",null); //Make Last selected visitID NULL for allowing new entry
					$("#vdateresponse").fadeOut(500);
					$("#vDateSuccess").fadeIn(500);
					
					trash.prevAll("span").first().remove();
					  trash.next().remove();
					  trash.remove(); 
					  
				} else {
					//$("input[name='vstdate']").val(d);
					$("#vDateSuccess").text("Cannot Update: " + d);
					$("#vDateSuccess").fadeIn(500);

				}
			
			  });
		  });
	  
	  });

    </script>	

    <style>
        #vdateresponse {
            display:none;
        }
	
	    .fa {
		    cursor: pointer;
	    }
	
	    .ui-widget {
		    font-size: 0.94em !important;
	    }

    </style>

</head>
<body>

		<!-- Wrapper -->
			<div id="wrapper">

                
			<header id="header">
				<h1>
                    <!-- #include file="callout.asp"--> 
				</h1>
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

<!-- Database results for selected Vineyard and associated Favorite icon status -->
			    <%		
                'declare the variables 
                Dim Connection
                Dim ConnectionString
                Dim Recordset
                Dim SQL, SQL1
                Dim rsVineyard, rsFav


                'declare the SQL statement that will query the database
                
				SQL = "SELECT * " & _ 
						" , (SELECT MAX(ID) FROM Vineyards) LastWineryID " & _
						" , (SELECT MIN(ID) FROM Vineyards) FirstWineryID " & _
						" , (SELECT IFNULL(MAX(ID),0) FROM Vineyards WHERE ID < v.ID) PreviousWineryID" & _
						" , (SELECT IFNULL(MIN(ID),0) FROM Vineyards WHERE ID > v.ID) NextWineryID " & _
						" FROM Vineyards v WHERE v.ID=" & V
						
				'SQL = "SELECT * FROM Vineyards WHERE ID =" & V
                SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Vineyard_ID =" &V& " ORDER BY Vineyard_ID DESC"
                visitSQL = "SELECT * FROM Vineyard_Tour WHERE Winery_ID="& V &" AND Member_ID='"&M&"' ORDER BY Visit_Date ASC" 
                    'Response.Write SQL1
                'define the connection string, specify database driver
                ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                'create an instance of the ADO connection and Recordset objects
                Set Connection = Server.CreateObject("ADODB.Connection")
                Set Connection1 = Server.CreateObject("ADODB.Connection")
                Set Connection2 = Server.CreateObject("ADODB.Connection")

                Set rsVineyard = Server.CreateObject("ADODB.RecordSet")
                Set rsFav = Server.CreateObject("ADODB.RecordSet")
                Set rsVisit = Server.CreateObject("ADODB.RecordSet")

                'Open the connection to the database
                Connection.Open ConnString
                Connection1.Open ConnString
                Connection2.Open ConnString

                'Open the Recordset object executing the SQL statement and return records 
                rsVineyard.Open SQL,Connection
                rsFav.Open SQL1,Connection1
                rsVisit.Open visitSQL,Connection2

                'first of all determine whether there are any records 
                If rsVineyard.EOF  Then 
                Response.Write("No records returned.") 
                Else
                'if there are records then loop through the fields 
                Do While NOT rsVineyard.Eof   
                    'Do While NOT rsFav.Eof


	            If not rsFav.EOF Then
                    F_fav=rsFav("Member_ID")
	               ' Response.Write "MID=" & F_fav & " / "

                    F_FavID = rsFav("Vineyard_ID")
                    'Response.Write "FavVineyard=" & F_FavID & " /"
                end if

	            T_Rest=len(rsVineyard("Restaurant"))
	            'Response.Write T_Rest
	
	            T_Hours=len(rsVineyard("Hours"))
	            'Response.Write T_Hours
	
	            T_Taste=len(rsVineyard("Tastings"))
	            'Response.Write T_Taste

                W_Fave = rsVineyard("ID")
                'Response.Write "Vineyard ID=" & W_Fave & " /"


                GAdd = replace(rsVineyard("location")," ","+")
                GMapName = replace(rsVineyard("winery_name")," ","+")
                                                
                GAdd2 = GMapName + "+Temecula" '& "+" & GAdd 

                Notes = Replace(rsVineyard("Winery_Notes"),vbCrLf,"<br />")

                Tour= "vineyard_details.asp?V=" & W_Fave

                If rsVineyard("Location")="" then
                    Loca=Temecula
                else
                    Loca =Left(rsVineyard("Location"),(InStrRev(rsVineyard("Location"),",") -1))
                end if
                
				'Pagination variables 
				FirstWineryID = rsVineyard("FirstWineryID")
				LastWineryID = rsVineyard("LastWineryID")
				PreviousWineryID = rsVineyard("PreviousWineryID")
				NextWineryID = rsVineyard("NextWineryID")

				
                If IsNull(rsVineyard("Wine_Shop_URL")) or rsVineyard("Wine_Shop_URL") = "0" then
                    Online = False
                Else
                    Online = True
                End If


                %>                
                
            <article class="post">
                <header>
                    <div class="title">
                        <img width="320" alt="<%=rsVineyard("Winery_Name")%>" src='<%=rsVineyard("Winery_Image")%>' style="border: 1px solid #C0C0C0" />
                        <br />

                        <%  Dim dbVisitID
                            dbVisitID = 0
                            Dim dbVisitDate
                            If not rsVisit.EOF Then                            
                                 dbVisitID =    rsVisit("ID") 
                                 dbVisitDate = rsVisit("Visit_Date")
                                 dbVisit = True
                             End If  %>

                        <span id="calendarShowDiv" data-vUser="<%=M %>" data-vWID="<%=rsVineyard("ID")%>" data-vWName="<%=rsVineyard("Winery_Name")%>" data-vPhone="<%=rsVineyard("Winery_Phone")%>" data-vLoc="<%=rsVineyard("Location")%>" data-vRest="<%=rsVineyard("Restaurant")%>" data-vTasting="<%=rsVineyard("Tastings")%>" data-vImg="<%=rsVineyard("Winery_Image")%>">
                            <br />
                            <input type="text" name="vstdate" class="author" placeholder="Select a Visit Date (yyyy-mm-dd)" id="datepicker">
                            <br />
                        </span>
                        
                        <% If dbVisit = True then %>
                            <span id="vDateSuccess" > You Last Scheduled This Date: <%=dbVisitDate%></span>
                            <br />
                        <% End If %>
                        
                        <span id="vdateresponse" data-vCheck="<%=dbVisitID %>"></span>
                        
                        <br />
                        <br />

                        <%
                            If rsVisit.EOF then
                                Response.Write "<span class='author' >No Winery Visits Scheduled </span><br />"
                        
                            Else
                                Dim wVisit 
                                                               
                                wVisit = True
                                
                                Do Until rsVisit.EOF
                       
                                    If rsVisit("Visit_Date") >= Date() then
                                        If wVisit = True then
                                            Response.Write "<br /><span class='author'>Future Visits: </span> <br />" 
                                            wVisit = False
                                        End If
                                        Response.Write "<span class='author' id='vfutureid' data-futureDate="&YEAR(rsVisit("Visit_Date"))&"-"&Right("0" & DatePart("m",rsVisit("Visit_Date")), 2)&"-"&Right("0" & DatePart("d",rsVisit("Visit_Date")), 2)&" data-FutureID="&rsVisit("ID")&">&nbsp;&nbsp;&nbsp;" & formatdatetime(rsVisit("Visit_Date"),1) & "</span><i class='fa fa-trash' style='font-size:10px; float: right'></i><i class='fa fa-pencil' style='font-size:10px; float: right'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i><br />"
                                    End If
    
                                    rsVisit.MoveNext
                                Loop  

                                rsVisit.MoveFirst  'move back to top of the list to restart the looping for past dates
                                
                                wVisit = True
                                
                                Do Until rsVisit.EOF
                                    
                                    If rsVisit("Visit_Date") < Date() then
                                        If wVisit = True then
                                            Response.Write "<br /><span class='author' >Past Visits: </span> <br />" 
                                            wVisit = False
                                        End If
                                        Response.Write "<span class='author' id='vpastid' data-pastDate="&YEAR(rsVisit("Visit_Date"))&"-"&Right("0" & DatePart("m",rsVisit("Visit_Date")), 2)&"-"&Right("0" & DatePart("d",rsVisit("Visit_Date")), 2)&" data-pastID="&rsVisit("ID")&"> &nbsp;&nbsp;&nbsp;" & formatdatetime(rsVisit("Visit_Date"),1) & "</span><i class='fa fa-trash' style='font-size:10px; float: right'></i><i class='fa fa-pencil' style='font-size:10px; float: right'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i><br />"
                                    End If
    
                                rsVisit.MoveNext
                                Loop  
                            
                            End If

                        %>

                        
                    </div>
                    <div class="title">

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

                        <a target="_blank" href="https://www.google.com/maps/search/<% =GAdd2 %>"><span class="published"><%=rsVineyard("Location")%></span></a>
                                
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

                        <br />

                        <% If Online = False then %>
                            <span class="published"><b>Purchase:</b>&nbsp;&nbsp;Onsite Only</span>
                        <% Else %>
                            <span class="published"><b>Purchase:</b>&nbsp;&nbsp;<a href="<% = rsVineyard("Wine_Shop_URL") %>" target="_blank" class=" button small" >On Site and Online</a></span>
                        <% End if %>                                              
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

                            <h3>Wines available at this Vineyard</h3>

				        <!-- Mini Post -->
            
<!-- Database results for wines associated with Vineyard-->

                            <% 
                            'declare the variables 
                            Dim wvConnectionvx,mConnectionn
                            Dim wvConnectionStringvx
                            Dim wvRecordsetvx
                            Dim wvSQLvx,mSQLn
                            Dim rsvWinesv
                            Dim rsFavWine
                            Dim MNComments


                                'declare the SQL statement that will query the database
                                wvSQLvx = "SELECT * FROM Wines WHERE Winery_Number =" & V & " ORDER BY Type DESC, Name ASC, Vintage ASC"
                                wSQLf = "SELECT * FROM Favorites WHERE Member_ID='" & M & "'"
                                

                                'Response.Write mSQLn
                                'define the connection string, specify database driver
                                wvConnStringvx = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                'create an instance of the ADO connection and Recordset objects
                                Set wvConnectionvx = Server.CreateObject("ADODB.Connection")
                                Set wConnectionf = Server.CreateObject("ADODB.Connection")
                                

                                Set rsvWinesv = Server.CreateObject("ADODB.RecordSet")
                                Set rsFavWine = Server.CreateObject("ADODB.RecordSet")
                                

                                'Open the connection to the database
                                wvConnectionvx.Open wvConnStringvx
                                wConnectionf.Open wvConnStringvx
                                

                                'Open the Recordset object executing the SQL statement and return records 
                                rsvWinesv.Open wvSQLvx,wvConnectionvx
                                rsFavWine.Open wSQLf,wConnectionf
                                

                                'first of all determine whether there are any records 
                                If rsvWinesv.EOF  Then 
                                    Response.Write("This winery has not listed any wines yet") 
                                Else
                                'if there are records then loop through the fields 
                                Do While NOT rsvWinesv.Eof   
                                %>

                                <%

	                            If not rsFavWine.EOF Then
                                    Noter=rsFavWine("Member_ID")
	                                 'Response.Write "Member=" & Noter & " / "

                                    Wine = rsFavWine("Wine_ID")
                                     'Response.Write "Wine=" & W_Notes & " /"
                                end if

                                WineID = rsvWinesv("ID")
                                'Response.Write "Wine_ID=" & WineID
                                
                                
                                ' try this mini-query based on the M and V  and W of the main query

                                mSQLn = "SELECT * FROM Members_Notes WHERE Member='" & M & "' AND Wine='" &WineID & "'"
                                Set mConnectionN = Server.CreateObject("ADODB.Connection")
                                Set rsMemNotes = Server.CreateObject("ADODB.RecordSet")
                                mConnectionN.Open wvConnStringvx
                                rsMemNotes.Open mSQLn,mConnectionN


                                If rsMemNotes.EOF then
                                    WTaste= False
                                Else    
                                    WTaste=True

                                    WineT = rsMemNotes("Wine")
                                    'Response.Write "Wine=" & WineT
                                End If

                                rsMemNotes.Close
                                Set rsMemNotes=nothing


	                            %>
								<article class="published">
										<header2>
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
                                            

                                            <%  If WTaste = True Then  %>
                                                
                                                <img alt="I drank this" src="images/icon_wine_glass_3.png" style="vertical-align: middle; margin-right: 5px;" height="13" width="13" /><a class="" href='wine_details.asp?V=<% =rsvWinesv("Winery_Number") %>&W=<% =rsvWinesv("ID") %>'><% =rsvWinesv("Vintage") %>&nbsp;<% =rsvWinesv("Name") %></a>
                                                
                                            <% else %>
                                                
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="" href='wine_details.asp?V=<% =rsvWinesv("Winery_Number") %>&W=<% =rsvWinesv("ID") %>'><% =rsvWinesv("Vintage") %>&nbsp;<% =rsvWinesv("Name") %></a>
                                                
                                            <% end if %> 

										</header2>
											            
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
								<% if Cint(PreviousWineryID) > 0 then %>
									<li><a href="vineyard_details.asp?V=<% =FirstWineryID %>" class=" button big first" ><<</a></li>
									<li><a href="vineyard_details.asp?V=<% =PreviousWineryID %>" class="button big previous">Previous Winery</a></li>
								<% else %> 
									<li><a href="vineyard_details.asp?V=2" class=" disabled button big last" ><<</a></li>
									<li><a href="vineyard_details.asp?V=<% =W %>" class=" disabled button big previous">Previous Winery</a></li>
								<% end if %>

								<% if Cint(NextWineryID) > 0 then %>
									<li><a href="vineyard_details.asp?V=<% =NextWineryID %>" class="button big next">Next Winery</a></li>
									<li><a href="vineyard_details.asp?V=<% =LastWineryID %>" class=" button big last" >>></a></li>
								<% else %> 
									<li><a href="vineyard_details.asp?V=<% =W %>" class=" disabled button big next">Next Winery</a></li>
									<li><a href="vineyard_details.asp?V=40&W=865" class=" disabled button big last" >>></a></li>
								<% end if %>
							
							
							</ul>

					</div>

<!-- Sidebar -->
	<section id="sidebar">

		<!-- Intro -->
    
            <!-- #include file="intro.asp" -->


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

                            'Response.Write SQL1
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
                            'Response.Write(FormatDateTime(Tstamp,1))
 
	                        %>
    

			                <li>
				                <article>
					                <header>
						                <h4><a class="time" href="wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>"><% =rsWines("Name") %></a></h4>
                                        <a class="published" href="vineyard_details.asp?V=<% =rsWines("Vineyard") %>"><% =rsWines("Winery") %></a>
                                                    
                                        <br />
                                        <a href='wine_details.asp?V=<% =rsWines("Vineyard") %>&W=<% =rsWines("Wine") %>'><span class="published" >
                                            <img alt="<%=rsWines("Tasting_Score")%> star taste!" src="images/<%=rsWines("Tasting_Score")%>-star.png"/>
                                        </span></a>
                                        <br />
                                        
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