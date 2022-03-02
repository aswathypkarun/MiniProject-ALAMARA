
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Seminar</title>
    </head>
    <body>
        <%
            String sem_topic="";
            String sem_desc="";
            String sem_date="";
            String Sem_pdf="";
            String stu_id="";
            String in="select * from tbl_seminar";
            ResultSet rs=con.selectCommand(in);
            
            
        %>
        <form method="POST" action="Adhomepage.jsp">
            <input type="submit"name="col_back" value="Back"/>
        </form>
    <center>
        <%
            while(rs.next())
            {
                sem_topic=rs.getString("sem_name");
                sem_desc=rs.getString("sem_descrp");
                sem_date=rs.getString("sem_date");
                Sem_pdf=rs.getString("sem_pdf");
                stu_id=rs.getString("stu_id");
        %>
        
        <table>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Seminar Topic:</b>&nbsp&nbsp</td>
                <td><%=sem_topic%><br></td>
            </tr>
            <tr>
                <td><b>Seminar Description:</b>&nbsp&nbsp</td>
                <td><%=sem_desc%><br></td>
            </tr>
            <tr>
                <td><b>Seminar date:</b>&nbsp&nbsp</td>
                <td><%=sem_date%><br></td>
            </tr>
            <tr>
                <td><b>Seminar Report:</b>&nbsp&nbsp</td>
                <td><a href="../Student/semupload/<%=Sem_pdf %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a><br></td>
            </tr>
            <tr>
                <td><b><a href="../Admin/Adsemprofile.jsp?stu_id=<%=stu_id%>">Student Profile</a></b></td>
                <br>
            </tr>
        </table>
            <%
            }
            %>
    </center>
    </body>
</html>
