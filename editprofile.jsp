
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>

<%@include file="editheader.jsp" %>
<title>Alamara | Edit Profile</title>
    <body>
        <%
            String col_name="";
            String col_email="";
            String col_contact="";
            String col_licno="";
            String col=session.getAttribute("col_id").toString();
            String in="select * from tbl_college where col_id='"+col+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                col_name=rs.getString("col_name");
                col_email=rs.getString("col_email");
                col_contact=rs.getString("col_contact");
                col_licno=rs.getString("col_licno");
            }
            
            if(request.getParameter("col_submit")!= null)
            {
                col_name=request.getParameter("col_name");
                col_email=request.getParameter("col_email");
                col_contact=request.getParameter("col_contact");
                col_licno=request.getParameter("col_licno");
                String sel="update tbl_college set col_name='"+col_name+"',col_email='"+col_email+"',col_contact='"+col_contact+"',col_licno='"+col_licno+"' where col_id='"+col+"'";
                boolean boo=con.executeCommand(sel);
                System.out.println(boo);
                if(boo==true)
                    {%>
                     <script>alert("Data updated");window.location.replace("Homepage.jsp");</script><%
                    }
                    else
                    {System.out.println(boo);
                     %>
                       <script>alert("failed");window.location.replace("editprofile.jsp");</script><%
                    }
            }
            
            %>
            <br><br><br>
            <br><br>
         
    <center><h3>MY DETAILS</h3></center>
        <br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>
                        College Name
                    </td>
                    <td><input type="text" name="col_name" value="<%=col_name%>"/></td>  
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="col_email" value="<%=col_email%>"/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="col_contact" value="<%=col_contact%>"/></td>
                </tr>
                <tr>
                    <td>License No</td>
                    <td><input type="text" name="col_licno" value="<%=col_licno%>"/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="col_submit"/>
                        <input type="Reset"name="col_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="editfooter.jsp" %>
