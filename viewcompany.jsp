
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
        String name="Pending Request";
        
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
            <input type="submit"name="col_back" value="Back"/>
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
            <th>Lisecnce No</th>
            <th>Company Logo</th>
            <th>Location</th></tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_company c inner join tbl_location l on c.loc_id=l.loc_id where comp_status='"+stat+"'";
            
            ResultSet rs=con.selectCommand(sele);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("comp_name")%>
                <td><%=rs.getString("comp_email")%> 
                <td><%=rs.getString("comp_contact")%>
                <td><%=rs.getString("comp_licno")%>
                <td><img src="../Company/Companylogo/<%=rs.getString("comp_logo")%>" width="100" height="90">
                <td><%=rs.getString("loc_name")%>
                
            </tr>  
             <%
                    i++;
                    }
                   %>
            </tbody>
        </table> <br><br>
            <a href="viewcompany.jsp?acept=1">Accepted request</a>
            <a href="viewcompany.jsp?reject=2">Rejected request</a>
    </center>
    </body>
</html>
