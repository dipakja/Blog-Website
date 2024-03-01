<%-- 
    Document   : index
    Created on : 03-Feb-2024, 1:48:57 pm
    Author     : Dipak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.helper.ConnectionProvider" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./CSS/index.css">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap">


        <style>
            .banner-background {
        clip-path: polygon(20% 0, 80% 0, 100% 0, 100% 80%, 100% 100%, 0 100%, 0% 80%, 0 0);
    }

    body {
        background-color: #13265b; /* Light gray background color for the entire body */
    }

    /* Navbar styling */
    nav.navbar {
        background-color: #EE6E73; /* Dark primary color for the navbar */
    }

    /* Navbar brand styling */
    nav.navbar a.navbar-brand {
        color: #f8f9fa; /* Light color for the navbar brand */
    }

    /* Navbar brand hover styling */
    nav.navbar a.navbar-brand:hover {
        color: #28a745; /* Green color for navbar brand on hover */
    }

    /* Navbar item styling */
    nav.navbar a.nav-link {
        color: #f8f9fa; /* Light color for navbar items */
    }

    /* Navbar item hover styling */
    nav.navbar a.nav-link:hover {
        color: #28a745; /* Green color for navbar items on hover */
    }

    /* Search button styling */
    button.btn.btn-outline-light {
        color: #f8f9fa; /* Light color for the search button text */
        border-color: #f8f9fa; /* Light color for the search button border */
    }

    /* Search button hover styling */
    button.btn.btn-outline-light:hover {
        color: #343a40; /* Dark primary color for search button text on hover */
        background-color: #f8f9fa; /* Light color for search button background on hover */
    }
    
     /* Banner styling */
    .jumbotron.banner-background {
        background-color: #2bbbad; /* Bold teal color for the banner background */
        color: #ffffff; /* White text color for the banner content */
        font-family: 'Poppins', sans-serif; /* Trendy font family */
        padding: 50px; /* Increased padding for a more spacious look */
    }

    /* Heading in the banner */
    .jumbotron.banner-background h2 {
        font-size: 3.5rem; /* Larger font size for the heading */
        font-weight: bold; /* Bold font weight */
    }

    /* Subtitle in the banner */
    .jumbotron.banner-background p.display-5 {
        font-size: 1.8rem; /* Increased font size for the subtitle */
    }

    /* Lead text in the banner */
    .jumbotron.banner-background p.lead {
        font-size: 1.2rem; /* Slightly larger font size for the lead text */
        line-height: 1.6; /* Increased line height for better readability */
    }

    /* Buttons in the banner */
    .jumbotron.banner-background button.btn {
        background-color: #ffffff; /* White background color for buttons */
        color: #2bbbad; /* Teal text color for buttons */
        font-weight: bold; /* Bold font weight for buttons */
        margin-right: 10px; /* Added margin between buttons */
    }

    /* Introduction Section background */
    .container.intro-section {
        background-color: #ffffff; /* White background color for the introduction section */
        padding: 30px; /* Increased padding for a cleaner look */
        border-radius: 10px; /* Rounded corners for a modern feel */
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Subtle box shadow for depth */
    }

    /* Features Section background */
    .container.features-section {
        background-color: #f8f9fa; /* Light gray background color for the features section */
        padding: 30px; /* Increased padding for a cleaner look */
        border-radius: 10px; /* Rounded corners for a modern feel */
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Subtle box shadow for depth */
    }

    /* Key Features heading */
    .container.features-section h2 {
        color: #007bff; /* Bold blue color for the key features heading */
    }
    
    
    
        </style>
    </head>
    <body>

        <!--Navbar-->
        <%@include file="Navbar.jsp" %>
               
<!-- Banner -->
<div class="container-fluid p-0 m-0">
    <div class="jumbotron banner-background" style="background-color: #343a40;">
        <div class="container">
            <h2 class="display-2">Hello, Guys!</h2>
            <p class="display-5" style="color:#2bbbad;">Welcome to the Technical Blog World.</p>
            <p class="lead">"Unleash the power of coding and explore the latest in tech with our insightful articles. Dive into a world of programming, innovation, and technical wisdom."</p>
            <p class="lead">"Tech Talk: Your gateway to a universe of coding expertise and tech wonders. Stay tuned for illuminating insights and in-depth explorations into the realm of programming."</p>
            <button class="btn  btn-lg" style="background-color: #2bbbad;color: #f0f0f0"><span class="fas fa-sign-out-alt"></span>Start It</button>
            <a class="btn  btn-lg" style="background-color: #2bbbad;" href="login.jsp"><span class="far fa-user-circle fa-spin"></span> Login In</a>
        </div>
    </div>
