
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Student Profile</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                background-color:aquamarine;
            }
            .div {
                    background-color: red;
                    color: white;
                    padding: 1em 1.5em;
                    text-decoration: none;
                    text-transform: uppercase;
                }

        /* Non-Demo Styles */
               .papa {
                    display: flex;
                    justify-content: right;
                    align-items: right;
                    height: 10vh;
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
        
    <br><br><br>
        <h1>Student Profile</h1><br><br>
        <div>
            <a class="papa" href="viewseminar.jsp">Back</a></div>
        <center>
        <table border="0" class="coloro" width="50%" cellpadding="10" >
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
    <br><br><br><br><br>
    <%@include file="Footer.jsp" %>
