
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("id")!=null){
                session.setAttribute("stid", request.getParameter("id"));
                session.setAttribute("semname", request.getParameter("semname"));
                session.setAttribute("semdesc", request.getParameter("semdesc"));
                
            }
        %>
        <form method="POST" action="Androidfileaction.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Seminar Report</td>
                    <td><input type="file" name="sem_rep" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="btn_submit"/>
                        <input type="Reset"name="comp_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </body>
</html>
