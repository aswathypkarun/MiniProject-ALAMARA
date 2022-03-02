
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<%@include file="Viewheader2.jsp" %>
        <title>View Seminar</title>
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
            .coloro123:hover{width:200px;height: 200px;}
        </style>
    </head>
    
    
    <body>
        <br><br><br><br>
        <%
            String sem_topic="";
            String sem_desc="";
            String sem_date="";
            String Sem_pdf="";
            String stu_id="";
            String in="select * from tbl_seminar";
            ResultSet rs=con.selectCommand(in);
            
            
        %>
        
    
        <%
            while(rs.next())
            {
                sem_topic=rs.getString("sem_name");
                sem_desc=rs.getString("sem_descrp");
                sem_date=rs.getString("sem_date");
                Sem_pdf=rs.getString("sem_pdf");
                stu_id=rs.getString("stu_id");
        %>
    <center>
        <table cellspaceing="10" cellpadding="10" class="coloro" >
            <tr>
                <td><br></td>
            </tr>
            <tr>
                
                <td colspan="2" align="center"><b><%=sem_topic%></b></td>
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
                <td><a href="../Student/semupload/<%=Sem_pdf %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a>(click here to download )<br></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><b><a class="coloro123" href="Colsemprofile.jsp?stu_id=<%=stu_id%>">Student Profile</a></b></td>
                <br>
            </tr>
        </table>
            <%
            }
            %>
    </center>
    <br><br><br><br>
    <%@include file="Footer.jsp" %>
