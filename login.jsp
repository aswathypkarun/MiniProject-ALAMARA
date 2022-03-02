<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="logheader.jsp" %>

    <body>
        <br><br><br><br><br><br>
        <%
            String log_user="";
            String log_pass="";
            if(request.getParameter("btn_submit")!= null)
            {
                log_user=request.getParameter("user");
                log_pass=request.getParameter("pass");
               
                
                String ins="select * from tbl_student where stu_username='"+log_user+"'";
                ResultSet rs=con.selectCommand(ins);
                
                 String ins1="select * from tbl_college where col_username='"+log_user+"'";
                 ResultSet rs1=con.selectCommand(ins1);
                 
                  String ins2="select * from tbl_collegehead where head_username='"+log_user+"'";
                  ResultSet rs2=con.selectCommand(ins2);
                  
                     String ins3="select * from tbl_company where comp_username='"+log_user+"'";
                     ResultSet rs3=con.selectCommand(ins3);
                     
                      String ins4="select * from tbl_admin where ad_username='"+log_user+"'";
                      ResultSet rs4=con.selectCommand(ins4);
               
                if(rs.next())
                    {
                           if(log_pass.equals(rs.getString("stu_password")))
                                {
                                    session.setAttribute("stu_id", rs.getString("stu_id"));
                                    session.setAttribute("stu_name", rs.getString("stu_name"));
        
                %>
                                    <script>alert("Login Successful");window.location.replace("../Student/Homepage.jsp");</script><%  
                                }
                            else
                                {%>
                                     <script>alert("Password entered is incorrect");window.location.replace("login.jsp");</script><% 
                                }
                    }
               
                
                
                else if(rs1.next())
                {
                   if(log_pass.equals(rs1.getString("col_password")))
                   {
                       if(rs1.getString("col_status").equals("1"))
                        {
                            session.setAttribute("col_id", rs1.getString("col_id"));
                                     session.setAttribute("col_name", rs1.getString("col_name"));%>
                            <script>alert("Login Successful");window.location.replace("../College/Homepage_1.jsp");</script><% 
                        }
                       else
                       {%>
                            <script>alert("Your registration request is in processing stage. Please try once your registration request is accepted");window.location.replace("login.jsp");</script><%
                           
                       }
                   }
                   else
                   {%>
                      <script>alert("Password entered is incorrect");window.location.replace("login.jsp");</script><% 
                   }
                }
                
                
                
               else if(rs2.next())
                {
                    if(rs2.getString("head_status").equals("1"))
                    {
                        if(log_pass.equals(rs2.getString("head_password")))
                        {
                            session.setAttribute("head_id", rs2.getString("head_id"));
                      session.setAttribute("head_name", rs2.getString("head_name"));%>
                            <script>alert("Login Successful");window.location.replace("../Collegehead/Homepage.jsp");</script><%  
                        }
                        else
                        {%>
                            <script>alert("Password entered is incorrect");window.location.replace("login.jsp");</script><% 
                        }
                    }
                    else
                        {%>
                            <script>alert("Your registration request is in processing stage. Please try once your registration request is accepted");window.location.replace("login.jsp");</script><% 
                        }
                }
               
               
               //Company
               else if(rs3.next())
                {
                   if(log_pass.equals(rs3.getString("comp_password")))
                   {
                       if(rs3.getString("comp_status").equals("1"))
                        {
                            session.setAttribute("comp_id", rs3.getString("comp_id"));
                            session.setAttribute("comp_name", rs3.getString("comp_name"));%>%>
                            
                            <script>alert("Login Successful");window.location.replace("../Company/Homepage.jsp");</script><% 
                        }
                       else
                       {%>
                            <script>alert("Your registration request is in processing stage. Please try once your registration request is accepted");window.location.replace("login.jsp");</script><%
                           
                       }
                   }
                   else
                   {%>
                      <script>alert("Password entered is incorrect");window.location.replace("login.jsp");</script><% 
                   }
                }
                   
                   //admin
                   
                else if(rs4.next())
                {
                   if(log_pass.equals(rs4.getString("ad_password")))
                   {
                       
                            %>
                            <script>alert("Login Successful");window.location.replace("../Admin/Adhomepage.jsp");</script><% 
                        
                       
                   }
                   else
                   {%>
                      <script>alert("Password entered is incorrect");window.location.replace("login.jsp");</script><% 
                   }
                }
                else
                {%>
                   <script>alert("Username entered doesnot exist");window.location.replace("login.jsp");</script><% 
                }
            }
            %>
            
    <center>
        <h1>LOGIN</h1>
        <form method="POST">
            <table cellspacing="20" cellpadding="10" >
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="user" required="" autocomplete="off"/></td>
                </tr>
                
                <tr>
                    
                    <td>Password</td>
                    <td><input type="password" name="pass" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_submit" value="LOGIN"/>
                        <input type="reset" name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <br><br><br><br>
   <%@include file="logfooter.jsp" %>
