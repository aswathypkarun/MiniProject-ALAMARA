
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Header.jsp" %>
    <body>
        <%
            String col_name="";
            String col_email="";
            String col_contact="";
            String col_licno="";
            String col_year="";
            String col_logo="";
            String col=session.getAttribute("col_id").toString();
            String in="select * from tbl_college where col_id='"+col+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                col_name=rs.getString("col_name");
                col_email=rs.getString("col_email");
                col_contact=rs.getString("col_contact");
                col_licno=rs.getString("col_licno");
                col_year=rs.getString("col_year");
                col_logo=rs.getString("col_logo");
            }
        %>
       
        
    <center>
        <br><br><br><br>
          <center><h3>MY DETAILS</h3><br></center>
        <table align="center">
            <br><br>
            <tr>
                <td>Name Of College:&nbsp&nbsp</td>
                <td><%=col_name%><br></td>
            </tr>
            <tr>
                <td>Email Id:&nbsp&nbsp</td>
                <td><%=col_email%><br></td>
            </tr>
            <tr>
                <td>Contact:&nbsp&nbsp</td>
                <td><%=col_contact%><br></td>
            </tr>
            <tr>
                <td>License:&nbsp&nbsp</td>
                <td><%=col_licno%><br></td>
            </tr>
            <tr>
                <td>Year of established:&nbsp&nbsp</td>
                <td><%=col_year%><br></td>
            </tr>
            <tr>
                <td>College Logo:&nbsp&nbsp</td>
                <td><img src="CollegeLogo/<%=col_logo%>" width="100" height="100"><br></td>
            </tr>
        </table>
    </center>
       
     <%@include file="Footer.jsp" %>
