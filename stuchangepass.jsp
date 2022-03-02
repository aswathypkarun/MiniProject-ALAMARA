
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Change Password</title>
    </head>
    <body>
        <%
            String stu_cupass="",stu_newpass="",stu_conpass="";
            String stu=session.getAttribute("stu_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
                stu_cupass=request.getParameter("stu_cupass");
                stu_newpass=request.getParameter("stu_newpass");
                stu_conpass=request.getParameter("stu_conpass");
                String in="select * from tbl_student where stu_password='"+stu_cupass+"' and stu_id='"+stu+"' ";
                ResultSet rs=con.selectCommand(in);
             
                if(rs.next())
                {
                    if(stu_newpass.equals(stu_conpass))
                    {
                        String ins1="update tbl_student set stu_password='"+stu_newpass+"'where stu_id='"+stu+"'";
                        boolean b=con.executeCommand(ins1);
                        if(b==true)
                        {%>
                            <script>alert("Password Changed");window.location.replace("stuchangepass.jsp");</script><%
                        }
                        else
                        {%>
                            <script>alert("Can't Change Password");window.location.replace("stuchangepass.jsp");</script><%
                        }
                    }
                    else
                    {%>
                       <script>alert("Password doesnot match");window.location.replace("stuchangepass.jsp");</script><%
                    }
                }
                else
                {%>
                    <script>alert("Incorrect Current Password");window.location.replace("compchangepass.jsp");</script><%
                }
            }   
                
            %>
        
    
        <br><br>
        <h1>Change Password</h1>
        <br><br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>Current Password</td>
                     <td><input type="text" name="stu_cupass" required=""/></td>
                </tr>
                <tr>
                    <td>New Password</td>
                     <td><input type="text" name="stu_newpass" required=""/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                     <td><input type="text" name="stu_conpass" required=""/></td>
                </tr>
                <tr>
                    
                        <td colspan="2" align="center">
                            <br>
                        <input type="submit"name="btn_submit"/>
                        <input type="Reset"name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>    
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
