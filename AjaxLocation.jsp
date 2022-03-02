
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <option value="">--select--</option>
      <%
	  String did=request.getParameter("did");
	  String sel="select * from tbl_location where dist_id='"+did+"'";
	  ResultSet rs=con.selectCommand(sel);
                                
          while(rs.next())
          {
              %>
		 
                             <option value="<%=rs.getString("loc_id")%>"><%=rs.getString("loc_name")%></option>
                             <%
                              }
                             %>
                            
    </body>
</html>
