
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Alamara | View Applied Student</title>
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
        
        <%
        String col=session.getAttribute("col_id").toString();
        %>
        
        <br><br><br><br>
    <center><h3>Applied Students List</h3></center>
        <center>
        <br><br><br><br>
        <table border="1">
            <thead>
            <tr>
            <th>No.</th>
            <th>Name</th>
            <th>College</th>
            <th>Applied tech</th>
            <th>Date</th>
            <th>Time</th>
            <th>About</th>
            <th>Image</th></tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_student s inner join tbl_college c on s.col_id=c.col_id inner join tbl_techapply ta on s.stu_id=ta.stu_id inner join tbl_tech t on ta.tech_id=t.tech_id where c.col_id='"+col+"' ";
            
            ResultSet rs=con.selectCommand(sele);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("stu_name")%>
                <td><%=rs.getString("col_name")%> 
                <td><%=rs.getString("tech_name")%> 
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
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
