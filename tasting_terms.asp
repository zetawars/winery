<%
    If Session("loggedin") <> true Then
        Response.Redirect("login.asp#temecula?requester=vineyard_list.asp?V=" & Server.HtmlEncode(Request("V")) & "%26W=" & Server.HtmlEncode(Request("W")))
        
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
							<section>
								<ul class="actions vertical">
									<li><a href="login.asp" class="button big fit">Log In</a></li>
								</ul>
							</section>

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

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2>Wine Tasting Glossary of Terms</h2>
										<p>
                                        
        
                                        <br />
                                        <dt >
                                        <a name="angular"><strong>ACETIC (see also ASCESCENCE)</strong></a></dt>
                                        <dd />
                                        All wines contain acetic acid - (ie: vinegar). Normally the amount is insignificant and may even enhance flavour. At a little less than 0.10% content, 
                                        the flavour becomes noticable and the wine is termed acetic. Above 0.10% content is considered a strong fault. A related substance, ethyl acetate, 
                                        contributes the smell associated with acetic acid content.</dd>

                                        <br /><dt >
                                        <a name="acid"><strong>ACID/ACIDITY</strong></a></dt>
                                        <dd />
                                        Acid ... term used to describe a tart or sour taste in the mouth when total acidity of the wine is high.
                                        Acidity ... term used on labels to express the total acid content of the wine. The acids referred to are citric, lactic, malic and tartaric. 
                                        Desirable acid content on dry wines falls between 0.6% and 0.75% of the wines volume. For sweet wines it should not be less than 0.70% of the volume.</dd>

                                        <br /><dt >
                                        <a name="acid"><strong>AFTERTASTE (see also FINISH, LENGTH) - a.k.a Farewell, Fairwell</strong></a></dt>
                                        <dd />
                                        Term used to describe the taste left in the mouth after swallowing the wine. Both character and length of the aftertaste are part of the total evaluation. 
                                        May be harsh, hot, soft and lingering, short, smooth, tannic, or nonexistent.</dd>

                                        <br /><dt >
		                                <a name="angular"><strong>ANGULAR</strong></a></dt>
                                        <img alt="Tasting glossary" class="auto-style13" height="100" src="../../images/button_tasting.jpg" style="float: right" width="100">
		                                <dd />
		                                The total effect of dominant, tart-edged flavours and taste impressions in many young dry wines. Has opposite meaning to round, soft or supple.</dd>
		
		                                <br /><dt >
		                                <a name="ascescence"><strong>ASCESCENCE</strong></a></dt>

		                                <dd >
		                                &quot;Ascescence&quot; is the term used to mark the presence of acetic acid and ethyl acetate. Detected by sweet and sour, sometimes vinegary smell and taste along 	with a sharp feeling in the mouth.</dd>
		

                                        <br /><dt >
                                        <a name="age"><strong>AGE/AGED</strong></a></dt>
                                        <dd >
                                        White wines tend to turn from a greenish hue in young wines to a yellowish 
                                        caste/tone to a gold/amber colour as they age. Reds usually possess a purple 
                                        tone when young, turning to a deep red - (Bordeaux wines) - or a brick red 
                                        colour - (Burgundy wines) - detectable at the surface edge in a wineglass as 
                                        they age. Rose's should be pink with no tinge of yellow or orange.<BR /><BR />Cellar aged 
                                        red wines at their peak will show a deep golden-orange colour as it thins at the 
                                        surface edge. If the wine colour has deepened into a distinctly brown-orange 
                                        tint at the edge it usually indicates a wine past its peak and declining.
                                        </dd>
		
		                                <br /><dt >
		                                <a name="astringent"><strong>ASTRINGENT</strong></a></dt>
		                                <dd >
		                                Descriptive of wines that have a rough, puckery taste. 
		                                Usually can be attributed to high tannin content. 
		                                Tannic astringency will normally decrease with age. However, sometimes 
		                                the wine fails to outlive the tannin.</dd>
        
                                        <dd >
		
		
		                                <br /><dt >
		                                <a name="attack"><strong>ATTACK</strong></a></dt>
		                                <dd >
		                                The initial impact of a wine. If not strong or flavourful, the wine is 
		                                considered &quot;feeble&quot;. &quot;Feeble&quot; wines are sometimes encountered among 
		                                those vinified in a year where late rain just before harvest diluted 
		                                desirable grape content.</dd>
		
		
                                        <br /><dt >
		                                <a name="botrytis"><strong>BOTRYTIS</strong></a></dt>
		                                <dd >
		                                &quot;Botrytis Cinerea&quot;, a mold or fungus that attacks grapes in humid 
		                                climate conditions, causing the concentration of sugar and acid content 
		                                by making grapes at a certain level of maturity shrivel. On the Riesling grape 
		                                it allows a uniquely aromatic and flavourful wine to be made, resulting 
		                                in the extraordinary &quot;Beerenauslese&quot; style of wine.</dd>
		
		                                <br /><dt >
		                                <a name="browning"><strong>BROWNING</strong></a></dt>
		                                <dd >
		                                Denotes ageing in a wine. Young wine colour tints show no sign of such 
		                                &quot;browning&quot;. If possessed of good character and depth, 
		                                a wine can still be very enjoyable even with a pronounced &quot;brown&quot; tint. 
		                                In average wines this tint, seen along the wine surface edge in a tilted 
		                                glass goblet, normally signals a wine is &quot;past its peak&quot;, although still 
		                                very drinkable.</dd>
		
		                                <br /><dt >
		                                <a name="cloying"><strong>CLOYING</strong></a></dt>
		                                <dd >
		                                Excessive sugar component 
		                                annoys with dominating flavour and aftertaste. 
		                                The wine is then demonstrably unbalanced 
		                                relative to the other components.</dd>
		
		                                <br /><dt >
		                                <a name="decanting"><strong>DECANTING</strong></a></dt>
		                                <dd >
		                                A method by which cellar-aged bottled wine is poured slowly and 
		                                carefully into a second vessel, usually a glass decanter, in order to 
		                                leave any sediment in the original bottle before serving. Almost always 
		                                a treatment confined to red wines. The traditional method uses a candle 
		                                flame as the light for illuminating the neck of the bottle while the 
		                                wine is passing by. The low intensity of the light is ideal for viewing 
		                                since it does not strain the eyes. Care must be taken NOT to allow the 
		                                flame to heat the wine while performing this ritual.</dd>
		
                                        <br /><dt >
		                                <a name="ethyl_acetate"><strong>ETHYL ACETATE</strong></a></dt>
		                                <dd >
		                                A substance which contributes the smell associated with acetic acid 
		                                content.</dd>
		
                                        <br /><dt >
		                                <a name="glycerin"><strong>GLYCERIN/GLYCEROL</strong></a></dt>
		                                <dd >
		                                Gives a sweet taste on 
		                                the tongue tip. Higher concentrations are found in high-alcohol and 
		                                late-harvest wines, leading to sensations of smooth slipperiness giving 
		                                a sense of fullness to the wine body. Is a natural by-product of the 
		                                fermentation process.</dd>
		
                                        <br />
                                        <dt >
		                                <span >
		                                <a name="herbaceous"><strong>HERBACEOUS</strong></a></span> </dt>
		                                <dd >
		                                Adjective used in description of wine with taste and aroma of 
		                                herbs, (usually undefined). Considered to be a varietal characteristic 
		                                of Cabernet 
		                                Sauvignon, and to less extent, Merlot and Sauvignon 
		                                Blanc grapes.</dd>
		
                                        <br /><dt >
		                                <a name="maderized"><strong>MADERIZED</strong></a></dt>
		                                <dd >
		                                Distinctive brown colour 
		                                in wine due usually to period of air exposure. Regarded as synonym for &quot;oxidized&quot;. 
		                                Originates from the taste/appearance of Madeira wines. &quot;Sherrified&quot; is 
		                                commonly used synonym.</dd>
		
		                                <br /><dt >
		                                <a name="malo"><strong>MALOLACTIC FERMENTATION</strong></a></dt>
		                                <dd >
		                                Secondary fermentation occasionally detected in bottled wines. Its 
		                                action converts the naturally occurring Malic acid into Lactic acid plus 
		                                Carbon Dioxide gas. Reduces total acidity by 
		                                this action. Since the gas is contaminated with undesirable odours, if 
		                                it remains trapped in the bottle it becomes a minor fault unless allowed 
		                                to dissipate. Malolactic fermentation is a commonly used technique for 
		                                reducing the sharpness of cool climate Chardonnays 
		                                and the Lactic acid component gives an admired &quot;creamy&quot; 
		                                or &quot;buttery&quot; 
		                                texture.</dd>
		 
		                                <br /><dt >
		                                <a name="nose"><strong>NOSE</strong></a></dt>
		                                <dd >
		                                Not the fleshy sense-organ/projection on the human face. Is near synonym 
		                                word for &quot;aroma&quot; 
		                                and includes &quot;bouquet&quot;. 
		                                Strictly applied it refers to the totality of the detectable odour, 
		                                (grape variety, 
		                                vinous character, fermentation smells), whether desirable or defective, 
		                                found in a wine. One would speak of a mature wine as having, for 
		                                example, &quot;varietal aromas, flowery bouquet 
		                                and hint of vanilla oak combining 
		                                to give balanced nose&quot;.</dd>
		 
		                                <br /><dt >
		                                <a name="ponderous"><strong>PONDEROUS</strong></a></dt>
		                                <dd >
		                                Even less balanced than a &quot;hearty&quot; 
		                                or &quot;sturdy&quot; 
		                                wine. The sole impact is one of high alcohol and 
		                                &quot;body&quot; 
		                                character. Little or no acid/tannin content. 
		                                An everyday red wine, similar to a french &quot;vin ordinaire&quot; country wine 
		                                sold by alcohol content, can be an example.</dd>
		 
		                                <br /><dt >
		                                <a name="racking"><strong>RACKING</strong></a></dt>
		                                <dd >
		                                Traditional method of wine clarification. Sequential transfer of wine to 
		                                several containers, each transfer leaving behind some particulate 
		                                matter.</dd>

		                                <br />
		                                <dt >
		                                <span >
		                                <a name="rim"><strong>RIM</strong></a></span> </dt>
		                                <dd >
		                                Refers to edge of wine surface as seen through a &quot;ballon&quot; style 
		                                wineglass held at an angle of about 30-40 deg. from the vertical and 
		                                viewed against white piece of paper or cloth using natural light . Used 
		                                in evaluation of wine age. In &quot;blind&quot; tasting is about the only way to 
		                                get an informed perception about the probable life and/or condition of 
		                                the wine from that date on.</dd>
		 
		                                <br /><dt >
		                                <a name="round"><strong>ROUND</strong></a></dt>
		                                <dd >
		                                Describes flavours and tactile sensations giving a feeling of 
		                                completeness with no dominating characteristic. Almost the same as fat, 
		                                but with more approval. Tannin, acid and glycerin are 
		                                sufficiently present but appear as nuances rather than distinct 
		                                flavours.</dd>

		                                <br />
		                                <dt >
		                                <span >
		                                <a name="tannin"><strong>TANNIN</strong></a></span> </dt>
		                                <dd >
		                                <span class="auto-style15">A naturally occurring substance in grapeskins, seeds and stems. Is 
		                                primarily responsible for the basic &quot;bitter&quot; 
		                                component in wines. Acts as a natural preservative, helping the 
		                                development and, in the right proportion, balance</a> of 
		                                the wine. It is considered a fault when present in excess.</dd></span>
		                                <p>&nbsp;</p>
		                                <hr>
		                                <p >Content borrowed from:</p>
		                                <p ><a href="http://zebra.sc.edu/smell/wine_glossary.html" target="_blank">http://zebra.sc.edu/smell/wine_glossary.html</a></p></p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-10-25">October 25, 2015</time>
										<a href="#" class="author"><span class="name">Anthony Hawkins</span><img src="images/avatar.jpg" alt="" /></a>
									</div>
								</header>
								
							</article>


					<!-- Pagination -->
							<ul class="actions pagination">
								
								<li><a href="tasting_school.asp" class="button big previous">Previous Page</a></li>
							</ul>

					</div>

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a href="#" class="logo"><img src="images/index.1.gif" alt="" /></a>
								<header>
									<span style="font-size: 37px; font-weight:bold; color:Black">Save Your Cork: Temecula</span>
									<p>Welcome to Southern California's Favorite Wine Country: Temecula</p>
								</header>
							</section>

						<!-- Mini Posts -->
							<section>My Favorite Wines:
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
                                            <% 
                                            M=Session("userid")
                                            'M="20110001-free"
                                            V=Server.HtmlEncode(Request("V"))
                                            W=Server.HtmlEncode(Request("W"))

                                            'declare the variables 
                                            Dim Connection
                                            Dim ConnectionString
                                            Dim Recordset
                                            Dim SQL
                                            Dim rsVineyard


                                                'declare the SQL statement that will query the database
                                                SQL = "SELECT * FROM qry_Tasting_Notes WHERE Member = '" & M & "' AND Tasting_Score > 3 ORDER BY Winery DESC, Name ASC Limit 5"

                                                'Response.write SQL1
                                                'define the connection string, specify database driver
                                                ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=50.62.209.75; DATABASE=TemeculaDB; UID=TemeculaDB; PASSWORD=Wine!Admin2016; OPTION=3"

                                                'create an instance of the ADO connection and Recordset objects
                                                Set Connection = Server.CreateObject("ADODB.Connection")

                                                Set rsVineyard = Server.CreateObject("ADODB.RecordSet")

                                                'Open the connection to the database
                                                Connection.Open ConnString


                                                'Open the Recordset object executing the SQL statement and return records 
                                                rsVineyard.Open SQL,Connection


                                                'first of all determine whether there are any records 
                                                If rsVineyard.EOF  Then 
                                                Response.Write("No records returned.") 
                                                Else
                                                'if there are records then loop through the fields 
                                                Do While NOT rsVineyard.Eof   
                                                    'Do While NOT rsFav.Eof
    
	                                            'T_Rest=len(rsVineyard("Restaurant"))
	                                            'Response.write T_Rest
	
	                                            'T_Hours=len(rsVineyard("Hours"))
	                                            'Response.write T_Hours
	
	                                            'T_Taste=len(rsVineyard("Tastings"))
	                                            'Response.write T_Taste

                                                'W_Fave = rsVineyard("Vineyard_ID")
                                                'Response.write W_Fave

                                                'GAdd = replace(rsVineyard("location")," ","+")
                                                'GAdd2 = rsVineyard("Winery_Name") & ", " & rsVineyard("Location") 

	                                            %>


                                            <header>
                                                <a href='wine_details.asp?M=<% =M %>&V=<%=rsVineyard("Winery")%>&W=<%=rsVineyard("Wine")%>' ><img alt="<%=rsVineyard("Winery")%> <%=rsVineyard("Name")%>" src='<%=rsVineyard("Image_Location")%>' /></a>
												<h3><a href='vineyard_details.asp?M=<% =M %>&V=<%=rsVineyard("Winery")%>'><%=rsVineyard("Winery")%></h3>
                                                <h1><%=rsVineyard("Vintage")%> <%=rsVineyard("Name")%></h1>
                                                <h1>Tasting: <%=UserLike%> <br />
                                                Score: <%=TastingScore%></h1>

                                            </header>
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
										</article>

								</div>
							</section>

						<!-- Posts List -->
							<section><h2>Local Events</h2><br />
                                <ul class="posts">
									<li>
										<article>
											<header>
												<h3><a href="#">Temecula Balloon Festival</a></h3>
												<time class="published" datetime="2015-10-20">MAY 20, 21 & 22</time>
											</header>
											<a href="http://www.tvbwf.com/" class="image"><img src="images/temecula_hotair_balloon.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="#">Ponte Winery Sing-Off</a></h3>
												<time class="published" datetime="2015-10-15">October 15, 2015</time>
											</header>
											<a href="#" class="image"><img src="http://www.pontewinery.com/assets/files/template_files/ponte-winery-logo-2x.png" alt="" /></a>
										</article>
									</li>

								</ul>
							</section>

						<!-- About -->
							<section class="blurb">
								
								<ul class="actions">
									<li><a href="vineyards_list.asp" class="button">More Wineries</a></li>
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
								<p class="copyright">&copy; Save Your Cork. 
                                <BR />Another fine responsive site template by <a href="http://html5up.net">HTML5 UP</a>. </p>
							</section>

					</section>

			</div>

		<!-- Scripts -->
			<script src="html5/imperfect/assets/js/jquery.min.js"></script>
			<script src="html5/imperfect/assets/js/skel.min.js"></script>
			<script src="html5/imperfect/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="html5/imperfect/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="html5/imperfect/assets/js/main.js"></script>

	</body>
</html>