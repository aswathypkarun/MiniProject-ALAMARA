<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Alamara | College Home</title>
  <link rel = "icon" type = "image/png" href = "img/Logopro2.png">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Facebook Opengraph integration: https://developers.facebook.com/docs/sharing/opengraph -->
  <meta property="og:title" content="">
  <meta property="og:image" content="">
  <meta property="og:url" content="">
  <meta property="og:site_name" content="">
  <meta property="og:description" content="">

  <!-- Twitter Cards integration: https://dev.twitter.com/cards/  -->
  
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
  <!-- Page Content
    ================================================== -->
  <!-- Hero -->
<% 
    String stuname="";
            stuname=session.getAttribute("stu_name").toString();
%>
  

  <!-- Header -->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <h2 style="font-size:50px;color:white;text-shadow:3px 3px #007bff; font-weight: bold">Alamara
        <sub style="font-size:15px;color:white;text-shadow:1px 1px #007bff; font-weight: bold">
                    Your One Safe Place To Find Projects
        </sub></h2>
        <!-- Uncomment below if you prefer to use a text image -->
        <!--<h1><a href="#hero">Bell</a></h1>-->
      </div>


      <nav id="nav-menu-container">
        <ul class="nav-menu">
            <li class="menu-has-children"><a href="#">My Ideas!</a>
            <ul>
              <li><a href="addproject.jsp">Add Project</a></li>
              <li><a href="addseminar.jsp">Add Seminar</a></li>
            </ul>
          </li>
          
          <li class="menu-has-children"><a href="#">View Details</a>
            <ul>
              <li><a href="Viewproject.jsp">View Project</a></li>
              <li><a href="viewseminar.jsp">View Seminar</a></li>
              <li><a href="stutech.jsp">View Tech Fest</a></li>
              <li><a href="Viewplacement.jsp">View Placement</a></li>
            </ul>
          </li>
          <li><a href="logout.jsp">Log Out</a></li>
        </ul>
      </nav>
      <!-- #nav-menu-container -->
      
          </div>
  </header>
  <!-- #header -->
  <%
    String c="";
    int c1=0;
    int c2=0;
    int c3=0;
    int c4=0;
    int sum=0;
        String s="select count(proj_id) as cunt from tbl_project";
        ResultSet rs=con.selectCommand(s);
        if(rs.next())
        {
            c=rs.getString("cunt");
        }
        
        String s1="select count(stu_id) as cunt1 from tbl_student";
        ResultSet rs1=con.selectCommand(s1);
        if(rs1.next())
        {
            c1=rs1.getInt("cunt1");
        }
        
        String s2="select count(col_id) as cunt2 from tbl_college;";
        ResultSet rs2=con.selectCommand(s2);
        if(rs2.next())
        {
            c2=rs2.getInt("cunt2");
        }
        
        String s3="select count(head_id) as cunt3 from tbl_collegehead";
        ResultSet rs3=con.selectCommand(s3);
        if(rs3.next())
        {
            c3=rs3.getInt("cunt3");
        }
        
        String s4="select count(comp_id) as cunt4 from tbl_company";
        ResultSet rs4=con.selectCommand(s4);
        if(rs4.next())
        {
            c4=rs4.getInt("cunt4");
        }
        sum=c1+c2+c3+c4;
        
%>
    <section class="hero">
    <div class="container text-center">
      <div class="row">
          <div class="col-md-12">
              <h1 style="font-size:60px;color:white;text-shadow:3px 3px #007bff; font-weight: bold"><span style="color:white;font-weight: bold">Welcome <a href="myprofile.jsp"> <%=stuname%></a></span></h1>
        </div>
      </div>

      <div class="col-md-12">
        <h3>
            Your Alamara Is Ready
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

  <!-- Template Specisifc Custom Javascript File -->
  <script src="js/custom.js"></script>

  <script src="contactform/contactform.js"></script>

</body>
</html>