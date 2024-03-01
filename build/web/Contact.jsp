<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/index.css">
    <style>
        .section-background-you {
            background-color: #f6f6f6; /* Set your desired background color for you */
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 20px;
        }

        .section-background-friend {
            background-color: #e8faff; /* Set your desired background color for your friend */
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <%@include file="Navbar.jsp" %>

    <!-- Introduction Section - You and Your Friend -->
    <div class="container mt-5">
        <!-- You -->
        <div class="row mb-5 section-background-you">
            <div class="col-md-6">
                <h2>About Me</h2>
                <p style="opacity: 0;" class="fade-in">I am a third-year student passionate about technology and coding. Welcome to my contact page! Let's connect and explore the world of tech together.</p>
                <ul style="opacity: 0;" class="fade-in">
                    <li>Skills:
                        <ul>
                            <li>Java</li>
                            <li>JDBC</li>
                            <li>MySQL</li>
                            <li>HTML</li>
                            <li>CSS</li>
                            <li>JavaScript</li>
                        </ul>
                    </li>
                    <li>I am a Microsoft Learn Student Ambassador.</li>
                    <li>I am also an open-source contributor.</li>
                </ul>
            </div>
            <div class="col-md-6 text-center">
                <img src="./Images/DipakJadhav.jpg" alt="Your Profile Image" class="img-fluid rounded-circle mb-3" width="300px">
                <!-- Social Profiles Section - You -->
                <div class="fade-in" style="opacity: 0;">
                    <a href="https://www.linkedin.com/in/dipak-jadhav-8300081b4/" target="_blank" class="text-dark me-3">
                        <i class="fab fa-linkedin fa-2x"></i>
                    </a>
                    <a href="https://twitter.com/DipakJa44213008" target="_blank" class="text-dark me-3">
                        <i class="fab fa-twitter fa-2x"></i>
                    </a>
                    <a href="https://github.com/dipakja" target="_blank" class="text-dark">
                        <i class="fab fa-github fa-2x"></i>
                    </a> &nbsp;
                      <a href="https://dipakja.github.io/" target="_blank" class="text-dark">
                        <i class="fa fa-user-circle fa-2x"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Your Friend -->
        <div class="row section-background-friend">
            <div class="col-md-6">
                <h2>About My Friend</h2>
                <p style="opacity: 0;" class="fade-in">Meet my friend! A valuable member of our team with a passion for coding and innovation. Let's connect and share our knowledge.</p>
                <ul style="opacity: 0;" class="fade-in">
                    <li>Skills:
                        <ul>
                            <li>Java</li>
                            <li>JDBC</li>
                            <li>MySQL</li>
                            <li>HTML</li>
                            <li>CSS</li>
                            <li>JavaScript</li>
                        </ul>
                    </li>
                    <li>He is a Microsoft Learn Student Ambassador.</li>
                    <li>He is also an open-source contributor.</li>
                </ul>
            </div>
            <div class="col-md-6 text-center">
                <img src="./Images/dase.jpg" alt="Friend's Profile Image" class="img-fluid rounded-circle mb-3" width='300px'>
                <!-- Social Profiles Section - Your Friend -->
                <div class="fade-in" style="opacity: 0;">
                    <a href="https://www.linkedin.com/in/friend-linkedin-profile" target="_blank" class="text-dark me-3">
                        <i class="fab fa-linkedin fa-2x"></i>
                    </a>
                    <a href="https://twitter.com/friend-twitter-handle" target="_blank" class="text-dark me-3">
                        <i class="fab fa-twitter fa-2x"></i>
                    </a>
                    <a href="https://github.com/friend-github-username" target="_blank" class="text-dark">
                        <i class="fab fa-github fa-2x"></i>
                    </a>
                  
                </div>
            </div>
        </div>
    </div>

<!--     Animation Section (Example: Bouncing Ball) 
    <div class="container mt-5">
        <h2>Interactive Animation</h2>
        <div class="text-center">
            <div class="ball"></div>
        </div>
    </div>-->

    <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>-->
    <script src="Js/index.js" type="text/javascript"></script>

    <script>
        // Example animation (bouncing ball)
        $(document).ready(function(){
            fadeInSections();
            animateBall();
        });

        function animateBall() {
            $(".ball").animate({top: '+=20px'}, 1000, function(){
                $(".ball").animate({top: '-=20px'}, 1000, function(){
                    animateBall();
                });
            });
        }

        function fadeInSections() {
            $('.fade-in').each(function (index) {
                $(this).delay(500 * index).animate({ opacity: 1 }, 500);
            });
        }
    </script>

</body>
</html>
