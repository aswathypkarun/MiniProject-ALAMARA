

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="headheader.jsp" %>
        
        <title>Alamara | Staff Registration</title>
    
    <body>
    <%
        String head_name="",head_gender="",head_contact="",head_colname="",head_dept="",head_desig="",head_user="",head_pass="";
        String head_email="";
        if(request.getParameter("btn_submit")!= null)
            {
                head_name=request.getParameter("head_name");
                head_gender=request.getParameter("rad1");
                head_contact=request.getParameter("head_contact");
                head_email=request.getParameter("head_email");
                head_colname=request.getParameter("op");
                head_dept=request.getParameter("op1");
                head_desig=request.getParameter("op2");
                head_user=request.getParameter("head_user");
                head_pass=request.getParameter("head_pass");
                String ins="insert into tbl_collegehead(head_name,head_gender,head_contact,head_username,head_password,col_id,dept_id,desig_id,head_email)values('"+head_name+"','"+head_gender+"','"+head_contact+"','"+head_user+"','"+head_pass+"','"+head_colname+"','"+head_dept+"','"+head_desig+"','"+head_email+"')";
                boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Registration Successfull");window.location.replace("../guest/login.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("collegeheadreg.jsp");</script><%
                    }
            }
        %>
    <br><br>
  
    <br><br><br><br>
        <center>
        <form method="POST">
            <table >
                <thead align="center"><h3>Staff Registration</h3></thead>
                <tr>
                    <td>
                         Name :
                    </td>
                    <td><input type="text" name="head_name" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>Male <input type="radio" name="rad1" value="male" required="" />
                         Female <input type="radio" name="rad1" value="female" required=""/>
                         Other <input type="radio" name="rad1" value="other" required=""/></td>
                </tr>
                <tr>
                    <td>Contact :</td>
                    <td><input type="text" name="head_contact" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Email Id:</td>
                    <td><input type="email" name="head_email" autocomplete="off"  required=""/></td>
                </tr>
                <tr>
                    <td>College Name :</td>
                    <td>
                        <select name="op" required="">
                            <option value="" required="">-----select-----</option>
                            <%
                                 String sel="select * from tbl_college";
                                 ResultSet rs=con.selectCommand(sel);
                                 
                                 while(rs.next())
                                 {
                             %>
                             <option value="<%=rs.getString("col_id")%>"><%=rs.getString("col_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department Name :</td>
                    <td>
                        <select name="op1" required="">
                            <option value="" required="">-----select-----</option>
                            <%
                                 String sel1="select * from tbl_dept";
                                 ResultSet rs1=con.selectCommand(sel1);
                                 
                                 while(rs1.next())
                                 {
                             %>
                             <option value="<%=rs1.getString("dept_id")%>"><%=rs1.getString("dept_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                       Designation Name :
                    </td>
                    <td>
                        <select name="op2" required="">
                            <option value="">-----select-----</option>
                            <%
                                 String sel2="select * from tbl_designation";
                                 ResultSet rs2=con.selectCommand(sel2);
                                 
                                 while(rs2.next())
                                 {
                             %>
                             <option value="<%=rs2.getString("desig_id")%>"><%=rs2.getString("desig_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="head_user" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="head_pass"  required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Register"/>
                        <input type="Reset" name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
                           <br><br><br><br>
    </center>
    <%@include file="logfooter.jsp" %>
