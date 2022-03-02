
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
        <br><br>
    <center>
        <%
            String stu_col="";
            stu_col=request.getParameter("stu_col");
            
            String de="select st.dept_id,d.dept_name from tbl_student st inner join tbl_dept d on st.dept_id=d.dept_id where st.col_id='"+stu_col+"' GROUP by st.dept_id ";
            ResultSet rs=con.selectCommand(de);
            while(rs.next())
            {
                String s=rs.getString("dept_name");%><br>
                <h1><%out.println(s);%></h1>
                
               
            <table border="1">
                <thead>
                <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Department</th>
                <th>Gender</th>
                <th>Contact</th>
                <th>Email Id</th>
                <th>Resister no</th></tr>
                </thead>
                <tbody>
                <%
                    
                    String ins="select * from tbl_student st inner join tbl_dept de on st.dept_id=de.dept_id where st.col_id='"+stu_col+"' and st.dept_id='"+rs.getString("dept_id")+"'";
                    ResultSet rs2=con.selectCommand(ins);
                    
                int i=1;
                while(rs2.next())
                {
                %>
                <tr>
                    <td><%=i%></td>
                
                    <td><%=rs2.getString("stu_name")%>
                    <td><%=rs2.getString("dept_name")%> 
                    <td><%=rs2.getString("stu_gender")%>
                    <td><%=rs2.getString("stu_contact")%>
                    <td><%=rs2.getString("stu_email")%>
                    <td><%=rs2.getString("stu_register")%>
                
                </tr>  
                <%
                    i++;
                    }
                   %>
            </tbody>
            <br>
        </table>
            <%
               
            }%>
    </center>
    </body>
</html>
