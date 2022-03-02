
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>View tech</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                background-color:aquamarine;
            }
        </style>
    </head>
    <body>
        <%
            String stu=session.getAttribute("stu_id").toString();
            String sele="select * from tbl_tech t inner join tbl_college c on t.col_id=c.col_id where   curdate() <= t.tech_date";
            ResultSet rs=con.selectCommand(sele);
            
        if(request.getParameter("apply")!= null)
            {
                String apply=request.getParameter("apply");
                String st="insert into tbl_techapply(stu_id,tech_id)values('"+stu+"','"+apply+"')";
                boolean boo=con.executeCommand(st);
                if(boo==true)
                {%>
                    <script>alert("Applied ");window.location.replace("stutech.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("stutech.jsp");</script><%
                }
            }
        %>
        
    
        <br><br> <br><br>
    <center><h3>Tech Fest Details</h3></center>
       
        <center>
        <%
            
            while(rs.next())
            {
        %>
            
                <table border="0" class="coloro" width="50%" cellpadding="10" >
                    <tr>
                        <td>
                        <center><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="change_font"><%=rs.getString("tech_name")%></i></b></center><br><br>
                        <b>Description&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=rs.getString("tech_descrip")%><br><br>
                        <b>Date Of Conducting&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=rs.getString("tech_date")%><br><br>
                        <b>Time Of Conducting&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=rs.getString("tech_time")%><br><br>
                        <b>Date Of Conducting&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=rs.getString("tech_date")%><br><br>
                        <b>Venue Of Conducting&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=rs.getString("col_name")%><br><br>
                        </td>
                        <td>
                            <img src="../College/Techfestimage/<%=rs.getString("tech_logo")%>"width="100" height="100">
                        </td>
                    </tr>
                    <tr>
                        <%
                        String se="select * from tbl_techapply where stu_id='"+stu+"' and tech_id='"+rs.getString("tech_id")+"'";
                        ResultSet rs1=con.selectCommand(se);
                        if(rs1.next())
                        {
                           %>
                           <td colspan="2" align="center"><a href="stutech.jsp?apply=<%=rs.getString("tech_id")%>">Applied</a></td><%
                        }
                        else
                        {
                        %>
                        <td colspan="2" align="center"><a href="stutech.jsp?apply=<%=rs.getString("tech_id")%>">Click to Apply</a></td>
                        <%
                        }
                        %>
                    </tr>
                    
                </table>
            <br><br><br><br><br><br>
        <%
            }
        %>
    </center>
    <%@include file="Footer.jsp" %>
