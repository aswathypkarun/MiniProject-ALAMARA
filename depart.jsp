<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
    </head>
    <body>
        <%
            String dept_name="";
            String dept_id="";
            String hid="";
            if(request.getParameter("btn_submit")!= null)
            {
                dept_name=request.getParameter("dept_name");
                hid=request.getParameter("hid");
                if(hid.equals(""))
                {
                    String ins="insert into tbl_dept (dept_name) values ('"+dept_name+"')";
                    boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("depart.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("depart.jsp");</script><%
                    }
                }
                else
                {
                    String upd="update tbl_dept set dept_name='"+dept_name+"' where dept_id='"+hid+"'";
                    boolean boo=con.executeCommand(upd);
                    response.sendRedirect("depart.jsp");
                }
        
            }
            //DELETEING
            
            if(request.getParameter("delete")!= null)
            {
                String delete=request.getParameter("delete");
                String del="delete from tbl_dept where dept_id='"+delete+"'";
                boolean bo=con.executeCommand(del);
                if(bo==true)
                {%>
                    <script>alert("Data Deleted");window.location.replace("depart.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("depart.jsp");</script><%
                }
           }   
            //--------UPDATE----------
            if(request.getParameter("update")!= null)
            {
                dept_id=request.getParameter("update");
                String sel="select * from tbl_dept where dept_id='"+dept_id+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                    dept_name=rs.getString("dept_name");
                }
           
            }
            %>
            <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>  
        <h1>Department</h1>
        <br><br>
        <form method="POST">
            <table border="1">
                <tr>
                <th>Department Name :</th>
                <td><input type="hidden" name="hid" value="<%=dept_id%>"/>
                    <input type="text" name="dept_name"value="<%=dept_name%>" required=""/></td></tr>
                 <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Add" />
                        </td>
                </tr>
            </table>
        </form>
    <br><br>
        <table border="1">
            <thead>
            <tr>
                
                <th>Deptment id :</th>
                <th>Department name:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sel="select * from tbl_dept";
            ResultSet rs=con.selectCommand(sel);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("dept_name")%>
                <td>
                    <a href="depart.jsp?delete=<%=rs.getString("dept_id")%>">Delete</a>
                    <a href="depart.jsp?update=<%=rs.getString("dept_id")%>">update</a>
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
