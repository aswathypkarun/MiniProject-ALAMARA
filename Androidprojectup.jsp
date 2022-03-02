
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
                session.setAttribute("proname", request.getParameter("proname"));
                session.setAttribute("prodesc", request.getParameter("prodesc"));
                session.setAttribute("prolang", request.getParameter("prolang"));
                session.setAttribute("protype", request.getParameter("protype"));
                
            }
        %>
       <form method="POST" action="Androidprojectuploadaction.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Project Logo</td>
                    <td><input type="file" name="pro_logo" required=""/></td>
                </tr>
                <tr>
                    <td>Project file</td>
                    <td><input type="file" name="pro_file" required=""/></td>
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
