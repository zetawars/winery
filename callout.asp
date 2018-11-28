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


        <% If T= "Temecula" then %>    
            <section><a href="home.asp">Save Your Cork: Temecula</a></section>
        <% else %>
            <section><a href="boisettcollection.asp">Save Your Cork: BOISSET COLLECTION</a></section>
        <% end if %>