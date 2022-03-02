
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
}
thead{
    color:#fff!important;background-color:#f44336!important
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//tr:hover {background-color:#f5f5f5;}
</style>
    </head>
    <body>
        <%
            String stu_dept="";
            stu_dept=request.getParameter("stu_dept");
            String col=session.getAttribute("col_id").toString();
            String in="select * from tbl_dept where dept_id='"+stu_dept+"'";
            ResultSet rs=con.selectCommand(in);
            rs.next();
                
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
                    
                    String ins="select * from tbl_student st inner join tbl_dept de on st.dept_id=de.dept_id where st.col_id='"+col+"' and st.dept_id='"+stu_dept+"'";
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
    </body>
</html>
