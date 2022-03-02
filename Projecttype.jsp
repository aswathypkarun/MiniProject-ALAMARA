
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Type</title>
    </head>
    <body>
    <%
        String protype_name="";
        String protype_id="";
        String hid="";
        if(request.getParameter("btn_submit")!= null)
        {
         
            hid=request.getParameter("hid");
            protype_name=request.getParameter("protype_name");
            if(hid.equals(""))
            {
                String inst="insert into tbl_protype (protype_name) values('"+protype_name+"')";
                boolean b=con.executeCommand(inst);
                if(b==true)
                {%>
                    <script>alert("Data Inserted");window.location.replace("Projecttype.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("Projecttype.jsp");</script><%
                }
            }
            else
            {
                String upd="update tbl_protype set protype_name='"+protype_name+"' where protype_id='"+hid+"'";
                boolean boo=con.executeCommand(upd);
                response.sendRedirect("Projecttype.jsp");
            }
        }
        //Deleting
        
        
        if(request.getParameter("delete")!= null)
            {
                String delete=request.getParameter("delete");
                String del="delete from tbl_protype where protype_id='"+delete+"'";
                boolean bo=con.executeCommand(del);
                if(bo==true)
                {%>
                    <script>alert("Data Deleted");window.location.replace("Projecttype.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("Projecttype.jsp");</script><%
                }
           }
        
         //--------UPDATE----------
            if(request.getParameter("update")!= null)
            {
                protype_id=request.getParameter("update");
                String sel="select * from tbl_protype where protype_id='"+protype_id+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                    protype_name=rs.getString("protype_name");
                }
           
            }
            
        %>
         <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>
        <h1>Project Type </h1>
        <br><br><br>
        <form>
            <table border="2">
                
                <tr>
                    <td>Project Type Name</td>
                    <input type="hidden" name="hid" value="<%=protype_id%>"/>
                    <td><input type="text" name="protype_name" value='<%=protype_name%>' required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Insert"/>
                        </td>
                </tr>
            </table>
        </form>
        <br><br><br>
        <table border='2'>
            <thead>
            <tr>
               
                <th>Project id :</th>
                <th>Project Domain:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sel="select * from tbl_protype";
            ResultSet rs=con.selectCommand(sel);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("protype_name")%>
                <td>
                    <a href="Projecttype.jsp?delete=<%=rs.getString("protype_id")%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Projecttype.jsp?update=<%=rs.getString("protype_id")%>">update</a>
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

