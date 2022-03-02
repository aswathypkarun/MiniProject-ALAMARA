
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Edit Profile </title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
  
}
/*th{
    color:#fff!important;background-color:#FFA07A!important
}
td{
    color:#fff!important;background-color:#FFA07A!important
}*/

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

td:hover {background-color:#f44336;}
</style>
    </head>
    <body>
        <%
            String comp_name="";
            String comp_email="";
            String comp_contact="";
            String comp_licno="";
            String comp=session.getAttribute("comp_id").toString();
            String in="select * from tbl_company where comp_id='"+comp+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                comp_name=rs.getString("comp_name");
                comp_email=rs.getString("comp_email");
                comp_contact=rs.getString("comp_contact");
                comp_licno=rs.getString("comp_licno");
            }
            
            if(request.getParameter("comp_submit")!= null)
            {
                comp_name=request.getParameter("comp_name");
                comp_email=request.getParameter("comp_email");
                comp_contact=request.getParameter("comp_contact");
                comp_licno=request.getParameter("comp_licno");
                String sel="update tbl_company set comp_name='"+comp_name+"',comp_email='"+comp_email+"',comp_contact='"+comp_contact+"',comp_licno='"+comp_licno+"' where comp_id='"+comp+"'";
                boolean boo=con.executeCommand(sel);
                System.out.println(boo);
                if(boo==true)
                    {%>
                     <script>alert("Data updated");window.location.replace("companyhomepage.jsp");</script><%
                    }
                    else
                    {System.out.println(boo);
                     %>
                       <script>alert("failed");window.location.replace("companyeditprofile.jsp");</script><%
                    }
            }
            
            %>
            
    <br><br><br>
        <h1>EDIT PROFILE</h1><br><br><br>
        <center>
        <form method="POST">
            <table>
                <tr>
                    <td>
                        Company Name
                    </td>
                    <td><input type="text" name="comp_name" value="<%=comp_name%>"/></td>  
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="comp_email" value="<%=comp_email%>"/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="comp_contact" value="<%=comp_contact%>"/></td>
                </tr>
                <tr>
                    <td>License No</td>
                    <td><input type="text" name="comp_licno" value="<%=comp_licno%>"/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="comp_submit"/>
                        <input type="Reset"name="comp_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="Footer.jsp" %>
