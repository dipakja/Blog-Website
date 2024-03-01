

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.min.css">
          
        <!--<link rel="stylesheet" href="CSS/index.css">-->

        <style>
            .banner-background
            {
                clip-path: polygon(30% 0%, 70% 0%, 99% 0, 100% 76%, 86% 95%, 24% 98%, 0 76%, 0 0);
            }
        </style>
    </head>
    <body>
       
        <%@include file="Navbar.jsp" %>

        <main class="banner-background p-5" style="background-color:#f6b3b6; padding-bottom: 50px">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 offset-md-3" >

                        <div class="card">
                            <div class="card-header text-center" style="background-color:#ee6e73;">
                                <span class="fa fa-user-circle fa-4x"></span>
                                <h3>Register</h3>
                            </div>

                            <div class="card-body">
                                <form action="RegisterServlet" method="post" id="form">



                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">User Name</label>
                                        <input type="text" class="form-control" id="user_name" aria-describedby="emailHelp" name="user_name" required>





                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                                            <input type="email" name="user_email"    class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Password</label>
                                            <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" required>
                                        </div>


                                        <div class="mb-3">
                                            <label for="user_gender" class="form-label">Select Gender: </label>

                                            <br>
                                            <input type="radio"  id="Male_gender" name="user_gender" value="Male" required>Male's
                                            <input type="radio"  id="Female_gender" name="user_gender" value="Female"  required>Female

                                        </div>


                                        <div class="form-group">

                                            <textarea name="about" class="form-control" rows="4" placeholder="What Describes you?"></textarea>


                                        </div>

                                        <br>

                                        <div class="mb-3 form-check">
                                            <input type="checkbox" name="check"  class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Agree terms and Conditions</label>
                                        </div>

                                        <div class="container text-center" id="loader" style="display: none;">
                                            <span class="fa fa-spinner fa-spin fa-3x"></span>
                                            <h4>Wait...</h4>
                                        </div>

                                        <br>
                                        
                                        <div class="conainer text-center" id="loader" style="display: none;">
                                            
                                                 <span class="fas fa-refresh fa-spin fa-2x"></span>
                                     
                                                 <h4>Please wait</h4>
                                        </div>
                                            
                                      <br>
                                        <button type="submit" id="submit-btn"     class="btn btn-primary">Submit</button>
                                </form>

                            </div>

                        </div>

                    </div>
                </div>
        </main>














        <!--Javascript-->
        <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.10.5/sweetalert2.all.min.js"></script>
        <script>
$(document).ready(function () {
    console.log("loaded");
    $('#form').on('submit', function (event) {
        event.preventDefault();
        
        let form = new FormData(this);
        $("#submit-btn").hide();
        $("#loader").show();
        // send data to RegisterServlet
        $.ajax({
            url: "RegisterServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $("#submit-btn").show();
                $("#loader").hide();

                if (data.trim() === 'done') {
                    Swal.fire({
                        title: "Good job!",
                        text: "Successfully registered. Redirecting to login page.",
                        icon: "success"
                    }).then((value) => {
                        window.location = "login.jsp";
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: data,
                        icon: "error"
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                Swal.fire("Something went wrong!", "Error", "error");
            },
            processData: false,
            contentType: false
        });
    });
});



        </script>



        <script>
        
            
            </script>


    </body>
</html>
