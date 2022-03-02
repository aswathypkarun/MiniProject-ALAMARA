
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designation</title>
    </head>
    <body>
        <%
            String desig_name="";
            String desig_id="";
            String hid="";
            if(request.getParameter("btn_submit")!= null)
            {
                desig_name=request.getParameter("desig_name");
                hid=request.getParameter("hid");
                if(hid.equals(""))
                {
                    String ins="insert into tbl_designation (desig_name) values ('"+desig_name+"')";
                    boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("desig.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("desig.jsp");</script><%
                    }
                }
                else
                {
                    String upd="update tbl_designation set desig_name='"+desig_name+"' where desig_id='"+hid+"'";
                    boolean boo=con.executeCommand(upd);
                    response.sendRedirect("desig.jsp");
                }
        
            }
            //DELETEING
            
            if(request.getParameter("delete")!= null)
            {
                String delete=request.getParameter("delete");
                String del="delete from tbl_designation where desig_id='"+delete+"'";
                boolean bo=con.executeCommand(del);
                if(bo==true)
                {%>
                    <script>alert("Data Deleted");window.location.replace("desig.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("desig.jsp");</script><%
                }
           }   
            //--------UPDATE----------
            if(request.getParameter("update")!= null)
            {
                desig_id=request.getParameter("update");
                String sel="select * from tbl_designation where desig_id='"+desig_id+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                    desig_name=rs.getString("desig_name");
                }
           
            }
            %>
             <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
        <center>
        <h1>Head of Department Registration</h1>
        <br><br>
        <form>
            <table border="1">
                <tr>
                <th>Designation Name :</th>
                <td><input type="hidden" name="hid" value="<%=desig_id%>"/>
                    <input type="text" name="desig_name" value="<%=desig_name%>" required=""/></td></tr>
                 <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_submit" value="Add"/>
                        </td>
                </tr>
            </table>
        </form>
         <br><br> <br>
        <table border="2">
            <thead>
            <tr>
                 
                <th>Designation id :</th>
                <th>Designation name:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sel="select * from tbl_designation";
            ResultSet rs=con.selectCommand(sel);
            int i=1;
            while(rs.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("desig_name")%>
                <td>
                    <a href="desig.jsp?delete=<%=rs.getString("desig_id")%>">Delete</a>
                    <a href="desig.jsp?update=<%=rs.getString("desig_id")%>">update</a>
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
