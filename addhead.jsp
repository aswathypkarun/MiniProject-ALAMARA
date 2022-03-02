
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="editheader.jsp" %>
<title>Alamara | Approve Dean</title>
<style>
table {
  border-collapse: collapse;
  width: 70%;
}
thead{
    color:#fff!important;background-color:#f44336!important
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//tr:hover {background-color:#f5f5f5;}
</style>
    <%
        String col_name="";
        String col=session.getAttribute("col_id").toString();
        String sel="select * from tbl_college where col_id='"+col+"' ";
        ResultSet rs=con.selectCommand(sel);
        if(rs.next())
            {
                col_name=rs.getString("col_name");
            }
        if(request.getParameter("add")!= null)
            {
                String add=request.getParameter("add");
                String ad="update tbl_collegehead set head_status=1 where head_id='"+add+"'";
                boolean boo=con.executeCommand(ad);
                if(boo==true)
                {%>
                    <script>alert("Requested Accepted");window.location.replace("addhead.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("addhead.jsp");</script><%
                }
            }
        
        if(request.getParameter("reject")!= null)
            {
                String reject=request.getParameter("reject");
                String ad="update tbl_collegehead set head_status=2 where head_id='"+reject+"'";
                boolean boo=con.executeCommand(ad);
                if(boo==true)
                {%>
                    <script>alert("Requested Rejected");window.location.replace("addhead.jsp");</script><%
                }
                else
                {%>
                    <script>alert("Failed");window.location.replace("addhead.jsp");</script><%
                }
            }
        %>
            <center>   
    <br><br><br><br>
        <h3>Pending Requests</h3>

            <br><br><br>
        <table border='2'>
            <thead>
            <tr>
                <th>No.</th>
                <th>Head Name</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%
            String sele="select * from tbl_collegehead h inner join tbl_dept d on h.dept_id=d.dept_id inner join tbl_designation des on h.desig_id=des.desig_id where col_id='"+col+"' and head_status=0 ";
            
            ResultSet rs1=con.selectCommand(sele);
            int i=1;
            while(rs1.next())
            {
            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs1.getString("head_name")%>
                <td><%=rs1.getString("dept_name")%>  
                <td><%=rs1.getString("desig_name")%> 
                <td>
                    <a href="addhead.jsp?add=<%=rs1.getString("head_id")%>"><b><img src="img/accept.png" width="40" height="40"></b></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="addhead.jsp?reject=<%=rs1.getString("head_id")%>"><img src="img/reject.png" width="40" height="40"></a>
                </td>
            </tr>  
             <%
                    i++;
                    }
                   %>
             </tbody>
        </table>
    </center>
             <br><br><br><br><br><br><br><br><br><br>
    <%@include file="editfooter.jsp" %>
