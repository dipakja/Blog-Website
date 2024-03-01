<%@page import="com.tech.entities.Posts" %>
<%@page import="com.tech.entities.User" %>
<%@page import="com.tech.dao.Postdao" %>
<%@page import="com.tech.dao.LikeDao" %>
<%@page import="com.tech.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>






<div class="row">

<%
    
    User uu = (User) session.getAttribute("currentUser");
    
    
    
    
 Thread.sleep(1000);
Postdao d = new  Postdao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));

List<Posts> posts=null;
if(cid == 0)
{

 posts = d.getAllPost();
}else
{
posts = d.getPostByCatId(cid);
}

if(posts.size()==0)
{
out.println("<h3 class='display-3 text-center'>No post blogs in this categories!</h3>");
return;
}


for(Posts p: posts)
{


%>


<div class="col-md-6 mt-3">
    
    <div class="card">
   
        <div class="card-header">
            
            <img class="card-img-top" src="blog_Pics/<%= p.getpPic()%> " alt="Card image cap">
        </div>
        
        
        <div class="card-body">
            
              <b><%= p.getpTitle()%> </b>
              <p style="display: -webkit-box;
    -webkit-line-clamp: 2; /* Adjust the number of lines to display */
    -webkit-box-orient: vertical;
    overflow: hidden;">
                  <%=p.getpContent()%>
              </p>
              <!--<pre>-->
                  
                  <%--<%=p.getpCode()%>--%>

              <!--</pre>-->
              
        </div>
       
                  
                  <div class="card-footer text-center" style="background-color: #ea6c71;">
                      
                      <%
                      LikeDao l = new LikeDao(ConnectionProvider.getConnection());
                      %>
                      
                      
                      
                      
                      
                      
                      
                      <!--//url rewritein-->
                      
                      <a href="show_blog_post.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-primary btn-sm">Read more..</a> 
                      
                      <a href="#" onclick="doLike(<%= p.getpId()%> , <%= uu.getId()%>)"  class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= l.countLikeOnPost(p.getpId())%></span> </a>
               
                      <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>8</span> </a>
                      
                      
                  </div>
                  
    </div>
   
</div>

<%
}
%>
    
    </div>
    