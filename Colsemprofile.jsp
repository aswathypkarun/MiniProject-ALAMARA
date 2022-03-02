
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader2.jsp" %>
        <title>Alamara | Student Profile</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                width: 600px;
                background-color:#23c2e1;
            }
            .coloro123{
                color: red;
                text-align: center;
                
            }
            
        </style>
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
                <center>
        <br><br><br><br>
        <h3>Student Profile</h3><br><br><br><br>

        <table class="coloro">
            <tr>
                <td><b> Student Name :</b></td>
                <td><%=stu_name%><br></td>
            </tr>
            <tr>
                <td><b>College Name:</b></td>
                 <td><%=stu_col%><br></td>
            </tr>
            <tr>
                <td><b>Department:</b></td>
                 <td><%=stu_dept%><br></td>
            </tr>
            
        </table>
    </center>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
