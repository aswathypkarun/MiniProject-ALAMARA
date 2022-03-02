<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Alamara | Reset Password</title>
    </head>
    <body>
        <%
            String head_cupass="",head_newpass="",head_conpass="";
            String head=session.getAttribute("head_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
                head_cupass=request.getParameter("head_cupass");
                head_newpass=request.getParameter("head_newpass");
                head_conpass=request.getParameter("head_conpass");
                String in="select * from tbl_collegehead where head_password='"+head_cupass+"' and head_id='"+head+"' ";
                ResultSet rs=con.selectCommand(in);
             
                if(rs.next())
                {
                    if(head_newpass.equals(head_conpass))
                    {
                        String ins1="update tbl_collegehead set head_password='"+head_newpass+"'where head_id='"+head+"'";
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
        
    
        <br><br>      <br><br>
    <center><h2>Head Change Password</h2></center>
      <br><br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>Current Password</td>
                     <td><input type="text" name="head_cupass" required=""/></td>
                </tr>
                <tr>
                    <td>New Password</td>
                     <td><input type="text" name="head_newpass" required=""/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                     <td><input type="text" name="head_conpass" required=""/></td>
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
    <br><br><br><br><br><br>
     <%@include file="Footer.jsp" %>
