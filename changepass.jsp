
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="editheader.jsp" %>
<title>Change Password !</title>
        <%
            String col_cupass="",col_newpass="",col_conpass="";
            String col=session.getAttribute("col_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
                col_cupass=request.getParameter("col_cupass");
                col_newpass=request.getParameter("col_newpass");
                col_conpass=request.getParameter("col_conpass");
                String in="select * from tbl_college where col_password='"+col_cupass+"' and col_id='"+col+"' ";
                ResultSet rs=con.selectCommand(in);
             
                if(rs.next())
                {
                    if(col_newpass.equals(col_conpass))
                    {
                        String ins1="update tbl_college set col_password='"+col_newpass+"'where col_id='"+col+"'";
                        boolean b=con.executeCommand(ins1);
                        if(b==true)
                        {%>
                            <script>alert("Password Changed");window.location.replace("changepass.jsp");</script><%
                        }
                        else
                        {%>
                            <script>alert("Can't Change Password");window.location.replace("changepass.jsp");</script><%
                        }
                    }
                    else
                    {%>
                       <script>alert("Password doesnot match");window.location.replace("changepass.jsp");</script><%
                    }
                }
                else
                {%>
                    <script>alert("Incorrect Current Password");window.location.replace("changepass.jsp");</script><%
                }
            }   
                
            %>
        
   
    
    
        <br>
        <h1>Change Password</h1>
        <br>
        <br>
        <center>
        <form method="POST">
            <table >
                <tr>
                    <td>Current Password</td>
                     <td><input type="text" name="col_cupass" required=""/></td>
                </tr>
                
                
                <tr>
                    <td>New Password</td>
                     <td><input type="text" name="col_newpass" required=""/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                     <td><input type="text" name="col_conpass" required=""/></td>
                </tr>
                
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="btn_submit"/>
                        <input type="Reset"name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
            </center>
            <br><br><br><br>
     <%@include file="editfooter.jsp" %>