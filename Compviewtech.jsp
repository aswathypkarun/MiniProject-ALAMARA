
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>View tech</title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
}
thead{
    color:#fff!important;background-color:#f44336!important
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//tr:hover {background-color:#f5f5f5;}
</style>
    </head>
    <body>
        
        <center>  
        <br><br><br><br>
        <h3>Tech Fest Details</h3>
        <br><br><br>
  
        <table >
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
            String sele="select * from tbl_tech t inner join tbl_college c on t.col_id=c.col_id where   curdate() <= t.tech_date";
            
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
        </table>
    </center>
     <%@include file="Footer.jsp" %>
