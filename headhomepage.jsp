
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProjectHub Homepage</title>
    </head>
    <body>
    
    <center>
        <br><br>
        <h1>Home page</h1>
        <br>
        <form method="POST" action="headprofile.jsp">
            <input type="submit" name="comp_edit" value="My Profile"/>
        </form>
        <br>
        <form method="POST" action="../guest/studentreg.jsp">
            <input type="submit" name="sub" value="Register Student"/>
        </form>
        <br>
        <form method="POST" action="Headviewstudent.jsp">
            <input type="submit" name="sub" value="View Student"/>
        </form>
        
        <br>
        <form method="POST" action="headviewcompany.jsp">
            <input type="submit" name="sub" value="View Company"/>
        </form>
        
        <br>
        <form method="POST" action="Headviewseminar.jsp">
            <input type="submit" name="sub" value="View Seminar"/>
        </form>
        
        <br>
        <form method="POST" action="Headviewtech.jsp">
            <input type="submit" name="sub" value="View TechFest"/>
        </form>
        
        <br>
        <form method="POST" action="Headviewproject.jsp">
            <input type="submit" name="sub" value="View Project"/>
        </form>
        
        <br>
        <form method="POST" action="Headviewplacement.jsp">
            <input type="submit" name="sub" value="View Placement"/>
        </form>
    </center>
    </body>
</html>
