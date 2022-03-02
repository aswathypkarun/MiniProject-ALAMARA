
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../Jq/jquery.js"></script>
        <script>
function getloc(did)
{

  $.ajax({url: 'ajaxview.jsp?stu_col='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#sell').html(data);
  },
  });

}
</script>
    </head>
    <body>
        <%
            
            
            
        %>
        <form method="POST" action="Adhomepage.jsp">
            <input type="submit"name="col_back" value="Back"/>
        </form>
        <form method="post">
            <center>
                <h1>Select The college</h1>
            </center>
        <table>
            <tr>
                    <td>College Name</td>
                    <td>
                        <select name="stu_col" required="" onchange="getloc(this.value)">
                            <option value="">-----select-----</option>
                            <%
                                 String sel1="select * from tbl_college";
                                 ResultSet rs1=con.selectCommand(sel1);
                                 
                                 while(rs1.next())
                                 {
                             %>
                             <option value="<%=rs1.getString("col_id")%>"><%=rs1.getString("col_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                
        </table>
        </form>
                        <div id="sell"></div>
    </body>
</html>
