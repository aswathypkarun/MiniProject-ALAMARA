
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
        <h1>Company Home page</h1>
        <br>
        <form method="POST" action="compprofile.jsp">
            <input type="submit"name="comp_edit" value="My Profile"/>
        </form>
        <br>
        <form method="POST" action="Compviewproject.jsp">
            <input type="submit"name="comp_edit" value="View Projects"/>
        </form>
        
        <br>
        <form method="POST" action="Compviewtech.jsp">
            <input type="submit"name="comp_edit" value="View Tech Fest"/>
        </form>
        
        <br>
        <form method="POST" action="Compviewseminar.jsp">
            <input type="submit"name="comp_edit" value="View Seminar"/>
        </form>
        
        <br>
        <form method="POST" action="Compviewstudent.jsp">
            <input type="submit"name="comp_edit" value="View Student"/>
        </form>
    </center>
    </body>
</html>
