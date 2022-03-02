
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
    </head>
    <body>
        <%
            String stu_name="";
            String stu_col="";
            String stu_dept="";
            
            
            String stu_id=request.getParameter("stu_id");
            String in="select * from tbl_student s inner join tbl_dept d on s.dept_id=d.dept_id inner join tbl_college c on s.col_id=c.col_id where stu_id='"+stu_id+"'";
            ResultSet rs=con.selectCommand(in);
            if(rs.next())
            {
                stu_name=rs.getString("stu_name");
                stu_col=rs.getString("col_name");
                stu_dept=rs.getString("dept_name");
                
            }
        %>
        <form method="POST" action="Adviewseminar.jsp">
            <input type="submit"name="col_back" value="Back"/>
        </form>
    <center>
        <h1>Student Profile</h1><br><br>
        <table>
            <tr>
                <td> Student Name :</td>
                <td><%=stu_name%><br></td>
            </tr>
            <tr>
                <td>College Name:</td>
                 <td><%=stu_col%><br></td>
            </tr>
            <tr>
                <td>Department:</td>
                 <td><%=stu_dept%><br></td>
            </tr>
            
        </table>
    </center>
    </body>
</html>
