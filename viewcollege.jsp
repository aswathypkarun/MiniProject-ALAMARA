
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View</title>
    </head>
    <body>
    <%
        String stat="0";
        String name="VIEW COLLEGES";
        
        if(request.getParameter("acept")!= null)
            {
              stat="1";
              name="Accepted Request";
            }
        
        if(request.getParameter("reject")!= null)
            {
              stat="2";
              name="Rejected Request";
            }
        %>
    
        <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
        <center>
        <br><br>
        <h1><%=name%></h1>
        <table border="1">
            <thead>
            <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Email Id</th>
            <th>Contact</th>
            <th>Licence No</th>
            <th>Company Logo</th>
            <th>Location</th>
            <th>Year of Estabishment</th></tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_college c inner join tbl_location l on c.loc_id=l.loc_id where col_status='"+stat+"'";
            
            ResultSet rs=con.selectCommand(sele);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("col_name")%>
                <td><%=rs.getString("col_email")%> 
                <td><%=rs.getString("col_contact")%>
                <td><%=rs.getString("col_licno")%>
                <td><img src="../College/CollegeLogo/<%=rs.getString("col_logo")%>" width="100" height="90">
                <td><%=rs.getString("loc_name")%>
                <td><%=rs.getString("col_year")%>
            </tr>  
             <%
                    i++;
                    }
                   %>
            </tbody>
        </table> <br><br>
            <a href="viewcollege.jsp?acept=1">Accepted request</a>
            <a href="viewcollege.jsp?reject=2">Rejected request</a>
    </center>
    </body>
</html>
