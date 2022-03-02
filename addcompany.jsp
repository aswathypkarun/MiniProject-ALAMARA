

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<jsp:useBean class="common_classes.mailconnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Request</title>
    </head>
    <body>
    <%
        if(request.getParameter("add")!= null)
            {
                String add=request.getParameter("add");
                String ad="update tbl_company set comp_status=1 where comp_id='"+add+"'";
                boolean boo=con.executeCommand(ad);
                if(boo==true)
                {
                     String se="select * from tbl_company where comp_id='"+add+"'";
                    ResultSet rs2=con.selectCommand(se);
                    rs2.next();
                        String toAddress[]={rs2.getString("comp_email")};
                    String subject="Registration";
                    String text="Company Registration have been Accepted ";
                           obj.sendMail(toAddress, subject, text);
    
    %>
                    <script>alert("Requested Accepted");window.location.replace("addcompany.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("addcompany.jsp");</script><%
                }
            }
        
        
        if(request.getParameter("reject")!= null)
            {
                String reject=request.getParameter("reject");
                String ad="update tbl_company set comp_status=2 where comp_id='"+reject+"'";
                boolean boo=con.executeCommand(ad);
                if(boo==true)
                {%>
                    <script>alert("Requested Rejected");window.location.replace("addcompany.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("addcompany.jsp");</script><%
                }
            }
        %>
        <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center><br><br>
        <h1>Request Status</h1><br><br>
        <table border='2'>
            <thead>
            <tr>
                <th>No.</th>
                <th>Company Name</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_company c inner join tbl_location l on c.loc_id=l.loc_id where comp_status=0 ";
            
            ResultSet rs1=con.selectCommand(sele);
            int i=1;
            while(rs1.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs1.getString("comp_name")%>
                <td><%=rs1.getString("loc_name")%>    
                <td>
                    <a href="addcompany.jsp?add=<%=rs1.getString("comp_id")%>">add</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="addcompany.jsp?reject=<%=rs1.getString("comp_id")%>">reject</a>
                </td>
            </tr>  
             <%
                    i++;
                    }
                   %>
             </tbody>
        </table>
    </center>
    </body>
</html>
