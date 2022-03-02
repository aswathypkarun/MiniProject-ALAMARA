
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<jsp:useBean class="common_classes.mailconnection" id="obj"></jsp:useBean>
<%@include file="logheader1.jsp" %>
        <title>Student Registration</title>
    </head>
    <body>
    <%
        String stu_name="";
        String stu_gender="";
        String stu_contact="";
        String stu_email="";
        String stu_reg="";
        String stu_col="";
        String stu_dept="";
        String stu_user="";
        String stu_pass="";
        String head=session.getAttribute("head_id").toString();
        String in="select * from tbl_collegehead where head_id='"+head+"'";
        ResultSet rs=con.selectCommand(in);
        if(rs.next())
        {
            String co=rs.getString("col_id");
            session.setAttribute("co",co);
        }
        if(request.getParameter("btn_submit")!= null)
            {
                stu_name=request.getParameter("stu_name");
                stu_gender=request.getParameter("rad1");
                stu_contact=request.getParameter("stu_contact");
                stu_email=request.getParameter("stu_email");
                stu_reg=request.getParameter("stu_regno");
                stu_col=request.getParameter("stu_col");
                stu_dept=request.getParameter("stu_dept");
                stu_user=request.getParameter("stu_user");
                stu_pass=request.getParameter("stu_pass");
                String ins="insert into tbl_student(stu_name,stu_gender,stu_contact,stu_email,stu_register,col_id,dept_id,stu_username,stu_password) values('"+stu_name+"','"+stu_gender+"','"+stu_contact+"','"+stu_email+"','"+stu_reg+"','"+session.getAttribute("co").toString()+"','"+stu_dept+"','"+stu_user+"','"+stu_pass+"')";
                boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("studentreg.jsp");</script><%
                        
                        
                        String toAddress[]={stu_email};
                        System.out.println(toAddress);
                    String subject="Registration";
                    String text="Successfully Registered ";
                           obj.sendMail(toAddress, subject, text);
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("studentreg.jsp");</script><%
                    }
            }
        %>
        
        <br><br><br><br>
        <center>
        <form method="POST">
            <center> <h2>REGISTER YOUR STUDENT</h2> </center>
           <center>
            <table>
                
                <tr>
                    <td>
                        Student Name
                    </td>
                    <td><input type="text" name="stu_name" required=""/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>Male<input type="radio" name="rad1" value="male" required=""/>
                        Female<input type="radio" name="rad1" value="female" required=""/>
                        Other<input type="radio" name="rad1" value="other" required=""/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="stu_contact" required=""/></td>
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="stu_email" required=""/></td>
                </tr>
                <tr>
                    <td>Register No</td>
                    <td><input type="text" name="stu_regno" required=""/></td>
                </tr>
                
                <tr>
                    <td>Department Name</td>
                    <td>
                        <select name="stu_dept" required="">
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
                    <td>Username</td>
                    <td><input type="text" name="stu_user" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="stu_pass" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_submit" value="Register"/>
                        <input type="Reset" name="btn_reset"/>
                        </td>
                </tr>
            </table>
                        </center>
            <br><br><br><br>
        </form>
    </center>
    <%@include file="logfooter.jsp" %>
