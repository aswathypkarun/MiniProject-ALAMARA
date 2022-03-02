
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
        String loc_name="";
        if(request.getParameter("btn_submit")!= null)
        {
            String op1=request.getParameter("op");
            loc_name=request.getParameter("loc_name");
            String inst="insert into tbl_location (dist_id,loc_name) values('"+op1+"','"+loc_name+"')";
            boolean b=con.executeCommand(inst);
            if(b==true)
            {%>
                <script>alert("Data Inserted");window.location.replace("location.jsp");</script><%
            }
            else
            {%>
                <script>alert("Failed");window.location.replace("location.jsp");</script><%
            }
        }
        %>
         <form method="POST" action="Adhomepage.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>
        <h1>Place ! </h1>
        <br><br><br>
        <form>
            <table border="2">
                <tr>
                    <td>State</td>
                    <td>
                        <select name="op">
                            <option value="">-----select-----</option>
                            <%
                                 String sel="select * from tbl_dist";
                                 ResultSet rs=con.selectCommand(sel);
                                 
                                 while(rs.next())
                                 {
                             %>
                             <option value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place Name</td>
                    <td><input type="text" name="loc_name" required=""/></td>
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
               
                <th>Location id :</th>
                <th>District Name:</th>
                <th>Location Name:</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_location l inner join tbl_dist d on l.dist_id=d.dist_id";
            ResultSet rss=con.selectCommand(sele);
            int i=1;
            while(rss.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rss.getString("dist_name")%>
                <td><%=rss.getString("loc_name")%>
                <td>
                    <a href="location.jsp?delete=<%=rss.getString("loc_id")%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="location.jsp?update=<%=rss.getString("loc_id")%>">update</a>
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
