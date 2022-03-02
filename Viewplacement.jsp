
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Placement</title>
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
            String place_name="",place_vanue="",place_date="",place_time="",place_logo="",place_details="";
            String stu=session.getAttribute("stu_id").toString();
            String in="select * from tbl_placement";
            ResultSet rs=con.selectCommand(in);
            
            
            if(request.getParameter("apply")!= null)
            {
                String apply=request.getParameter("apply");
                String st="insert into tbl_placeapply(stu_id,place_id)values('"+stu+"','"+apply+"')";
                boolean boo=con.executeCommand(st);
                if(boo==true)
                {%>
                    <script>alert("Applied ");window.location.replace("Viewplacement.jsp");</script><%
                }
                else
                {%>
                    <script>alert("failed");window.location.replace("Viewplacement.jsp");</script><%
                }
            }
            
        %>
        <br><br>
        <br><br>
    <center><h3>Placement Details</h3></center>
        
    <center>
        <%
            while(rs.next())
            {
                place_name=rs.getString("place_name");
                place_vanue=rs.getString("place_venue");
                place_date=rs.getString("place_date");
                place_time=rs.getString("place_time");
                
                place_logo=rs.getString("place_logo");
                place_details=rs.getString("place_details");
            
        %>
        <table class="coloro" width="50%" cellpadding="10">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><b>Placement Name:</b>&nbsp&nbsp</td>
                <td><%=place_name%><br></td>
            </tr>
            <tr>
                <td><b>Placement Venue:</b>&nbsp&nbsp</td>
                <td><%=place_vanue%><br></td>
            </tr>
            <tr>
                <td><b>Placement Date:</b>&nbsp&nbsp</td>
                <td><%=place_date%><br></td>
            </tr>
            <tr>
                <td><b>Placement Time:</b>&nbsp&nbsp</td>
                <td><%=place_time%><br></td>
            </tr>
            
            <tr>
                <td><b>Placement Logo:</b>&nbsp&nbsp</td>
                <td> <img src="../College/Placementlogo/<%=place_logo %>" width="100" height="100"><br></td>
            </tr>
            
            <tr>
                <td><b>Placement Details:</b>&nbsp&nbsp</td>
                <td><a href="../College/PlacementDetails/<%=place_details %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a><br></td>
            </tr>
            <tr>
                        <%
                        String se="select * from tbl_placeapply where stu_id='"+stu+"' and place_id='"+rs.getString("place_id")+"'";
                        ResultSet rs1=con.selectCommand(se);
                        if(rs1.next())
                        {
                           %>
                           <td colspan="2" align="center"><a href="Viewplacement.jsp?apply=<%=rs.getString("place_id")%>">Applied</a></td><%
                        }
                        else
                        {
                        %>
                        <td colspan="2" align="center"><a href="Viewplacement.jsp?apply=<%=rs.getString("place_id")%>">Click to Apply</a></td>
                        <%
                        }
                        %>
                    </tr>
        </table>
            <%
            }
            %>
    </center>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
