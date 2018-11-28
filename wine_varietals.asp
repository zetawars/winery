<%
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    M=Session("userid")
    
    If Session("loggedin") <> true Then
        Response.Redirect("Login.asp?requester=wine_varietals.asp?V=" & Server.HtmlEncode(Request("V")) & "&W=" & Server.HtmlEncode(Request("W")))
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

            fieldset, label { margin: 0; padding: 0; }
            /* body{ margin: 20px; }*/
            /* h1 { font-size: 1.5em; margin: 10px; } */

            .rating { 
                border: none;
                float: left;
            }

            .rating > input { display: none; } 
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
            .rating:not(:checked) > label:hover ~ label { color: #FFD700;  }

            .rating > input:checked + label:hover, 
            .rating > input:checked ~ label:hover,
            .rating > label:hover ~ input:checked ~ label, 
            .rating > input:checked ~ label:hover ~ label { color: #FFED85;  }     


#tasting-score
{
   height: 50px;
   width: 50%;
}
span.rating 
{
   display:block;
   height: 100%;
   margin: 0 auto;
}
</style>

<script>
    $(document).ready(function () {


        if ($("input[name='starsVal']").val() != "") {
            var scored = $("input[name='starsVal']").val();

            $("#tasting-score #scores #star" + scored).click();
            //$(".rating > input").prop("disabled", true );
        }
        if ($("input[name='likesVal']").val() != "") {
            var likeVal = $("input[name='likesVal']").val();
            var setVal = $("#like" + likeVal).text();

            $("#likeShowSpan").text(setVal);
        }

        $("#tasting-score #scores .stars").click(function () {

            if ($("input[name='noteID']").val() == "" && $("input[name='starsVal']").val() == "") {
                var score = $(this).val();
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                $("input[name='starsVal']").val(score);

                $.post("comments_handler.asp",
                                    {
                                        score: score,
                                        member: member,
                                        wine: wine,
                                        action: "insertScore"
                                    },
                                     function (d) {
                                         if (d > 0) {
                                             $("input[name='noteID']").val(d);
                                             //alert('You already rated');
                                             //$(".rating > input").prop("checked", true );
                                             //$("#tasting-score #scores #star"+d).click();
                                         } else {

                                             alert('Thanks For Rating');
                                         }
                                     });
                //$(this).attr("checked");
            } else {

                var score = $(this).val();
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                var id = $("input[name='noteID']").val();
                $("input[name='starsVal']").val(score);

                $.post("comments_handler.asp",
                                    {
                                        id: id,
                                        score: score,
                                        member: member,
                                        wine: wine,
                                        action: "updateScore"
                                    });

            }

            //$("#user-likes").show();    
        });

        $(".like-btn").click(function () {

            if ($("input[name='noteID']").val() == "" && $("input[name='likesVal']").val() == "") {
                var liked = $(this).data("like");
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                var value = $("#like" + liked).text();
                $("input[name='likesVal']").val(liked);

                $.post("comments_handler.asp",
                                    {
                                        liked: liked,
                                        member: member,
                                        wine: wine,
                                        action: "insertLike"
                                    },
                                     function (d) {
                                         if (d > 0) {
                                             $("input[name='noteID']").val(d);
                                         } else {
                                             $("#likeShowSpan").text(value);
                                             $("#likeShowDiv").fadeIn(500);
                                             $("#user-likes").fadeOut(500);
                                         }
                                     });
            } else {

                var liked = $(this).data("like");
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                var id = $("input[name='noteID']").val();
                $("input[name='likesVal']").val(liked);
                var value = $("#like" + liked).text();
                $.post("comments_handler.asp",
                                    {
                                        id: id,
                                        liked: liked,
                                        member: member,
                                        wine: wine,
                                        action: "updateLike"
                                    },
                                     function (d) {
                                         if (d > 0) {
                                             $("#likeShowSpan").text(value);
                                             $("#likeShowDiv").fadeIn(500);
                                             $("#user-likes").fadeOut(500);

                                         } else {
                                             alert('Not Update for some reasons');
                                         }
                                     });


            }

        });

        $("#comments .save").click(function () {
            //$("#comments").show();  

            if ($("input[name='noteID']").val() == "" && $("textarea#message").val() != "") {
                var message = $("textarea#message").val();
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                var isPublish = $("#isPublish").is(":checked") ? 1 : 0;
                //$("input[name='message']").val(message);

                $.post("comments_handler.asp",
                                    {
                                        comment: message,
                                        member: member,
                                        wine: wine,
                                        isPublish: isPublish,
                                        action: "insertComment"
                                    },
                                     function (d) {
                                         if (d > 0) {
                                             $("input[name='noteID']").val(d);
                                         } else {
                                             $("#commentShowDiv #commentShowSpan").text(message);
                                             $("#commentShowDiv").fadeIn(500);
                                             $("#comments").fadeOut(500);
                                         }
                                     });
            } else {

                var message = $("textarea#message").val();
                var member = $("input[name='memberID']").val();
                var wine = $("input[name='wineID']").val();
                var id = $("input[name='noteID']").val();
                var isPublish = $("#isPublish").is(":checked") ? 1 : 0;
                //$("input[name='likesVal']").val(message);

                $.post("comments_handler.asp",
                                    {
                                        id: id,
                                        comment: message,
                                        member: member,
                                        wine: wine,
                                        isPublish: isPublish,
                                        action: "updateComment"
                                    },
                                     function (d) {
                                         if (d > 0) {
                                             $("#commentShowDiv #commentShowSpan").text(message);
                                             $("#commentShowDiv").fadeIn(500);
                                             $("#comments").fadeOut(500);
                                         } else {
                                             alert('No Updated for some reasons');
                                         }
                                     });

            }

        });

        if ($("#likeShowSpan").text() == "") {
            $("#user-likes").fadeIn(500);
            $("#likeShowDiv").hide();
        } else {
            $("#user-likes").hide(500);
            $("#likeShowDiv").fadeIn(500);
        }
        $("#likeShowDiv i").click(function () {
            $("#user-likes").fadeIn(500);
            $("#likeShowDiv").fadeOut(500);
        });


        if ($("textarea#message").val() == "") {
            $("#comments").fadeIn(500);
            $("#commentShowDiv").fadeOut(500);
        } else {
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
<script>
    function showCustomer(str) {
        if (str == "") {
            document.getElementById("txtHint").innerHTML = "";
            return;
        }
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "getcustomer.asp?q=" + str, true);
        xmlhttp.send();
    }
</script>


<form> 
<select name="customers" onchange="showCustomer(this.value)">
<option value="">Select a customer:</option>
<option value="Riesling">Alfreds Futterkiste</option>
<option value="Chardonnay">North/South</option>
<option value="	Moscato">Wolski Zajazd</option>
</select>
</form>
<br>
<div id="txtHint">Customer info will be listed here...</div>




	</body>
</html>