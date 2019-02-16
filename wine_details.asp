<%
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")
    
    If Session("loggedin") <> true Then
        Response.Redirect("Login.asp?requester=wine_details.asp?V=" & Server.HtmlEncode(Request("V")) & "&W=" & Server.HtmlEncode(Request("W")))
    End If
	
	FirstWineID = 0
	LastWineID = 0
	PreviousWineID = 0
	NextWineID = 0
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
        <link rel="icon" href="images/icon_wine_glass_0.jpg" type="image/x-icon">

<style>
	/****** Rating Starts *****/
            @import url(http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

            fieldset, label { margin: 0; padding: 0 !important; }
            /* body{ margin: 20px; }*/
            /* h1 { font-size: 1.5em; margin: 10px; } */

            .rating { 
                border: none;
                float: left;
            }

            .rating > input { display: none;} 
            .rating > label:before { 
                margin: 5px;
                font-size: 1.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005";
            }

            .rating > .half:before { 
                content: "\f089";
                position: absolute;
            }

            .rating > label { 
                color: #ddd; 
                float: right; 
            }

            .rating > input:checked ~ label, 
            .rating:not(:checked) > label:hover,  
            .rating:not(:checked) > label:hover ~ label { color: #FFD700;   }

            .rating > input:checked + label:hover, 
            .rating > input:checked ~ label:hover,
            .rating > label:hover ~ input:checked ~ label, 
            .rating > input:checked ~ label:hover ~ label { color: #FFED85;  }     


#tasting-score
{
   height: 50px ;
   width: 50% ;
}
span.rating 
{
   display:block;
   height: 100% ;
   margin: 0 auto;
}
	
	
input[type="checkbox"] + label:before, input[type="radio"] + label:before
	{
		background: transparent !important; 
		border: 0px !important;
		position: relative !important;
		content: "\f005" !important;
		width: 0.8em !important;
	}
	
input[type="checkbox"]:checked + label:before, input[type="radio"]:checked + label:before
	{
		color: #ffd700 !important;
	}

input[type="checkbox"] + label, input[type="radio"] + label
	{
		padding-left: 0px !important; 
		padding-right: 0px !important;  
	}
	
	.fa-pencil 
	{
		cursor: pointer;
	}
	
	textarea {
    	resize: none;
	}
	






    .popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
}

/* The actual popup (appears on top) */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class when clicking on the popup container (hide and show the popup) */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;}
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}

</style>

