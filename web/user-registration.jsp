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
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var fname=document.myform.fname.value;
        var mobile=document.myform.mobile.value;
        var email=document.myform.email.value;
        var address=document.myform.address.value;
        var gender=document.myform.gender.value;
        var dob=document.myform.dob.value;
        var password=document.myform.password.value;
        var cpassword=document.myform.cpassword.value;  
        var file=document.myform.file.value;
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; 
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name===""){ 
            Swal.fire('Name Cannot be empty'); 
          return false;  
        }
        if (fname===""){ 
            Swal.fire('Father Name Cannot be empty'); 
          return false;  
        }
        if(mobile===""){
            Swal.fire("Provide Mobile number");
            return false;
        }
        if(mobile.length!==10){
            Swal.fire("Missing length of Mobile number");
            return false;
        }
         if(isNaN(mobile)){
            Swal.fire("Invalid Mobile number");
            return false;
        }
        if (email===""){
            Swal.fire("E-mail cannot be empty");           
            return false;
        }
        if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
       
        if (dob===""){
            Swal.fire("Date of Birth cannot be blank");            
            return false;
        }
        if (address===""){
           Swal.fire("Address cannot be blank");            
            return false;
        }
        if (gender===""){
           Swal.fire("Gender cannot be blank");            
            return false;
        }
        
        if (password===''){
           Swal.fire("password should not be empty");          
            return false;
            }
        
        if (!letter.test(password)) {
            Swal.fire("Please make sure password includes a lowercase letter.");
                return false;
            }
        if (!number.test(password)) {
            Swal.fire("Please make sure Password Includes a Digit");
                return false;
            }
        if (!upper.test(password)) {
            Swal.fire("Please make sure password includes an uppercase letter.");
                return false;
            } 
        if(cpassword!==password){
            Swal.fire("password and confirm password must match");            
            return false;
        } 
         if (file===''){
           Swal.fire("please upload the file it should not be empty");          
            return false;
            }
        
        
    }  
    </script>
</head>

<body>
    <script>
        var successMessage = '${sessionScope.failed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'error',
                title: 'Failed!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("failed"); %>
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
                        <a href="user-login.jsp" class="nav-item nav-link active">User</a>
                        <a href="admin-login.jsp" class="nav-item nav-link ">Admin</a>
                        <a href="hospital-login.jsp" class="nav-item nav-link">Hospital</a>
                        <a href="contact.jsp" class="nav-item nav-link ">Contact</a>
                    </div>
                </div>
            </nav>

           <div class="container-xxl py-5 bg-primary hero-header mb-5">
    <div class="container my-5 py-5 px-lg-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="text-white animated zoomIn">User Registration</h1>
                

                <!-- Breadcrumb with smaller size -->
                <nav aria-label="breadcrumb" class="small-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-white" href="index.html">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">User</li>
                    </ol>
                </nav>
            </div>

            <!-- Image on the right -->
            <div class="col-lg-6 text-center text-lg-end">
                <img class="img-fluid" src="img/Screenshot (474).png" alt="Right Image" height="200" width="200">
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


        <div class="container">
      <!-- Add space at the top -->
      <div style="margin-top: 20px;"></div>
      <!-- Add a new container for the login section -->
     <div class="login-container" id="login-container">
    <div class="row g-5 justify-content-center align-items-center">
        <!-- Empty column on the left -->
        

        <!-- Image on the left -->
        

        <!-- Login form in the center -->
        <div class="col-lg-8">
    <div class="card p-4 shadow">
        <h3 class="mb-4">User Registration Form</h3>
        <form action="user-regAction.jsp" method="POST" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Full Name</h6>
                    </label>
                    <input type="text" name="name" id="name" placeholder="Enter Name" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Father Name</h6>
                    </label>
                    <input type="text" name="fname" id="fname" placeholder="Enter Father Name" class="form-control">
                </div>
                
            </div>
            <!-- Add similar rows for other fields (Mobile, Gender, Address, Date of Birth, Password, Confirm Password, Profile Pic) -->

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Email</h6>
                    </label>
                    <input type="text" name="email" id="email" placeholder="*******@gmail.com" class="form-control">
                </div>
                <div class="col-md-6">
                                <label class="mb-0">
                                    <h6 class="mb-0 text-sm">Gender</h6>
                                </label><br>
                                <select class="form-select custom-dropdown" name="gender" id="gender" >
                                    <option  disabled selected>Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                                
                            </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Mobile</h6>
                    </label>
                    <input type="text" name="mobile" id="mobile" placeholder="9638*****" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Address</h6>
                    </label>
                    <input type="text" name="address" id="address" placeholder="Your Location" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Password</h6>
                    </label>
                    <input type="password" name="password" id="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Confirm Password</h6>
                    </label>
                    <input type="password" name="cpassword" id="cpassword" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" class="form-control">
                </div>
                
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">DOB</h6>
                    </label>
                    <input type="date" name="dob" id="dob" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Profile Pic</h6>
                    </label>
                    <input type="file" name="file" id="file" class="form-control">
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-6">
                    <input type="submit" class="btn btn-primary text-center mb-1 py-2" value="Register">
                </div>
            </div>
        </form>
        <div class="row px-3 mb-3">
            <p class="mb-5" style="color: #393f81;">Already have an account? 
                <a href="user-login.jsp" style="color: #393f81;"><b>Login here</b></a>
            </p>
        </div>
    </div>
</div>


        

        <!-- Empty column on the right -->
        
    </div>
</div>
      <!-- Add space at the bottom -->
      <div style="margin-bottom: 20px;"></div>
    </div>
        

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





