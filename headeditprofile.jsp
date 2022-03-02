
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Alamara | Edit My Details </title>
    </head>
    <body>
        <%
            String head_name="";
            String head_email="";
            String head_contact="";
            
            String head=session.getAttribute("head_id").toString();
            String in="select * from tbl_collegehead where head_id='"+head+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                head_name=rs.getString("head_name");
                head_email=rs.getString("head_email");
                head_contact=rs.getString("head_contact");
            }
            
            if(request.getParameter("head_submit")!= null)
            {
                head_name=request.getParameter("head_name");
                head_email=request.getParameter("head_email");
                head_contact=request.getParameter("head_contact");
                
                String sel="update tbl_collegehead set head_name='"+head_name+"',head_email='"+head_email+"',head_contact='"+head_contact+"' where head_id='"+head+"'";
                boolean boo=con.executeCommand(sel);
                System.out.println(boo);
                if(boo==true)
                    {%>
                     <script>alert("Data updated");window.location.replace("headhomepage.jsp");</script><%
                    }
                    else
                    {System.out.println(boo);
                     %>
                       <script>alert("failed");window.location.replace("headeditprofile.jsp");</script><%
                    }
            }
            
            %>
            
    <br><br><br>
        <center><h2>EDIT MY PROFILE</h2></center><br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>
                       Name
                    </td>
                    <td><input type="text" name="head_name" value="<%=head_name%>"/></td>  
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="head_email" value="<%=head_email%>"/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="head_contact" value="<%=head_contact%>"/></td>
                </tr>
                
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="head_submit"/>
                        <input type="Reset"name="head_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="Footer.jsp" %>
