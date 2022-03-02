
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
            String prolang_name="";
            String prolang_id="";
            String hid="";
            if(request.getParameter("btn_submit")!= null)
            {
                prolang_name=request.getParameter("prolang_name");
                hid=request.getParameter("hid");
                if(hid.equals(""))
                {
                    String ins="insert into tbl_prolang (prolang_name) values ('"+prolang_name+"')";
                    boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("projectlang.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("projectlang.jsp");</script><%
                    }
                }
                else
                {
                    String upd="update tbl_prolang set prolang_name='"+prolang_name+"' where prolang_id='"+hid+"'";
                    boolean boo=con.executeCommand(upd);
                    response.sendRedirect("projectlang.jsp");
                }
        
            }
            //DELETEING
            
            if(request.getParameter("delete")!= null)
            {
                String delete=request.getParameter("delete");
                String del="delete from tbl_prolang where prolang_id='"+delete+"'";
                boolean bo=con.executeCommand(del);
                if(bo==true)
                {%>
                    <script>alert("Data Deleted");window.location.replace("projectlang.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("projectlang.jsp");</script><%
                }
           }   
            //--------UPDATE----------
            if(request.getParameter("update")!= null)
            {
                prolang_id=request.getParameter("update");
                String sel="select * from tbl_prolang where prolang_id='"+prolang_id+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                    prolang_name=rs.getString("prolang_name");
                }
           
            }
            %>
             <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
        <center>
        <h1>Project Language</h1>
        <br><br>
        <form>
            <table border="1">
                <tr>
                <th>Language Name :</th>
                <td><input type="hidden" name="hid" value="<%=prolang_id%>"/>
                    <input type="text" name="prolang_name"value="<%=prolang_name%>" required=""/></td></tr>
                 <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit"/> 
                        </td>
                </tr>
            </table>
        </form>
         <br><br> <br>
        <table border="2">
            <thead>
            <tr>
                 
                <th>Language id :</th>
                <th>Language name:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sel="select * from tbl_prolang";
            ResultSet rs=con.selectCommand(sel);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("prolang_name")%>
                <td>
                    <a href="projectlang.jsp?delete=<%=rs.getString("prolang_id")%>">Delete</a>
                    <a href="projectlang.jsp?update=<%=rs.getString("prolang_id")%>">update</a>
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
