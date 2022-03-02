<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<html lang="en">
    
<head>
  <meta charset="utf-8">
  <title>Alamara | Admin</title>
  <link rel = "icon" type = "image/png" href="img/Logopro2.png">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Facebook Opengraph integration: https://developers.facebook.com/docs/sharing/opengraph -->
  <meta property="og:title" content="">
  <meta property="og:image" content="">
  <meta property="og:url" content="">
  <meta property="og:site_name" content="">
  <meta property="og:description" content="">


  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700|Roboto:400,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">


</head>
    <body>
    <h1></h1>
    
      <!-- Header -->
  <header id="header">
    <div class="container">

      <nav id="nav-menu-container">
        <ul class="nav-menu">

          <li class="menu-has-children"><a href="#">Add Project Details</a>
          <ul>
              <li><a href="Projecttype.jsp">Project Type</a></li>
              <li><a href="projectlang.jsp">Project Language</a></li>
          </ul>
          <li class="menu-has-children"><a href="#">Manage Location</a>
            <ul>
              <li><a href="district.jsp">Add District</a></li>
              <li><a href="location.jsp">Add Place</a></li>  
            </ul>
          </li>
          <li class="menu-has-children"><a href="#">Manage Faculty Hierarchy</a>
            <ul>
              <li><a href="depart.jsp">Add Department</a></li>
              <li><a href="desig.jsp">Add Designation</a></li>  
            </ul>
          </li>
          <li class="menu-has-children"><a href="#">View</a>
            <ul>
              <li><a href="adviewproject.jsp">Project</a></li>
              <li><a href="Adviewseminar.jsp">Seminar</a></li> 
              <li><a href="adviewtech.jsp">Tech Fest</a></li>
              <li><a href="viewcollege.jsp">College</a></li>  
              <li><a href="viewstudent.jsp">Student</a></li>
              <li><a href="viewcompany.jsp">Company</a></li>  
              <li><a href="Adviewplacement.jsp">Placement Drive</a></li>
            </ul>
          </li>
          <li class="menu-has-children"><a href="#">Registration Status</a>
            <ul>
              <li><a href="acceptcollege.jsp">College</a></li>
              <li><a href="addcompany.jsp">Company</a></li>  
            </ul>
          </li>
          
          <li><a href="logout.jsp">Log Out</a></li>
        </ul>
      </nav>
    </div>
  </header>
  <!-- #header -->
    <section class="hero">
    <div class="container text-center">
      <div class="row">
          <div class="col-md-12">
              <h1 style="font-size:60px;color:white;text-shadow:3px 3px #007bff; font-weight: bold"><span style="color:white;font-weight: bold">Welcome ADMIN</span></h1>
        </div>
      </div>

      <div class="col-md-12">
        <h3>
            Let's Organize the Alamara
          </h3>

       
      </div>
    </div>

  </section>
   
  <footer class="site-footer">
    <div class="bottom">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-xs-12 text-lg-left text-center">
            <p class="copyright-text">
              ©Alamara
            </p>
            <div class="credits">

             Designed by <a href="https://bootstrapmade.com/">Alamara InfoTech</a>
            </div>
          </div>

          <div class="col-lg-6 col-xs-12 text-lg-right text-center">
            <ul class="list-inline">
              <li class="list-inline-item">
               <a href="../guest/Homepage.jsp">Home</a>
              </li>

            </ul>
          </div>

        </div>
      </div>
    </div>
  </footer> 
  
    <!-- Required JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/tether/js/tether.min.js"></script>
  <script src="lib/stellar/stellar.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/easing/easing.js"></script>
  <script src="lib/stickyjs/sticky.js"></script>
  <script src="lib/parallax/parallax.js"></script>
  <script src="lib/lockfixed/lockfixed.min.js"></script>

  <!-- Template Specisifc Custom Javascript File -->
  <script src="js/custom.js"></script>

  <script src="contactform/contactform.js"></script>
  
    </body>
</html>
