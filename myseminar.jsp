
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>My Seminar</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                background-color:aquamarine;
            }
        </style>
    </head>
    <body>
        <%
            String sem_topic="";
            String sem_desc="";
            String sem_date="";
            String Sem_pdf="";
            String stu=session.getAttribute("stu_id").toString();
            String in="select * from tbl_seminar where stu_id='"+stu+"'";
            ResultSet rs=con.selectCommand(in);
            
            
        %>
        <br><br><br>
       <center><h3>MY SEMINAR!</h3></center>
    
        <%
            while(rs.next())
            {
                sem_topic=rs.getString("sem_name");
                sem_desc=rs.getString("sem_descrp");
                sem_date=rs.getString("sem_date");
                Sem_pdf=rs.getString("sem_pdf");
            
        %>
        <br>
        <center>
        <table border="0" class="coloro" width="50%" cellpadding="10">
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
        </table>
            <%
            }
            %>
    </center>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