</div>
<br><!-- spacing -->
<br><!-- spacing -->

       <!-- Introduction Section -->
<div class="container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px;">
    <div class="row">
        <div class="col-md-8">
            <h2 class="display-4" style="color: #2bbbad;">Explore the Tech Wonderland!</h2>
            <p class="lead">Welcome to our digital realm, where coding meets creativity, and innovation knows no bounds. At <span style="font-weight: bold; color: #f6b3b6;">Your Blog Name</span>, we curate the best blogs, offering you a front-row seat to the ever-evolving world of technology.</p>
            <p class="lead">Here, you're not just a reader; you're a creator. Unleash your knowledge, share your experiences, and contribute to the collective wisdom of our tech-savvy community.</p>
            <p class="lead">Why read when you can write? Dive into the art of documentation – the best way to learn. We provide a platform where your thoughts transform into insightful blogs. And the best part? It's all free!</p>
        </div>
        <div class="col-md-4">
            <!-- Add an eye-catching image related to your blog -->
               <img src="https://img.freepik.com/free-vector/illustration-social-media-concept_53876-36932.jpg?t=st=1708952330~exp=1708955930~hmac=e1dc3986f815930f6db5a2c7763cef2482b0250874a18f9da05a998712fb31b0&w=740" alt="Blog Image" class="img-fluid">
           
        </div>
    </div>
</div>
<br>


   <!-- Registration and Login Section -->
<div class="container" style="background-color: #e6f7ff; padding: 20px; border-radius: 10px;">
    <div class="row">
        <div class="col-md-6">
            <h2 class="display-4" style="color: #007bff;">Join the Tech Tribe!</h2>
            <p class="lead">Embark on an exciting journey by becoming a part of our tech-savvy community. Follow these steps to unleash the full potential of <span style="font-weight: bold; color: #007bff;">Your Blog Name</span>:</p>
            <ol>
                <li><span style="color: #28a745;">Step 1:</span> Click on the "Register" button at the top right corner.</li>
                <li><span style="color: #28a745;">Step 2:</span> Fill in your details – name, email, and a super-secure password.</li>
                <li><span style="color: #28a745;">Step 3:</span> Verify your email to unlock exclusive features.</li>
            </ol>
            <p class="lead">Congratulations! You are now part of a dynamic community where knowledge knows no bounds.</p>
        </div>
        <div class="col-md-6">
            <!-- Add an engaging image related to registration/login -->
       <img src="https://img.freepik.com/free-vector/sign-up-concept-illustration_114360-7885.jpg?t=st=1708952121~exp=1708955721~hmac=c033b5cdf8f8e5e9a8d61771ed169a8a0d9719ab68a7ffe223f6466a7394d762&w=500" alt="Registration/Login Image" class="img-fluid rounded-circle">
        </div>
    </div>
</div>
<br>


   <!-- Features Section -->
<div class="container" style="background-color: #f0f0f0; padding: 20px; border-radius: 10px;">
    <h2 class="text-center">Key Features</h2>
    <div class="row">
        <div class="col-md-4 text-center">
            <i class="fas fa-list-ul fa-3x" style="color: #007bff;"></i>
            <h4>Categories</h4>
            <p>Explore a diverse range of categories covering all things tech.</p>
        </div>
        <div class="col-md-4 text-center">
            <i class="fas fa-user-cog fa-3x" style="color: #28a745;"></i>
            <h4>Edit Profile</h4>
            <p>Personalize your experience by tweaking your profile settings.</p>
        </div>
        <div class="col-md-4 text-center">
            <i class="fas fa-pencil-alt fa-3x" style="color: #f6b3b6;"></i>
            <h4>Write a Post</h4>
            <p>Create and share your own tech wisdom with our intuitive post editor.</p>
        </div>
    </div>
</div>
<br>





        
        
        <script src="https://kit.fontawesome.com/7c992a4c91.js" crossorigin="anonymous"></script>
       <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        


        <script src="Js/index.js" type="text/javascript"></script>


    </body>
</html>
