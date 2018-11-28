<%  
    M=Session("userid")
    'response.write M
    V=Server.HtmlEncode(Request("V"))
    W=Server.HtmlEncode(Request("W"))
    T=Session("locale")

    If Session("loggedin") <> true Then
        Response.Redirect("login.asp?requester=home.asp")
        
    End If
%>

							<section id="intro">
								<% If T= "Temecula" then %>  
                                    <img src="images/header_doffo.png" alt="" class="image featured"/>
								    <header>                                 
                                        <span style="font-size: 37px; font-weight:bold; color:Black">
                                            Save Your Cork: Temecula</span>
									        <p>Welcome to Southern California's Favorite Wine Country: Temecula</p>

								    </header>
                                 <% else %>
                                    <img src="images/boisset/BT_WineryImage_4_1200_675_65.jpg" alt="" class="image featured"/>
								    <header>
                                        <span style="font-size: 37px; font-weight:bold; color:Black; text-align:center">The Boissett Collection</span>
                                        <br /><br />
                                        <p>SHARE YOUR PASSION FOR WINE, FOR PEOPLE, FOR LIFE!</p>
                                     </header>   
                                 <% end if %>
                                    
									
							</section>