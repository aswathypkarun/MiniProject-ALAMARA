
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>



<%
    int Rating=0,id=0;
    String proj_id=request.getParameter("id");
    String col=session.getAttribute("col_id").toString();
    Rating=Integer.parseInt(request.getParameter("rating"));
    id=Integer.parseInt(request.getParameter("id"));
if(Rating!=0 && id!=0) {

//    String up="";
    String  up = "update tbl_project set proj_rating='"+Rating+"' where proj_id='"+proj_id+"'";
    con.executeCommand(up);
    
    String sel="select * from tbl_prorating where col_id='"+session.getAttribute("col_id")+"' and proj_id='"+proj_id+"'";
    ResultSet rs=con.selectCommand(sel);
    if(rs.next())
    {
       String upqry="update tbl_prorating set rat_value='"+Rating+"' where col_id='"+session.getAttribute("col_id")+"' and proj_id='"+proj_id+"'";
       con.executeCommand(upqry);
    }
    else
    {
    String  up1 = "insert into tbl_prorating(rat_value,proj_id,col_id)values('"+Rating+"','"+proj_id+"','"+session.getAttribute("col_id")+"')";
    con.executeCommand(up1);
    }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
