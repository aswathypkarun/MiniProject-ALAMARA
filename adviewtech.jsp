
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View tech</title>
    </head>
    <body>
        <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>
        <br><br>
        <h1>Tech Fest Details</h1>
        <br><br>
        <table border="1">
            <thead>
            <tr>
            <th>No.</th>
            <th>Name</th>
            <th>College</th>
            <th>Date</th>
            <th>Time</th>
            <th>About</th>
            <th>Image</th></tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_tech t inner join tbl_college c on t.col_id=c.col_id";
            
            ResultSet rs=con.selectCommand(sele);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("tech_name")%>
                <td><%=rs.getString("col_name")%> 
                <td><%=rs.getString("tech_date")%>
                <td><%=rs.getString("tech_time")%>
                <td><%=rs.getString("tech_descrip")%>
                <td><img src="../College/Techfestimage/<%=rs.getString("tech_logo")%>"width="100" height="90">
                
            </tr>  
             <%
                    i++;
                    }
                   %>
            </tbody>
    </center>
    </body>
</html>