<script>


    $(document).ready(function () {

function ClosePopup(){
	$("#myPopup").removeClass("show");
	$("#myPopup").hide();
}

$("#BoughtPopup").on('click', function(event){
  if (event.target == this) {
     PopupOpen();
  }
});


function PopupOpen() {
    $("#myPopup").addClass("show");
	$("#myPopup").show();
}

    
       if($("input[name='starsVal']").val() != ""){
            var scored = $("input[name='starsVal']").val();
            
            $("#tasting-score #scores #star"+scored).click(); 
            //$(".rating > input").prop("disabled", true );
        } 
        if($("input[name='likesVal']").val() != "") {
            var likeVal = $("input[name='likesVal']").val();
            var setVal = $("#like"+likeVal).text();
            
            $("#likeShowSpan").text(setVal);
        }
        
            $("#tasting-score #scores .stars").click(function () {
                                
                           if($("input[name='noteID']").val() == "" && $("input[name='starsVal']").val() == ""){
                                    var score = $(this).val();
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    $("input[name='starsVal']").val(score);
                                          
                                    $.post("comments_handler.asp",
                                    {
                                                score:score,
                                                member: member,
                                                wine: wine,
                                                action: "insertScore"},
                                     function(d){
                                        if(d>0)
                                        {
                                            $("input[name='noteID']").val(d);
                                            //alert('You already rated');
                                            //$(".rating > input").prop("checked", true );
                                            //$("#tasting-score #scores #star"+d).click();
                                        }else{
                                            
                                            alert('Thanks For Rating');
                                        }
                                    });  
                                    //$(this).attr("checked");
                                }else{

                                    var score = $(this).val();
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    var id = $("input[name='noteID']").val();
                                    $("input[name='starsVal']").val(score);
                                          
                                    $.post("comments_handler.asp",
                                    {
                                                id: id,
                                                score:score,
                                                member: member,
                                                wine: wine,
                                                action: "updateScore"
                                    });  

                                }
                                    
                                    //$("#user-likes").show();    
            });
        
        $(".like-btn").click(function () {

								ClosePopup();	
                               if($("input[name='noteID']").val() == "" && $("input[name='likesVal']").val() == ""){
                                    var liked = $(this).data("like");
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    var value = $("#like"+liked).text();
                                    $("input[name='likesVal']").val(liked);
									var BottleCount = 0;
                                    if(liked == 4)
									{
										BottleCount = $("#BottleCount").val();
										console.log("Inside if Bottle Count = " + BottleCount);
									}
									
                                    $.post("comments_handler.asp",
                                    {
                                                liked:liked,
                                                member: member,
                                                wine: wine,
												BottleCount : BottleCount,
                                                action: "insertLike"},
                                     function(d){
                                        if(d>0)
                                        {
                                            $("input[name='noteID']").val(d);
                                        }else{
                                            $("#likeShowSpan").text(value);
                                            $("#likeShowDiv").fadeIn(500);
                                            $("#user-likes").fadeOut(500);
                                        }
                                    });  
                                }else{

                                    var liked = $(this).data("like");
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    var id = $("input[name='noteID']").val();
                                    $("input[name='likesVal']").val(liked);
                                    var value = $("#like"+liked).text();  
									var BottleCount = 0;
									if(liked == 4)
									{
										BottleCount = $("#BottleCount").val();
										console.log("Inside if Bottle Count = " + BottleCount);
									}
									
                                    $.post("comments_handler.asp",
                                    {
                                                id: id,
                                                liked:liked,
                                                member: member,
                                                wine: wine,
												BottleCount : BottleCount,
                                                action: "updateLike"},
                                     function(d){
									 console.log(d);
                                        if(d>0)
                                        {
                                            $("#likeShowSpan").text(value);
                                            $("#likeShowDiv").fadeIn(500);
                                            $("#user-likes").fadeOut(500);

                                        }else{
                                                alert('Not Update for some reasons');
                                        }
                                    });  


                                }

        });

        $("#comments .save").click(function () {
            //$("#comments").show();  

                               if($("input[name='noteID']").val() == "" && $("textarea#message").val() != ""){
                                    var message = $("textarea#message").val();
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    var isPublish = $("#isPublish").is(":checked") ? 1 : 0;
                                    //$("input[name='message']").val(message);
                                          
                                    $.post("comments_handler.asp",
                                    {
                                                comment:message,
                                                member: member,
                                                wine: wine,
                                                isPublish: isPublish,
                                                action: "insertComment"},
                                     function(d){
                                        if(d>0)
                                        {
                                            $("input[name='noteID']").val(d);
                                        }else{
                                            $("#commentShowDiv #commentShowSpan").text(message);
                                            $("#commentShowDiv").fadeIn(500);
                                            $("#comments").fadeOut(500);
                                        }
                                    });  
                                }else{

                                    var message = $("textarea#message").val();
                                    var member = $("input[name='memberID']").val();
                                    var wine = $("input[name='wineID']").val();
                                    var id = $("input[name='noteID']").val();
                                    var isPublish = $("#isPublish").is(":checked") ? 1 : 0;
                                    //$("input[name='likesVal']").val(message);
                                          
                                    $.post("comments_handler.asp",
                                    {
                                                id: id,
                                                comment:message,
                                                member: member,
                                                wine: wine,
                                                isPublish: isPublish,
                                                action: "updateComment"},
                                     function(d){
                                        if(d>0)
                                        {
                                            $("#commentShowDiv #commentShowSpan").text(message);
                                            $("#commentShowDiv").fadeIn(500);
                                            $("#comments").fadeOut(500);
                                        }else{
                                            alert('No Updated for some reasons');
                                        }
                                    });  

                                }

        });

        if($("#likeShowSpan").text() == "") {
            $("#user-likes").fadeIn(500);
            $("#likeShowDiv").hide();
        }else{
            $("#user-likes").hide(500);
            $("#likeShowDiv").fadeIn(500);
        }
        $("#likeShowDiv i").click(function () {
            $("#user-likes").fadeIn(500);
            $("#likeShowDiv").fadeOut(500);            
        });


        if($("textarea#message").val() == "") {
            $("#comments").fadeIn(500);
            $("#commentShowDiv").fadeOut(500);
        }else{
            $("#comments").fadeOut(500);
            $("#commentShowDiv").fadeIn(500);
        }
        $("#commentShowDiv i").click(function () {
            $("#comments").fadeIn(500);
            $("#commentShowDiv").fadeOut(500);            
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
							<!-- #include file="search.html"-->

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
                            Dim Price_Public, Price_WC, Price_Case_Pub, Price_Pub_WC, Price_Sale_Pub, Price_Sale_WC


                            'declare the SQL statement that will query the database
                            SQL = "SELECT * " & _ 
								" , (SELECT MAX(ID) FROM Wines) LastWineID " & _
								" , (SELECT MIN(ID) FROM Wines) FirstWineID " & _
								" , (SELECT IFNULL(MAX(ID),0) FROM Wines WHERE ID < w.ID) PreviousWineID" & _
								" , (SELECT IFNULL(MIN(ID),0) FROM Wines WHERE ID > w.ID) NextWineID " & _
								" FROM Wines w WHERE w.ID=" & W
							
							'"SELECT * FROM Wines WHERE ID =" & W
                            SQL1 = "SELECT * FROM Favorites WHERE Member_ID='"&M&"' AND Wine_ID =" &W& " ORDER BY Vineyard_ID DESC"
                            'Response.write SQL
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
                                'response.write W_Web
                                'Price_Public = rsWines("Price_Public")
                                'response.write Price_Public

								
								'Pagination variables 
								FirstWineID = rsWines("FirstWineID")
								LastWineID = rsWines("LastWineID")
								PreviousWineID = rsWines("PreviousWineID")
								NextWineID = rsWines("NextWineID")
								
								
                                If ISNULL(rsWines("Price_Public")) Then
                                    Price_Public = "$"
                                Else 
                                    Price_Public = FormatCurrency(rsWines("Price_Public"),2)
                                End if 

                                If ISNULL(rsWines("Price_WC")) Then
                                    Price_WC = "$"
                                Else 
                                    Price_WC = formatcurrency(rsWines("Price_WC"),2)
                                End if 
                                
                                If ISNULL(rsWines("Price_Case_Pub")) Then
                                    Price_Case_Pub = "$"
                                Else 
                                    Price_Case_Pub = formatcurrency(rsWines("Price_Case_Pub"),2)
                                End if 

                                If ISNULL(rsWines("Price_Case_WC")) Then
                                    Price_Case_WC = "$"
                                Else 
                                    Price_Case_WC = formatcurrency(rsWines("Price_Case_WC"),2)
                                End if 

                                If ISNULL(rsWines("Price_Sale_Pub")) Then
                                    Price_Sale_Pub = "$"
                                Else 
                                    Price_Sale_Pub = formatcurrency(rsWines("Price_Sale_Pub"),2)
                                End if 

                                If ISNULL(rsWines("Price_Sale_WC")) Then
                                    Price_Sale_WC = "$"
                                Else 
                                    Price_Sale_WC = formatcurrency(rsWines("Price_Sale_WC"),2)
                                End if 
                                

                                'testing to see if I can use this for pagination
                                WineBOF = rsWines.MoveFirst
                                response.Write WineBOF
                                'WineEOF = rsWines.MoveLast

                                'WineNext = rsWines.MoveNext
                                'WinePrev = rsWines.MovePrevious

	                            %>

                        <article class="post">
                            <header>

                                <div class="title">

                                    <h3>
                                        <span class="published" style="text-align: right"><a href="vineyard_details.asp?V=<%=rsWines("Winery_Number")%>"><%=rsWines("Winery")%></a></span>
                                    </h3>

                                    <br />

	                                <% 'if image exists, use image location, else, use filler image  %>

                                    <% if len(rsWines("Image_Location")) > 7 then %>
		                                <a href="vineyard_details.asp?V=<%=rsWines("Winery_Number")%>"><img border="0" src="<%=rsWines("Image_Location")%>" alt="<%=rsWines("Name")%>" hspace="00" style="float: left; margin-right: 20px;" width="150"  /></a>
                                    <% else %>
		                                <img border="0" src="http://www.postcardsfromthenet.com/images/No_Image_Red.jpg" alt="no image" width="150"  style="float: left" />
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
				                            <td width="25%" align="center"><span class="auto-style6"><%= Price_Public %></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= Price_WC %></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= Price_Case_Pub %></span></td>
				                            <td width="25%" align="center"><span class="auto-style6"><%= Price_Case_WC %></span></td>
			                            </tr>
		                            </table>
                                    <br />

                                    <% If W_Web > 1 then %>
		                                <center><a target="_blank" href="<%=rsWines("Website")%>" class=" button big" ><i>Buy this wine</i></a></center>
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
                                        mnSQL1 = "SELECT * " & _ 
											" , (SELECT MIN(Wine) FROM qry_Member_Notes WHERE Member =w.Member) FirstWineID " & _ 
											" , (SELECT MAX(Wine) FROM qry_Member_Notes WHERE Member =w.Member) LastWineID " & _ 
											" , (SELECT IFNULL(MAX(Wine),0) FROM qry_Member_Notes WHERE Wine < w.Wine AND Member=w.Member) PreviousWineID " & _
											" , (SELECT IFNULL(MIN(Wine),0) FROM qry_Member_Notes WHERE Wine > w.Wine AND Member=w.Member) NextWineID " & _
											" FROM qry_Member_Notes w WHERE w.Member =" & M & " AND w.Wine =" & W

                                        'Response.write mnSQL1
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
                                        NoteID = mnWines1("ID")
                                        TScore = mnWines1("Tasting_Score")
                                        userLike = mnWines1("User_Like")
                                        Comment = mnWines1("Comments")
										
										'Pagination variables 
										'FirstWineID = mnWines1("FirstWineID")
										'LastWineID = mnWines1("LastWineID")
										'PreviousWineID = mnWines1("PreviousWineID")
										'NextWineID = mnWines1("NextWineID")
                                        
										'response.write mnWines1("Tasting_Score") & " = TScore Value"
	                                    %>
                                            



                            <%
                            mnWines1.MoveNext     
                            Loop
                            End If
                            %>
                         
                   
                        <article class="published">
					       <header>
                            
                             <div id="tasting-score" > 
                                <span id='scores' class="rating"><b>Tasting Notes: &nbsp;</b>
                                <br />
                                    <input class="stars" type="radio" id="star5" name="rating" value="5" />
                                    <label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                    <input class="stars" type="radio" id="star4" name="rating" value="4" />
                                    <label class = "full" for="star4" title="Very good - 4 stars"></label>
                                    <input class="stars" type="radio" id="star3" name="rating" value="3" />
                                    <label class = "full" for="star3" title="Tasty - 3 stars"></label>
                                    <input class="stars" type="radio" id="star2" name="rating" value="2" />
                                    <label class = "full" for="star2" title="Not for me - 2 stars"></label>
                                    <input class="stars" type="radio" id="star1" name="rating" value="1" />
                                    <label class = "full" for="star1" title="Kinda bad - 1 star"></label>
                                </span>
                            </div>
                                
                            <br />
                            
                            <div id="user-likes">
                                <span data-like="1" id="like1" class="button small like-btn">I Drank </span> 
                                <span data-like="2" id="like2" class="button small like-btn"> I Liked </span> 
                                <span data-like="3" id="like3" class="button small like-btn"> I Want </span> 
                                <span class="button small popup" id="BoughtPopup" >I Bought
                                        <span class="popuptext" id="myPopup">
                                            <input type="text" id="BottleCount" placeholder="How much ?" />
                                            <button data-like="4" data-field="#BottleCount" class="btn btn-default like-btn"  type="button">Save</button>
                                        </span>
                                </span> 
                               
                            </div>
                        
                            <div id="likeShowDiv">

                            <br />

                                <b>Drinkage:&nbsp;&nbsp;</b><i class="fa fa-pencil" style="font-size:12px"></i>
                                <br />
                                    <span id="likeShowSpan"><%=userLike %></span>&nbsp;&nbsp;&nbsp;
                            </div>
                            
                            <br />  
                            
                            <div id="comments">
                                <input type="hidden" name="memberID" value="<%=M %>" />
                                <input type="hidden" name="wineID" value="<%=W %>" />
                                <input type="hidden" name="vineyardID" value="<%=V %>" />
                                <input type="hidden" name="starsVal" value="<%=TScore %>" />
                                <input type="hidden" name="likesVal" value="<%=userLike %>" />
                                <input type="hidden" name="noteID" value="<%=NoteID %>" />           
                                                     
                                <p><textarea rows="3" id="message" name="Comments" cols="10" placeholder="Enter your notes..." ><%=Comment %></textarea></p>
                                <span class="intro">Make this comment public</span><input type="checkbox" id="isPublish" name="public-private" />  <br /><br />
                                <span class="button small save" >&nbsp;&nbsp;&nbsp;Save&nbsp;&nbsp;&nbsp;</span>
                            </div>
                            
                            <div id="commentShowDiv"><b>Comment: &nbsp;&nbsp;</b><i class="fa fa-pencil" style="font-size:12px"></i>
                            <br />
                                <span id="commentShowSpan"><%=Comment %></span>&nbsp;&nbsp;&nbsp; 
                            </div>
                        
                        </header>
										            
     				</article>
                               
     				</div>

                </header>

            <hr />

<!-- Pagination -->
        <footer>
            <section>						
                       
				    <ul class="actions pagination">
                        <% if Cint(PreviousWineID) > 0 then %>
                            <li><a href="wine_details.asp?V=<% =V %>&W=<% =FirstWineID %>" class=" button big first" ><<</a></li>
						    <li><a href="wine_details.asp?V=<% =V %>&W=<% =PreviousWineID %>" class="button big previous">Previous Wine</a></li>
                        <% else %> 
                            <li><a href="wine_details.asp?V=<% =V %>&W=2" class=" disabled button big last" ><<</a></li>
                            <li><a href="wine_details.asp?V=<% =V %>&W=<% =W %>" class=" disabled button big previous">Previous Wine</a></li>
                        <% end if %>

                        <% if Cint(NextWineID) > 0 then %>
			    		    <li><a href="wine_details.asp?V=<% =V %>&W=<% =NextWineID %>" class="button big next">Next Wine</a></li>
                            <li><a href="wine_details.asp?V=<% =V %>&W=<% =LastWineID %>" class=" button big last" >>></a></li>
                        <% else %> 
                            <li><a href="wine_details.asp?V=<% =V %>&W=<% =W %>" class=" disabled button big next">Next Wine</a></li>
                            <li><a href="wine_details.asp?V=40&W=865" class=" disabled button big last" >>></a></li>
                        <% end if %>
                              
				    </ul>
		    </div>
            </section>
        </footer>

        <%

        'close the connection and Recordset objects freeing up resources
        mnWines1.Close
        Set mnWines1=nothing
        mnConnection1.Close
        Set mnConnection1=nothing

        %>			

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
	<section>Some of my recent tastings...
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
                wSQLx = "SELECT * FROM qry_Tasting_Notes WHERE Member ='" & M & "' ORDER BY Tstamp DESC, Winery ASC Limit 3"

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
                Response.Write("You have not commented on any wines yet :(") 
                Else
                'if there are records then loop through the fields 
                Do While NOT rsfavWine.Eof   
                
                Tstamp = rsfavWine("Tstamp")
                TStamp = FormatDateTime(Tstamp,2)

	            %>

                                            
			    <li>
				    <article>
					    <header>
						    <h4><a class="time" href="wine_details.asp?V=<% =rsfavWine("Vineyard") %>&W=<% =rsfavWine("Wine") %>"><% =rsfavWine("Name") %></a></h4>
                            <a class="published" href="vineyard_details.asp?V=<% =rsfavWine("Vineyard") %>"><% =rsfavWine("Winery") %></a>
                            
                            <br />
                    
                            <a href='wine_details.asp?V=<% =rsfavWine("Vineyard") %>&W=<% =rsfavWine("Wine") %>'><span class="published" >
                                <img alt="<%=rsfavWine("Tasting_Score")%> star taste!" src="images/<%=rsfavWine("Tasting_Score")%>-star.png"/>
                             </span></a>
                             <br />
                             <time class="published" datetime="2015-10-15"><% =TStamp %></time>

					    </header>
					    <a href="wine_details.asp?V=<% =rsfavWine("Vineyard") %>&W=<% =rsfavWine("Wine") %>" class="image"><img src="<% =rsfavWine("Image_Location") %>" alt="" style="border: 1px dotted #C0C0C0" /></a>
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

<center>
	<ul class="actions">
		<li><a href="tasting_cellar.asp" alt="test" class="button big">     View All My Wines     </a></li>
	</ul>
</center>

<hr />
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
