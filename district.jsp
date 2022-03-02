
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String dist_name="";
        String dist_id="";
        String hid="";
        if(request.getParameter("btn_submit")!= null)
        {
            
            String dst_name=request.getParameter("dist_name");
            hid=request.getParameter("hid");
            if(hid.equals(""))
            {
                String inst="insert into tbl_dist (dist_name) values('"+dst_name+"')";
                boolean b=con.executeCommand(inst);
                if(b==true)
                {%>
                    <script>alert("Data Inserted");window.location.replace("district.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("district.jsp");</script><%
                }
            }
            else
            {
                String upd="update tbl_dist set dist_name='"+dst_name+"' where dist_id='"+hid+"'";
                boolean boo=con.executeCommand(upd);
                response.sendRedirect("district.jsp");
            }
        }
        
        //Deleting
        
        
        if(request.getParameter("delete")!= null)
            {
                String delete=request.getParameter("delete");
                String del="delete from tbl_dist where dist_id='"+delete+"'";
                boolean bo=con.executeCommand(del);
                if(bo==true)
                {%>
                    <script>alert("Data Deleted");window.location.replace("district.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("district.jsp");</script><%
                }
           }
        
        //--------UPDATE----------
            if(request.getParameter("update")!= null)
            {
                dist_id=request.getParameter("update");
                String sel="select * from tbl_dist where dist_id='"+dist_id+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                    dist_name=rs.getString("dist_name");
                }
           
            }
        %>
         <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>
        <h1>District </h1>
        <br><br><br>
        <form>
            <table border="2">
              
                <tr>
                    <td>District Name</td>
                    <input type="hidden" name="hid" value="<%=dist_id%>"/>
                    <td><input type="text" name="dist_name" value="<%=dist_name%>" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="btn_submit"/>
                        </td>
                </tr>
            </table>
        </form>
        <br><br><br>
        <table border='2'>
            <thead>
            <tr>
               
                <th>District id :</th>
                <th>District Name:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sel="select * from tbl_dist";
            ResultSet rs=con.selectCommand(sel);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("dist_name")%>
                <td>
                    <a href="district.jsp?delete=<%=rs.getString("dist_id")%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="district.jsp?update=<%=rs.getString("dist_id")%>">update</a>
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
