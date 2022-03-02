
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>View Student</title>
        <script src="../Jq/jquery.js"></script>
        <script>
function getloc(did)
{

  $.ajax({url: 'Ajaxviewstudent.jsp?stu_dept='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#sel').html(data);
  },
  });

}
</script>
    </head>
    <body>
        <%
            
          String head=session.getAttribute("head_id").toString();  
            
        %>
        <br><br>
        <h1>Pls Select Department</h1>
        <br><br>
    <center>
        <form method="post">
        <table>
            <tr>
                    <td>Department Name</td>
                    <td>
                        <select name="stu_dept" required="" onchange="getloc(this.value)">
                            <option value="">-----select-----</option>
                            <%
                                 String sel1="select * from tbl_dept";
                                 ResultSet rs1=con.selectCommand(sel1);
                                 
                                 while(rs1.next())
                                 {
                             %>
                             <option value="<%=rs1.getString("dept_id")%>"><%=rs1.getString("dept_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                
        </table>
        </form>
    </center>
                        <div id="sel"></div>
                        <br><br><br><br><br><br>
     <%@include file="Footer.jsp" %>
