
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
    </head>
    <body>
        <center>
        <br><br>
        <h1>Student Home page</h1>
        <br>
        <form method="POST" action="addseminar.jsp">
            <input type="submit"name="comp_edit" value="Add Seminar"/>
        </form>
        <br>
        <form method="POST" action="stuprofile.jsp">
            <input type="submit"name="comp_edit" value="My profile"/>
        </form>
        <br>
        <form method="POST" action="viewseminar.jsp">
            <input type="submit"name="my_sem" value="View All Seminar"/>
        </form>
        <br>
        <form method="POST" action="addproject.jsp">
            <input type="submit"name="my_sem" value="Add Project"/>
        </form>
        <br>
        <form method="POST" action="Viewproject.jsp">
            <input type="submit"name="my_sem" value="View Project"/>
        </form>
        <br>
        <form method="POST" action="stutech.jsp">
            <input type="submit"name="my_sem" value="Techfest Details"/>
        </form>
        
        <br>
        <form method="POST" action="Stuviewcompany.jsp">
            <input type="submit"name="my_sem" value="Company Details"/>
        </form>
        
        <br>
        <form method="POST" action="Viewplacement.jsp">
            <input type="submit"name="my_sem" value="Placement Details"/>
        </form>
        
    </center>
    </body>
</html>
