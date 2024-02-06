<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.codebook.user.userDao"%>
<%@page import="java.sql.*"%>
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
                        <a href="user-dashboard.jsp" class="nav-item nav-link ">Dashboard</a>
                        <a href="DonateOrgan.jsp" class="nav-item nav-link">Donate Organ</a>
                        <a href="myStatus.jsp" class="nav-item nav-link ">My Status</a>
                        <a href="profile.jsp" class="nav-item nav-link active ">My Profile</a>
                        <a href="feedback.jsp" class="nav-item nav-link">Feedback</a>
                        <a href="../index.html" class="nav-item nav-link ">Log Out</a>
                    </div>
                </div>
            </nav>

           <div class="container-xxl py-5 bg-primary hero-header mb-5">
    <div class="container my-5 py-5 px-lg-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="text-white animated zoomIn">My Profile</h1>
                

                <!-- Breadcrumb with smaller size -->
                <nav aria-label="breadcrumb" class="small-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-white" href="user-dashboard.jsp">User Dashboard</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page"><a  class="text-white" href="myStatus.jsp">My Profile</a></li>
                    </ol>
                </nav>
            </div>

            <!-- Image on the right -->
            <div class="col-lg-6 text-center text-lg-end">
                <img class="img-fluid" src="img/Screenshot (470).png" alt="Right Image" height="200" width="200">
            </div>
        </div>
    </div>
</div>
<%
    Blob img=null;
    String pic="";
    String email=(String)session.getAttribute("email");
    String query="SELECT * FROM user WHERE email='"+email+"'";
    ResultSet rs=userDao.Retrieve(query);
    if(rs.next()){
    img=rs.getBlob("image");
    pic=adminDao.imageConversion(img);
%>
        <!-- Navbar & Hero End -->
 <section class="section dashboard">
       <div class="container rounded bg-white mb-5 border border-black" >
        <div class="row ">
            <!-- <h3 class="text-center">PROFILE </h3>  -->
            <div class="col-md-6 mx-auto px-5 pb-3 mt-3" style="border-bottom: 2px solid #31d2f2; ">
                <div class="d-flex align-items-center">
                    <div class="image ml-5">
                        <img src='data:image/jpeg;base64,<%=pic%>'height="200px",width="200px"  alt="image">
                        
                    </div>
                    <div class="mx-5">
                        <h4 class="mb-0 mt-0"></h4>
                        <span></span>
                    </div>
                </div>
            </div>
            <div class="col-md-10 mx-auto border border-black">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="text-right">Profile Settings :</h3>
                    </div>
                    
            <p class="text-center m-2" style="font-size: 12px; color: tomato;">You can update everything except your email.</p>
            <form action="updateProfile.jsp" id="myform" name="myform" onsubmit="return validateuser()" class="form-box mainForm px-4  mb-2 pt-5" style="margin-top:-40px" method="post" enctype="multipart/form-data">
                       
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">                       
                                <label for="name" class="m-1  ">Full Name :</label> 
                                <input type="text" id="name" class="form-control"  name="name" value="<%=rs.getString("name")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="fname" class="m-1">Father Name :</label> 
                                <input type="text" id="fname" class="form-control"   name="fname" value="<%=rs.getString("fathername")%>">
                            </div>
                        </div>
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="email" class="m-1">Email :</label> 
                                <input type="text" id="email" class="form-control"  readonly name="email" value="<%=rs.getString("email")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="phone" class="m-1">Phone :</label>
                                <input type="number" id="mobile" class="form-control"  name="mobile" value="<%=rs.getString("mobile")%>">
                            </div>
                             
                        </div>
                        <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="gender" class="m-1">Gender :</label>
                                <select class="form-control" id="gender" name="gender" >
                                            <option value="<%=rs.getString("gender")%>" selected><%=rs.getString("gender")%></option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select>
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="dob" class="m-1">DOB :</label>
                                <input type="date" id="dob"  class="form-control"  name="dob" value="<%=rs.getString("dob")%>">
                            </div>
                        </div> 
                            
                            <div class="form-row row mb-2">
                            <div class="col-md-5 mx-auto">
                                <label for="address" class="m-1">Address :</label>
                                <input type="text" id="address"  class="form-control"  name="address" value="<%=rs.getString("address")%>">
                            </div>
                            <div class="col-md-5 mx-auto">
                                <label for="file" class="m-1">Upload Profile :</label>
                                <input type="file" id="file"  class="form-control"  name="file">
                            </div>
                        </div> 
                       
                        <div class="mt-5 text-center" value="Submit Button">
                            <button class="btn btn-info btn-pill col-md-4 justify-content-center text fw-bold" type="submit">Update Profile</button>
                        </div> 
                    </form> 
                </div>
            </div>
        </div>
        
    </div>
    </section>
<%
    }
%>

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