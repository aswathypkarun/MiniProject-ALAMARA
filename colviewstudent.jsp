
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>

        <title>Alamara | View Student</title>
        <script src="../Jq/jquery.js"></script>
        
        <script>
function getloc(did)
{

  $.ajax({url: 'ajaxviewstu.jsp?stu_dept='+did,
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
            
          String col=session.getAttribute("col_id").toString();  
            
        %>
        <center>
        <br><br><br><br>

        <form method="post">
        <table>
            <tr>
                    <td>
                        Select Department Name : 
                    </td>
                    <td>
                        <select name="stu_dept" required="" onchange="getloc(this.value)">
                            <option value="">SELECT</option>
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
        
        <div id="sel"></div>
        </center>
        <br><br><br><br><br><br><br><br><br><br>
        
    <%@include file="Footer.jsp" %>
