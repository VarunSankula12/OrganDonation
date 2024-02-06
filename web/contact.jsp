<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset="utf-8">
    <title>Organ Donation</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        /* Additional Styles for Contact Form */
        .contact-section {
            padding: 100px 0;
        }

        .contact-wrap {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        }

        .contact-wrap h3 {
            color: #333333;
        }

        .contact-wrap form {
            margin-top: 20px;
        }

        .contact-wrap label {
            color: #555555;
            font-weight: 500;
        }

        .contact-wrap input,
        .contact-wrap textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .contact-wrap input:focus,
        .contact-wrap textarea:focus {
            border-color: #6c757d;
        }

        .contact-wrap textarea {
            resize: none;
        }

        .contact-wrap .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .contact-wrap .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var email=document.myform.email.value;
        var subject=document.myform.subject.value;
        var message=document.myform.message.value;
        var submit=document.myform.submit.value;
         var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;
        
        if (name===""){ 
            Swal.fire('name cannot be empty'); 
          return false;  
        }
        if(email===""){
            Swal.fire("Email Cannot be empty");
            return false;
        }
         if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
        if(subject===""){
            Swal.fire("SUbject cannot be empty");
            return false;
        }
        if(message===""){
            Swal.fire("Message cannot be empty");
            return false;
        }
    }
        </script>
</head>

<body>
    <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("success"); %>
        }
          
    </script>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-search me-2"></i>Organ<span class="fs-5">Donation</span></h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="index.html" class="nav-item nav-link ">Home</a>
                        <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="user-login.jsp" class="nav-item nav-link">User</a>
                        <a href="admin-login.jsp" class="nav-item nav-link">Admin</a>
                        <a href="hospital-login.jsp" class="nav-item nav-link">Hospital</a>
                        <a href="contact.jsp" class="nav-item nav-link active">Contact</a>
                    </div>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-primary hero-header mb-5">
                <div class="container my-5 py-5 px-lg-5">
                    <div class="row g-5 py-5">
                        <div class="col-lg-6 text-center text-lg-start">
                <h1 class="text-white animated zoomIn">Contact Us</h1>
                

                <!-- Breadcrumb with smaller size -->
                <nav aria-label="breadcrumb" class="small-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-white" href="index.html">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
                    </ol>
                </nav>
            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(29, 29, 39, 0.7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-light p-3" placeholder="Type search keyword">
                            <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->

       
        <!-- Contact Start -->
         <section class="ftco-section contact-section bg-light">
    <div class="container">
        <div class="row no-gutters">
             <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                            <h6 class="position-relative d-inline text-primary ps-4">Contact Us</h6>
                            <h2 class="mt-2">Contact For Any Query</h2>
                        </div>
            <div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch mx-auto">
                <!-- Add mx-auto to center the column horizontally -->
                <div class="contact-wrap w-100 p-md-5 p-4">
                    <h3 class="mb-4">Get in touch</h3>
                    <form method="POST" id="myform" onsubmit="return validateuser()" action="sendEmail.jsp" name="myform" class="contactForm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="label" for="name">Full Name</label>
                                    <input type="text" class="form-control" name="name" id="name" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="label" for="email">Email Address</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="label" for="subject">Subject</label>
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="label" for="message">Message</label>
                                    <textarea name="message" class="form-control" id="message" cols="30" rows="4" placeholder="Message"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" value="Send Message" class="btn btn-primary">
                                    <div class="submitting"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

        <!-- Contact End -->
        

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-3">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h5 class="text-white mb-4">Popular Link</h5>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">Career</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h5 class="text-white mb-4">Project Gallery</h5>
                        <div class="row g-2">
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-1.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-2.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-3.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-4.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-5.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="img/portfolio-6.jpg" alt="Image">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulpu</p>
                        <div class="position-relative w-100 mt-3">
                            <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text" placeholder="Your Email" style="height: 48px;">
                            <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i class="fa fa-paper-plane text-primary fs-4"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-lg-5">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>
    </div>
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>