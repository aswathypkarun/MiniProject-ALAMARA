<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Add Seminar</title>
    </head>
    <body>
        <%
           
            String stu_topic="",stu_descrp="";
            String stu=session.getAttribute("stu_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
               stu_topic=request.getParameter("sem_topic");
               stu_descrp=request.getParameter("sem_descrp");
               
            }
        %>
        <br><br><br><br><br>
    <center><h3>Add Your Seminar</h3></center><br><br>
    <center>
        <form method="POST" action="semuploadaction.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Seminar Topic</td>
                    <td><input type="text" name="sem_topic" required=""/></td>
                </tr>
                <tr>
                    <td>Seminar Description</td>
                    <td><textarea rows="6" cols="9" name="sem_descrp" required=""></textarea></td>
                </tr>
                <tr>
                    <td>Seminar Report</td>
                    <td><input type="file" name="sem_rep" /></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                            <br><br>
                        <input type="submit" name="btn_submit" value="Upload"/>
                        <input type="Reset" name="comp_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="Footer.jsp" %>
