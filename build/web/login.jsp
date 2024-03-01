<%-- 
    Document   : loginPage
    Created on : 04-Feb-2024, 5:17:16 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.entities.Message" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
             <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/index.css">

        <style>
            .banner-background
            {
       clip-path: polygon(30% 0%, 70% 0%, 99% 0, 100% 76%, 78% 89%, 38% 91%, 0 76%, 0 0);
            }
        </style>
    </head>
    <body>
       
      <%@include file="Navbar.jsp" %>
        
      <main class="d-flex align-items-center text-dark banner-background" style="height: 80vh;background-color:#f6b3b6;">
          <div class="container">
              
              <div class="row">
                  
                  <div class="col-md-4 offset-md-4">
                      
                      <div class="card">
                    
                          <div class="card-header" style="background-color:#ee6e73;">
                              <span class="fa far fa-user-circle fa-4x d-flex justify-content-center"></span>
                              <h3 class="d-flex justify-content-center">Login </h3>
                              
                          </div>
                          
                         <% 
                        
                         Message m = (Message) session.getAttribute("msg");

                        if(m!=null){
                         %>
                       
                         <br>
                         <div class="alert <%=m.getCssClass() %>" role="alert">
                             <%= m.getContent()%>  
                         </div>
                         
                         <%
                         session.removeAttribute("msg");
                         }

                         %>
                         
                          
                          <div class="card-body">
                              
                              <form action="loginServlet" method="post">
  <div class="row mb-3">
    <label for="inputEmail3" class="col-sm-6 col-form-label">Email</label>
    <div class="col-sm-12">
        <input type="email" class="form-control" id="inputEmail3" name="user_email" required>
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputPassword3" class="col-sm-6 col-form-label">Password</label>
    <div class="col-sm-12">
        <input type="password" class="form-control" id="inputPassword3" name="user_password" required>
    </div>
  </div>
 
                                  <div class="container text-center">
                                      
                                       <button type="submit" class="btn btn-primary">Sign in</button>
                                      
                                  </div>
     
</form>
                              
                              
                          </div>
                    
                      </div>
                      
                      
                  </div>
                  
              </div>
              
          </div>
      </main>
      
      
      
      
      
      
      
      
      
      
      
      
      
        
        
        
        
        
            <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    
    </body>
</html>
