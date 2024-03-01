<%-- 
    Document   : profile.jsp
    Created on : 15-Feb-2024, 9:48:51 pm
    Author     : HP
--%>
<%@page  errorPage="ErrorPage.jsp" %>
<%@page  import="com.tech.entities.User" %>
<%@page  import="com.tech.entities.Message" %>
<%@page  import="com.tech.entities.Category" %>
<%@page  import="com.tech.dao.Postdao" %>
<%@page  import="com.tech.helper.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
                
   

User user =(User) session.getAttribute("currentUser");
if(user==null)
{

response.sendRedirect("login.jsp");
}


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./CSS/index.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--sweet alert cdn-->
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.min.css">
        
        <style>
              body{
                
                background-image: url("Images/38160.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background
            {
         clip-path: polygon(50% 0%, 100% 0, 100% 60%, 94% 100%, 6% 100%, 0% 60%, 1% 0);
            }
        </style>
    </head>
    <body>
     
        <!--Navabar start-->
        
        <nav class="navbar navbar-expand-lg " style="background-color:#ee6e73;">
  <div class="container-fluid">
      <a class="navbar-brand" href="#"><span class="fas fa-user-secret"></span>  DJ</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span>  Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Tech Blogs</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <span class="fas fa-clipboard-list"></span> Category </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Web Development</a></li>
            <li><a class="dropdown-item" href="#">Computer Networking</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure and Algorithm</a></li>
          </ul>
        </li>
         <li class="nav-item">
             <a class="nav-link" href="Contact.jsp"> <sapn class="far fa-address-book"></sapn>  Contact</a>
        </li>
         <li class="nav-item">
             <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#post-modal" > <sapn class="fa fa-newspaper-o"></sapn> Write Post</a>
        </li>
    
       
        
      </ul>
     
        <ul class="navbar-nav mr-right">
            
            <li class="nav-item">
                <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal" > <sapn class="fa fa-user-circle-o"></sapn> <%= user.getName() %> </a>
            </li> 
            
            
             <li class="nav-item">
             <a class="nav-link" href="LogoutServlet"> <sapn class="fas fa-user-plus"></sapn>  LogOut</a>
        </li> 
        </ul>
            
        
        
    </div>
  </div>
</nav>
  
        <!--navabar end-->
        
        <!--message showing-->
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
                  
     
        <!--message showing end-->
        
        
        <!--main body of the page-->
        
        <main>
            <div class="container">
                
                <div class="row mt-4">
                    <!--first colume with 4 grid-->
                    <div class="col-md-4">
                        
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                               All posts 
                            </a>
                            
<!--                            Categories-->
                            <%
                                
Postdao d = new Postdao(ConnectionProvider.getConnection());

  ArrayList<Category> list1 = d.getAllCategories();

for(Category cc :list1 )
{

  %>
                            
                            
  <a href="#" onclick="getPosts(<%= cc.getcId()%>,this)"  class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                   
                      
                            <%
                            
                                }
                            %>
                        </div>
                        
                        
                    </div>
                    <!--second column with 8grid-->
                    <div class="col-md-8">
                        
                        <!--posts-->
                        
                        <div class="container text-center" id="loader">
                            
                            <i class="fa fa-refresh fa-5x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                           
                            
                            
                            
                        </div>
                   
                    </div>
                    
                    
                    
                    
                </div>
                
                
            </div>
            
        </main>
        
        
        
        
        
        <!--main body end of the page-->
        
        
 <!--post modal start--> 
        
<!-- Modal -->
<div class="modal fade" id="post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Provide the post details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          <!--form start-->
        <form id="add-post-form" action="AddPostServlet" method="post">
             
   <!--categories of blogs-->         
   <div class="form-group">
       <select class="form-control" name="cid">
           <option selected disabled >----Select the Category----</option>
           
           <%
               
Postdao postd = new Postdao(ConnectionProvider.getConnection());
  ArrayList<Category> list =  postd.getAllCategories();
for(Category c: list)
{
     
           %>
           
           
           
           <option value="<%= c.getcId() %> "> <%= c.getName() %> </option>
  
       
           
  <%
      }
  %>
       
   </select>
   </div>
            
   <br>
            
            
            
    <div class="form-group">
        <input type="text" id="postTitle" name="pTitle" placeholder="Enter the post title" class="form-control">
    </div>
            <br>
    <div class="form-group">
        <textarea id="postContent" name="pContent" class="form-control" placeholder="Enter your content" style="height: 250px;"></textarea>
    </div>
     <br>
    <div class="form-group">
        <textarea id="postCode" name="pCode" class="form-control" placeholder="Enter your code if any.." style="height: 200px;"></textarea>
    </div>
     <br>
    <div class="form-group">
        
        <label>Select your pic: </label>
        <br>
        
        <input type="file" id="postPic" name="pic" class="form-control" accept="image/*" placeholder="Upload your picture">
    </div>
 <br>
    <!-- Add a submit button to submit the form -->
    <div class="container text-center">
        <button type="submit" class="btn btn-primary">Post</button>
    </div>
</form>


          
          
          <!--form end-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        
        
        
        <!--post modal ended-->
 
 
        <!--profile modal-->
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#ee6e73;">
        
          <h1 class="modal-title fs-5" id="exampleModalLabel"> <sapn class="fa fa-user-circle-o text-center"></sapn> <%= user.getName()%></h1>
           
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"  ></button>
      </div>
    <div class="modal-body" style="padding: 20px; background-color: #f8f9fa;">
        <div class="container text-center">
               <img class="img-fluid text-center" src="Pic/<%=user.getProfile()%>" style="max-width:150px;">
    <br><!-- name -->

    <h5 class=" modal-title mt-3" id="exampleModalLabel"><%=user.getName()%> </h5>
    
 <!--profile modal end-->
 
 
    <!--details-->
    
    <div id="profile-details">
    <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%= user.getId() %></td>

    </tr>
    <tr>
      <th scope="row">Email : </th>
      <td><%= user.getEmail() %></td>

    </tr>
    <tr>
      <th scope="row">Gender : </th>
      <td><%= user.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row">Status : </th>
      <td><%= user.getAbout() %></td>
     
    </tr>
  </tbody>
</table>
    </div>
    
      
      <!--profile edit code-->
      
      <div id="profile-edit" style="display:none">
          
          
          <h3>Edit Carefully!</h3>
          <br>
          
          <!--we are using enctype="multipart/form-data" it shows the form is carrying some image, video data-->
          
          <form action="EditServlet" enctype="multipart/form-data"    method="post">
              
              <table class="table">
                  
                  <tr>
                      <td> ID:</td>
                      <td> <%= user.getId()%> </td>
                      
                  </tr>
                  <tr>
                      <td> Name:</td>
                      <td><input type="text" class="form-control" name="user_name" value="<%=user.getName() %>">   </td>
                      
                  </tr>
                  <tr>
                      <td> Email:</td>
                      <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>">   </td>
                      
                  </tr>
                  <tr>
                      <td> Password:</td>
                      <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword() %>">   </td>
                      
                  </tr>
              
                  <tr>
                      <td> About: </td>
                      <td> 
                          <textarea class="form-control" name="user_about" rows="3"> <%= user.getAbout() %>
                          </textarea>
                          
                      </td>
     
                  </tr>
                  <tr>
                      <td> Profile Pic : </td>
                      <td> 
                          <input type="file" name="user_pic"  class="form-control">
                          
                      </td>
     
                  </tr>
                  <tr>
                      <td> Gender: </td>
                      <td> <%= user.getGender().toUpperCase() %> </td>
     
                  </tr>
                  
              </table>
           
                
                      <div class="container">
                          
                          <button type="submit" class="btn btn-outline-success"">Done</button>
                          
                      </div>
          </form>
          
          
      </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-btn"  >Edit</button>
      </div>
    </div>
  </div>
</div>
       
        
       <!--end of profile modal-->
       
       
       
       
       
       
       
   
       
        <!--javascript-->
        
        
         <script src="Js/likejs.js" type="text/javascript"></script>
        <script src="Js/index.js" type="text/javascript"></script>
        
        
        
                
        <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--sweetalert javascript cdn-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.all.min.js"></script>
    
       
    
        
        
        <script>
            
            
            $(document).ready(function()
            {
                
                let editStatus=false;
                
              $('#edit-profile-btn').click(function(){
                  
                 if(editStatus === false)
                 {
            $('#profile-details').hide();

                 $('#profile-edit').show();
                 
                 editStatus=true;
       
       $(this).text("back");
       
                 }else
                 {
                       $('#profile-details').show();

                 $('#profile-edit').hide();
         editStatus=false;  
         
         $(this).text("Edit");
        }
           
                 
                  
              });
            });
                
            
            
            
            
        </script>

        
        
        <!--now add post js-->
        
        <script>
            
            $(document).ready(function(e){
                
            $("#add-post-form").on("submit",function(event){
                
                // this code will gets called when form will submitted......
                
                event.preventDefault();
//                console.log("submitted");
                
                let form = new FormData(this);
                
                //now requesting to server
                
                $.ajax({
                    
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        // success
                       
                       
                       console.log(data);
                       
                       if (data.trim() === 'done') {
                    Swal.fire({
                        title: "Good job!",
                        text: "Successfully, Added post. ",
                        icon: "success"
                    }).then((value) => {
                        window.location = "profile.jsp";
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: data,
                        icon: "error"
                    });
                }
                    },
                    processData: false,
                    contentType: false
                    
                });
                
                
              
                
            });
            
                
            });
            
            
            </script>
        
        
        
        
        
        <!--Below script is for the posts page and blog posts-->
        <!--loading post usign ajax-->
        <script>
            
            
            function getPosts(catId,temp)
            {
                $('#loader').show();
                $('#post-conatiner').hide();
                
                
                $(".c-link").removeClass('active');
                
                 $.ajax({
                    
                    url: "load_post.jsp",
                    data:{cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        
                        $('#loader').hide();
                       
                        
                        $('#loader').hide();
                    $('#post-conatiner').show();
                     $('#post-container').html(data);
                     $(temp).addClass('active');
                    }

                });
                
            }
            
            
            $(document).ready(function(e)
            {
                let allPostRef=$('.c-link')[0];
               getPosts(0,allPostRef); 
            });
            
            
            
            
        </script>

      
     
        
   
                
        
    </body>
</html>
