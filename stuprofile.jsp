
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Header.jsp" %>
        <title>My Profile</title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
  background-color: #00d4ff;
  border-radius: 25px;
}
/*th{
    color:#fff!important;background-color:#FFA07A!important
}
td{
    color:#fff!important;background-color:#FFA07A!important
}*/

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//td:hover {background-color:#f44336;}
</style>
    </head>
    <body>
        <%
            String stu_name="";
            String stu_email="";
            String stu_contact="";
            String stu_gender="";
            String stu_col="";
            String stu_dept="";
            String stu_reg="";
            String stu=session.getAttribute("stu_id").toString();
            String in="select * from tbl_student s inner join tbl_college c on s.col_id=c.col_id inner join tbl_dept d on s.dept_id=d.dept_id where stu_id='"+stu+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                stu_name=rs.getString("stu_name");
                stu_email=rs.getString("stu_email");
                stu_contact=rs.getString("stu_contact");
                stu_gender=rs.getString("stu_gender");
                stu_col=rs.getString("col_name");
                stu_dept=rs.getString("dept_name");
            }
        %>
        
        
       
        <br><br><br>
        <h1>MY PROFILE</h1><br><br><br>
        <center>
        <table aligh="right">
            <tr>
                <td>Name Of Student:&nbsp&nbsp</td>
                <td><%=stu_name%><br></td>
            </tr>
            <tr>
                <td>Email Id:&nbsp&nbsp</td>
                <td><%=stu_email%><br></td>
            </tr>
            <tr>
                <td>Contact:&nbsp&nbsp</td>
                <td><%=stu_contact%><br></td>
            </tr>
            <tr>
                <td>Gender:&nbsp&nbsp</td>
                <td><%=stu_gender%><br></td>
            </tr>
            
            <tr>
                <td>College:&nbsp&nbsp</td>
                <td><%=stu_col%><br></td>
            </tr>
            <tr>
                <td>Department:&nbsp&nbsp</td>
                <td><%=stu_dept%><br></td>
            </tr>
        </table>
    </center>
    <%@include file="Footer.jsp" %>
