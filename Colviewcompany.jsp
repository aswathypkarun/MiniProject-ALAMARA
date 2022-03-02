
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader3.jsp" %>
        <title>Alamara | View Company</title>
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
  font-weight:bold;
  border-bottom: 1px solid #ddd;
}

//tr:hover {background-color:#f5f5f5;}
</style>
    </head>
    <body>
    <%
        String stat="0";
        String name="List of Companies";
        
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
        <br><br><br><br>
        <h3><%=name%></h3>
        <br><br><br><br>
        <table>
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
            String sele="select * from tbl_company c inner join tbl_location l on c.loc_id=l.loc_id where comp_status='"+1+"'";
            
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
            
    </center>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>