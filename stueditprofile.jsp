
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Edit Profile </title>
    </head>
    <body>
        <%
            String stu_name="";
            String stu_email="";
            String stu_contact="";
            String stu_gender="";
            
            String stu_dept="";
            String stu_reg="";
            String stu=session.getAttribute("stu_id").toString();
            String in="select * from tbl_student where stu_id='"+stu+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                stu_name=rs.getString("stu_name");
                stu_email=rs.getString("stu_email");
                stu_contact=rs.getString("stu_contact");
                stu_gender=rs.getString("stu_gender");
                //out.println("Gender"+stu_gender);
                
            }
            
            if(request.getParameter("stu_submit")!= null)
            {
                stu_name=request.getParameter("stu_name");
                stu_email=request.getParameter("stu_email");
                stu_contact=request.getParameter("stu_contact");
                stu_gender=request.getParameter("stu_gender");
                String sel="update tbl_student set stu_name='"+stu_name+"',stu_email='"+stu_email+"',stu_contact='"+stu_contact+"',stu_gender='"+stu_gender+"' where stu_id='"+stu+"'";
                boolean boo=con.executeCommand(sel);
                
                if(boo==true)
                    {%>
                     <script>alert("Data updated");window.location.replace("stueditprofile.jsp");</script><%
                    }
                    else
                    {System.out.println(boo);
                     %>
                       <script>alert("failed");window.location.replace("stueditprofile.jsp");</script><%
                    }
            }
            
            %>
            
    <br><br>
        <h1>EDIT PROFILE</h1><br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>
                        Student Name
                    </td>
                    <td><input type="text" name="stu_name" value="<%=stu_name%>"/></td>  
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="stu_email" value="<%=stu_email%>"/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="stu_contact" value="<%=stu_contact%>"/></td>
                </tr>
                
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="stu_submit"/>
                        <input type="Reset"name="stu_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="Footer.jsp" %>
