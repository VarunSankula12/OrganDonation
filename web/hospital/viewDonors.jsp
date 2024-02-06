<%@page import="com.codebook.Hospital.hospitalDao"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Hospital </title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Favicon icon -->
      <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
      
      <style>
          .welcome-heading {
    background-color: #007bff; /* Choose your desired background color */
    color: #ffffff; /* Choose your desired text color */
    padding: 15px;
    border-radius: 10px;
  }
      </style>
      <style>
        /* Add your custom styles here */
        body {
            background-color: #f4f7fa;
        }

        .login-container {
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            margin-top: 50px;
        }

        .form-control {
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .custom-dropdown {
            border-radius: 5px;
        }

        .mb-0 {
            margin-bottom: 0;
        }

        /* Additional styling for better visual appeal */
        .welcome-heading {
            background-color: #007bff;
            color: #ffffff;
            padding: 15px;
            border-radius: 10px;
        }
        
    </style>
  </head>

  <body>
      
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">

                    <div class="navbar-logo">
                        <a class="mobile-menu" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="index.html">
                            <img class="img-fluid" src="assets/images/logo (1).png" height="200" width="100" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>

                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            
                            <li class="user-profile header-notification">
                                <a href="#!">
                                    <img src="assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                    <span>Hospital</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li>
                                        <a href="../index.html">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Organ Donation</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="active">
                                    <a href="hospital-dashboard.jsp">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Donor Management</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="registered-donors.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Registered Donors</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="available-donors.jsp">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Available Donors</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            
                        </div>
                    </nav>
                    
    
     <div class="container">
        <!-- Add space at the top -->
        <div style="margin-top: 80px;"></div>

        <!-- Add a new container for the login section -->
        <div class="login-container" id="login-container">
            <div class="row g-5 justify-content-center align-items-center">
                <!-- Login form in the center -->
                <div class="col-lg-8">
                    <div class="card p-4 shadow">
                        <h3 class="mb-4">User Registration Details</h3>
                        <%
            String email=request.getParameter("email");
            String query="SELECT * FROM donation WHERE email='"+email+"'";
            ResultSet rs=hospitalDao.Retrieve(query);
            if(rs.next()){
    %>
    <form action="viewDonorAction.jsp" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm">

                             <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Full Name</h6>
                    </label>
                    <input type="text" name="name" id="name" value="<%=rs.getString("name")%>" class="form-control"readonly>
                </div>
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Self Disease</h6>
                    </label>
                    <input type="text" name="self" id="self" value="<%=rs.getString("selfdisease")%>" class="form-control"readonly>
                </div>
                
            </div>
            <!-- Add similar rows for other fields (Mobile, Gender, Address, Date of Birth, Password, Confirm Password, Profile Pic) -->

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="mb-0">
                        <h6 class="mb-0 text-sm">Email</h6>
                    </label>
                    <input type="text" name="email" id="email" value="<%=email%>" class="form-control" readonly>
                </div>
               <div class="col-md-6">
        <label class="mb-0">
            <h6 class="mb-0 text-sm">Gender</h6>
        </label><br>
        <select class="form-select custom-dropdown w-100 py-1" name="gender" id="gender" readonly>
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
                                        <h6 class="mb-0 text-sm">Date of Birth</h6>
                                    </label>
                                    <input type="date" name="dob" id="dob" value="<%=rs.getString("dob")%>" class="form-control" readonly>
                                </div>
                                 <div class="col-md-6">
                                    <label class="mb-0">
                                        <h6 class="mb-0 text-sm">Fitness Status</h6>
                                    </label>
                                    <select class="form-select custom-dropdown w-100 py-1" name="fitness_status" id="fitness_status">
                                        <option value="<%=rs.getString("status")%>" selected><%=rs.getString("status")%></option>
                                        <option value="Fit">Fit</option>
                                        <option value="Unfit">Unfit</option>
                                        <option value="Under Test">Under Test</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Your existing form fields -->

                            <div class="row mb-4">
                                <div class="col-12 text-center">
                                    <input type="submit" class="btn btn-primary py-2" value="Submit">
                                </div>
                            </div>
                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

      <!-- Add space at the bottom -->
      <div style="margin-bottom: 20px;"></div>
    </div>
</div>
        </div>
    </div>
    </div>
<!-- Required Jquery -->
<script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="assets/pages/widget/amchart/amcharts.min.js"></script>
<script src="assets/pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="assets/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="assets/js/script.js"></script>
<script type="text/javascript " src="assets/js/SmoothScroll.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>
</body>

</html>
