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
            
         var name = document.myform.name.value;
    var fname = document.myform.fname.value;
    var mobile = document.myform.mobile.value;
    var email = document.myform.email.value;
    var address = document.myform.address.value;
    var gender = document.myform.gender.value;
    var dob = document.myform.dob.value;
    var self_disease = document.myform.self_disease.value;
    var organs = document.myform.organ; // Remove square brackets from variable name
    var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;
    var letter = /[a-z]/;
    var upper = /[A-Z]/;
    var number = /[0-9]/;

    if (name === "") {
        Swal.fire('Name Cannot be empty');
        return false;
    }
    if (fname === "") {
        Swal.fire('Father Name Cannot be empty');
        return false;
    }
    if (mobile === "") {
        Swal.fire("Provide Mobile number");
        return false;
    }
    if (mobile.length !== 10) {
        Swal.fire("Missing length of Mobile number");
        return false;
    }
    if (isNaN(mobile)) {
        Swal.fire("Invalid Mobile number");
        return false;
    }
    if (email === "") {
        Swal.fire("E-mail cannot be empty");
        return false;
    }
    if (!email.match(emailpattern)) {
        Swal.fire("Invalid Email format");
        return false;
    }
    if (dob === "") {
        Swal.fire("Date of Birth cannot be blank");
        return false;
    }
    if (address === "") {
        Swal.fire("Address cannot be blank");
        return false;
    }
    if (gender === "") {
        Swal.fire("Gender cannot be blank");
        return false;
    }
    if (self_disease === "") {
        Swal.fire('Self Disease Cannot be empty');
        return false;
    }
    var organs = document.getElementsByName("organ[]");
    var organSelected = false;

    // Loop through checkboxes
    for (var i = 0; i < organs.length; i++) {
        if (organs[i].checked) {
            organSelected = true;
            break; // Exit the loop if at least one organ is selected
        }
    }

    if (!organSelected) {
        Swal.fire('Select at least one organ to donate');
        return false;
    }
    return true;
        
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
                        <a href="DonateOrgan.jsp" class="nav-item nav-link active">Donate Organ</a>
                        <a href="myStatus.jsp" class="nav-item nav-link ">My Status</a>
                        <a href="profile.jsp" class="nav-item nav-link ">My Profile</a>
                        <a href="feedback.jsp" class="nav-item nav-link">Feedback</a>
                        <a href="../index.html" class="nav-item nav-link ">Log Out</a>
                    </div>
                </div>
            </nav>

           <div class="container-xxl py-5 bg-primary hero-header mb-5">
    <div class="container my-5 py-5 px-lg-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 text-center text-lg-start">
                <h1 class="text-white animated zoomIn">Donate Organs</h1>
                

                <!-- Breadcrumb with smaller size -->
                <nav aria-label="breadcrumb" class="small-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-white" href="user-dashboard.jsp">User Dashboard</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page"><a  class="text-white" href="DonateOrgan.jsp">Donate Organs</a></li>
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

   
        <!-- Navbar & Hero End -->
 <div class="container">
        <!-- Add space at the top -->
        <div style="margin-top: 20px;"></div>
        <!-- Add a new container for the donation form section -->
        <div class="donation-container" id="donation-container">
            <div class="row g-5 justify-content-center align-items-center">
                <!-- Empty column on the left -->

                <!-- Donation form in the center -->
                <div class="col-lg-8">
                    <div class="card p-4 shadow">
                        <h3 class="mb-4">Organ Donation Form</h3>
                                 
   <%
       String email=(String)session.getAttribute("email");
       String query="SELECT * FROM user WHERE email='"+email+"'";
       ResultSet rs=userDao.Retrieve(query);
       if(rs.next()){
   %>
                        <form action="DonateOrganAction.jsp" method="GET" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Full Name</h6>
                                    </label>
                                    <input type="text" name="name" id="name" value="<%=rs.getString("name")%>" class="form-control" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Father Name</h6>
                                    </label>
                                    <input type="text" name="fname" id="fname" value="<%=rs.getString("fathername")%>" class="form-control" readonly>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Email</h6>
                                    </label>
                                    <input type="text" name="email" id="email" value="<%=rs.getString("email")%>" class="form-control" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Gender</h6>
                                    </label><br>
                                    <select class="form-select custom-dropdown" name="gender" id="gender" >
                                        <option value="<%=rs.getString("gender")%>" selected><%=rs.getString("gender")%></option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Mobile</h6>
                                    </label>
                                    <input type="text" name="mobile" id="mobile" value="<%=rs.getString("mobile")%>" class="form-control" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Address</h6>
                                    </label>
                                    <input type="text" name="address" id="address" value="<%=rs.getString("address")%>" class="form-control" readonly>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Self Disease</h6>
                                    </label>
                                    <input type="text" name="self_disease" id="self_disease" placeholder="Enter self disease" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Date of Birth</h6>
                                    </label>
                                    <input type="date" name="dob" id="dob" value="<%=rs.getString("dob")%>" class="form-control" readonly>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-12">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Donate Organ</h6>
                                    </label><br>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="eyes" name="organ[]" value="eyes">
                                        <label class="form-check-label" for="eyes">Eyes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="heart" name="organ[]" value="heart">
                                        <label class="form-check-label" for="heart">Heart</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="brain" name="organ[]" value="brain">
                                        <label class="form-check-label" for="heart">Brain</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="kidney" name="organ[]" value="kidney">
                                        <label class="form-check-label" for="heart">Kidney</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="liver" name="organ[]" value="liver">
                                        <label class="form-check-label" for="heart">Liver</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="checkbox" class="form-check-input" id="lungs" name="organ[]" value="lungs">
                                        <label class="form-check-label" for="heart">Lungs</label>
                                    </div>
                                </div>
                            </div>

                             <div class="row mb-4">
    <div class="col-12 text-center">
        <input type="submit" class="btn btn-success text-center mb-1 py-2" value="Submit">
        <button type="button" class="btn btn-danger text-center mb-1 py-2" onclick="resetForm()">Reset</button>
    </div>
</div>
                        </form>
                                <%
                                    }
                                %>
                    </div>
                </div>

                <!-- Empty column on the right -->
            </div>
        </div>
        <!-- Add space at the bottom -->
        <div style="margin-bottom: 20px;"></div>
    </div>
        <!-- Full Screen Search End -->


        <script>
        function resetForm() {
            document.getElementById("myform").reset();
        }
    </script>

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