
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Change Password</title>
    </head>
    <body>
        <%
            String comp_cupass="",comp_newpass="",comp_conpass="";
            String comp=session.getAttribute("comp_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
                comp_cupass=request.getParameter("comp_cupass");
                comp_newpass=request.getParameter("comp_newpass");
                comp_conpass=request.getParameter("comp_conpass");
                String in="select * from tbl_company where comp_password='"+comp_cupass+"' and comp_id='"+comp+"' ";
                ResultSet rs=con.selectCommand(in);
             
                if(rs.next())
                {
                    if(comp_newpass.equals(comp_conpass))
                    {
                        String ins1="update tbl_company set comp_password='"+comp_newpass+"'where comp_id='"+comp+"'";
                        boolean b=con.executeCommand(ins1);
                        if(b==true)
                        {%>
                            <script>alert("Password Changed");window.location.replace("companyhomepage.jsp");</script><%
                        }
                        else
                        {%>
                            <script>alert("Can't Change Password");window.location.replace("compchangepass.jsp");</script><%
                        }
                    }
                    else
                    {%>
                       <script>alert("Password doesnot match");window.location.replace("compchangepass.jsp");</script><%
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
        <center>
        <br><br>
        <form method="POST">
            <table >
                <tr>
                    <td>Current Password</td>
                     <td><input type="text" name="comp_cupass" required=""/></td>
                </tr>
                <tr>
                    <td>New Password</td>
                     <td><input type="text" name="comp_newpass" required=""/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                     <td><input type="text" name="comp_conpass" required=""/></td>
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
