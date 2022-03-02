
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>

<%@include file="Headerhome.jsp" %>
    <body>
    <center>
        <br><br>
        <h1>Home page</h1>
        <br>
        <form method="POST" action="myprofile.jsp">
            <input type="submit"name="col_edit" value="My Profile"/>
        </form>
       
        <br>
        <form method="POST" action="addhead.jsp">
            <input type="submit"name="col_submit" value="Pending Request "/>
        </form>
        
        <br>
        <form method="POST" action="viewteacher.jsp">
            <input type="submit"name="col_submit" value="View Status "/>
        </form>
        
        <br>
        <form method="POST" action="colviewstudent.jsp">
            <input type="submit"name="col_submit" value="View Student "/>
        </form>
        <br>
        <form method="POST" action="addtech.jsp">
            <input type="submit"name="col_submit" value="Conduct TechFest "/>
        </form>
        <br>
        <form method="POST" action="viewtech.jsp">
            <input type="submit"name="col_submit" value="OnGoing TechFest "/>
        </form>
        
        <br>
        <form method="POST" action="Colviewproject.jsp">
            <input type="submit"name="col_submit" value="View Project "/>
        </form>
        
        <br>
        <form method="POST" action="Colviewseminar.jsp">
            <input type="submit"name="col_submit" value="View Seminar "/>
        </form>
        
         <br>
        <form method="POST" action="Colviewcompany.jsp">
            <input type="submit"name="col_submit" value="View Company "/>
        </form>
         
         <br>
        <form method="POST" action="Coltechstudent.jsp">
            <input type="submit"name="col_submit" value="Applied Student "/>
        </form>
         
         <br>
        <form method="POST" action="Coladdplacement.jsp">
            <input type="submit"name="col_submit" value="Add Placement "/>
        </form>
         
         <br>
        <form method="POST" action="Colviewplacement.jsp">
            <input type="submit"name="col_submit" value="View Placement "/>
        </form>
    </center>
   <%@include file="Footerhome.jsp" %>
