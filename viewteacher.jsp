
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="editheader.jsp" %>
<title>Alamara | View Teachers</title>
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
    <body>
    <%
        String stat="0";
        String name="Pending Request";
        String col=session.getAttribute("col_id").toString();
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
    
       
          <center>      
        <br><br> <br><br>
        <h3><%=name%></h3>

            <br><br>
        <table border="1">
            <thead>
            <tr>
            <th>No.</th>
            <th>Name</th>
            <th>Department</th>
            <th>Gender</th>
            <th>Contact</th>
            <th>Email Id</th>
            <th>Designation</th></tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_collegehead h inner join tbl_dept d on h.dept_id=d.dept_id inner join tbl_designation de on h.desig_id=de.desig_id where head_status='"+stat+"' and col_id='"+col+"' ";
            
            ResultSet rs=con.selectCommand(sele);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("head_name")%>
                <td><%=rs.getString("dept_name")%> 
                <td><%=rs.getString("head_gender")%>
                <td><%=rs.getString("head_contact")%>
                <td><%=rs.getString("head_email")%>
                <td><%=rs.getString("desig_name")%>
                
            </tr>  
             <%
                    i++;
                    }
                   %>
            </tbody>
        </table> <br><br>
            <a href="viewteacher.jsp?acept=1">| Accepted request | </a>
            <a href="viewteacher.jsp?reject=2"> | Rejected request |</a>
    </center>
    <br><br><br><br><br><br><br><br>
    <%@include file="editfooter.jsp" %>
