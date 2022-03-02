
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>View Student</title>
        <script src="../Jq/jquery.js"></script>
        <script>
function getloc(did)
{

  $.ajax({url: 'CompAjaxviewstudent.jsp?stu_dept='+did,
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
            
          //String head=session.getAttribute("head_id").toString();  
            
        %>
    <center>
        <br><br><br><br>
        <form method="post">
        <table align="center" style="width:80%">
            <tr align="center">
                <td align="right" style="width:30%">
                    Department Name : 
                </td>
                <td align="left" style="width:70%">
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
                          <br><br>  
    <div id="sel"></div>
    </center>
                 <br><br><br><br>       <br><br><br><br>
    <%@include file="Footer.jsp" %>
