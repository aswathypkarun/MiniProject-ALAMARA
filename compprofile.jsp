
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Header.jsp" %>
        <title>My Profile</title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
  background-color: #00d4ff;
  border-radius: 25px;
}
/*th{
    color:#fff!important;background-color:#FFA07A!important
}
td{
    color:#fff!important;background-color:#FFA07A!important
}*/

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//td:hover {background-color:#f44336;}
</style>
    </head>
    <body>
        <%
            String comp_name="";
            String comp_email="";
            String comp_contact="";
            String comp_licno="";
            String comp_logo="";
            String comp=session.getAttribute("comp_id").toString();
            String in="select * from tbl_company where comp_id='"+comp+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                comp_name=rs.getString("comp_name");
                comp_email=rs.getString("comp_email");
                comp_contact=rs.getString("comp_contact");
                comp_licno=rs.getString("comp_licno");
                
                comp_logo=rs.getString("comp_logo");
            }
        %>
        
        
        
    <br><br><br>
        <h1>MY PROFILE</h1><br><br><br>
        <center>
        <table >
            <tr>
                <th>Name Of College:&nbsp&nbsp</th>
                <td><%=comp_name%><br></td>
            </tr>
            <tr>
                <th>Email Id:&nbsp&nbsp</th>
                <td><%=comp_email%><br></td>
            </tr>
            <tr>
                <th>Contact:&nbsp&nbsp</th>
                <td><%=comp_contact%><br></td>
            </tr>
            <tr>
                <th>License:&nbsp&nbsp</th>
                <td><%=comp_licno%><br></td>
            </tr>
            
            <tr>
                <th>Company Logo:&nbsp&nbsp</th>
                <td><img src="Companylogo/<%=comp_logo%>" width="100" height="100"><br></td>
            </tr>
        </table>
    </center>
    <br><br><br><br>
     <%@include file="Footer.jsp" %>
