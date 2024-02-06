<%@page import="com.codebook.admin.adminDao"%>
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
     <style>
        /* Add this style to change the color of the active link */
        #navigation li.active a {
            color: #ff0000; /* Change this to the desired color */
        }
        .card {
    transition: background-color 0.3s;
}

.card:hover {
    background-color: #3498db; /* Change this to the desired hover color (blue in this case) */
}

.card-title {
    font-weight: bold;
}
.icon-container {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px; /* Adjust this margin as needed */
}

    </style>
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
    </div>

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
                        <a href="user-dashboard.jsp" class="nav-item nav-link active">Dashboard</a>
                        <a href="DonateOrgan.jsp" class="nav-item nav-link">Donate Organ</a>
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
                <h1 class="text-white animated zoomIn">User Dashboard</h1>
                

                <!-- Breadcrumb with smaller size -->
                <nav aria-label="breadcrumb" class="small-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-white" href="user-dashboard.jsp">User</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page"><a  class="text-white" href="user-dashboard.jsp">User Dashboard</a></li>
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


        <section class="section-padding">
   <div class="container mt-5">
    <div class="row">
          <!-- First Card -->
<!-- First Card -->

<%
    String email=(String)session.getAttribute("email");
    int tot=0;
    String query="SELECT * FROM user";
    ResultSet rs=adminDao.Retrieve(query);
    while(rs.next()){
        tot++;
    }
    int pen=0;
    String query1="SELECT * FROM feedback";
    ResultSet rs1=adminDao.Retrieve(query1);
    while(rs1.next()){
        pen++;
    }
    int penf=0;
    String query2="SELECT * FROM feedback WHERE email='"+email+"'";
    ResultSet rs2=adminDao.Retrieve(query2);
    while(rs2.next()){
        penf++;
    }
    int pend=0;
    String query3="SELECT * FROM donation WHERE email='"+email+"'";
    ResultSet rs3=adminDao.Retrieve(query3);
    while(rs3.next()){
        pend++;
    }
%>

        <!-- First Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-info shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-info text-white rounded-circle mb-3">
                        <i class="fas fa-user fa-2x"></i>
                    </div>
                    <h5 class="card-title">Total Users</h5>
                    <p class="card-text h4"><%=tot%></p>
                </div>
            </div>
        </div>
        
        <!-- Second Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-warning shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-warning text-white rounded-circle mb-3">
                        <i class="far fa-file-alt fa-2x"></i>
                    </div>
                    <h5 class="card-title">My Donations</h5>
                    <p class="card-text h4"><%=pend%></p>
                </div>
            </div>
        </div>

        <!-- Third Card -->
<div class="col-md-3 mb-4">
    <div class="card border-success shadow h-100">
        <div class="card-body d-flex flex-column align-items-center">
            <div class="icon-container bg-success text-white rounded-circle mb-3">
                <i class="far fa-comments fa-2x"></i> <!-- Replaced with a different icon -->
            </div>
            <h5 class="card-title">My Feedbacks</h5>
            <p class="card-text h4"><%=penf%></p>
        </div>
    </div>
</div>


        <!-- Fourth Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-danger shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-danger text-white rounded-circle mb-3">
                        <i class="far fa-comment fa-2x"></i>
                    </div>
                    <h5 class="card-title">Total Feedbacks</h5>
                    <p class="card-text h4"><%=pen%></p>
                </div>
            </div>
        </div>

    </div>
</div>

</section>


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