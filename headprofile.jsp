
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Header.jsp" %>
<head>
        <title> Alamara | My Details</title>
        <style>
table {
  border-collapse: collapse;
  width: 70%;
}
/*th{
    color:#fff!important;background-color:#FFA07A!important
}
td{
    color:#fff!important;background-color:#FFA07A!important
}*/

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

//td:hover {background-color:#f44336;}
</style>
    </head>
    <body>
        <%
            String head_name="";
            String head_email="";
            String head_contact="";
            String head_gender="";
            String head_col="";
            String head_dept="";
            String head_desig="";
            String head=session.getAttribute("head_id").toString();
            String in="select * from tbl_collegehead h inner join tbl_college c on h.col_id=c.col_id inner join tbl_dept d on h.dept_id=d.dept_id inner join tbl_designation de on h.desig_id=de.desig_id where head_id='"+head+"'";
           System.out.println(in);
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                head_name=rs.getString("head_name");
                head_email=rs.getString("head_email");
                head_contact=rs.getString("head_contact");
                head_gender=rs.getString("head_gender");
                head_col=rs.getString("col_name");
                head_dept=rs.getString("dept_name");
                head_desig=rs.getString("desig_name");
            }
        %>
        
        <br><br><br>
    <center><h3>MY DETAILS</h3><br><br><br></center>
        <center>
        <table >
            <tr>
                <th>Name&nbsp&nbsp:</th>
                <td><%=head_name%><br></td>
            </tr>
            <tr>
                <th>Email Id&nbsp&nbsp:</th>
                <td><%=head_email%><br></td>
            </tr>
            <tr>
                <th>Contact&nbsp&nbsp:</th>
                <td><%=head_contact%><br></td>
            </tr>
            <tr>
                <th>Gender&nbsp&nbsp:</th>
                <td><%=head_gender%><br></td>
            </tr>
            <tr>
                <th>College Name&nbsp&nbsp:</th>
                <td><%=head_col%><br></td>
            </tr>
            <tr>
                <th>Designation Name&nbsp&nbsp:</th>
                <td><%=head_desig%><br></td>
            </tr>
            <tr>
                <th>Department Name&nbsp&nbsp:</th>
                <td><%=head_dept%><br></td>
            </tr>
        </table>
    </center>
    <br><br><br><br>
     <%@include file="Footer.jsp" %>
