
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Alamara | Placement Drives</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                width: 600px;
                background-color:#23c2e1;
            }
            .coloro123{
                color: red;
                text-align: center;
                
            }
            
        </style>
    </head>
    <body>
        <%
            String place_name="",place_vanue="",place_date="",place_time="",place_logo="",place_details="";
            
            String in="select * from tbl_placement ORDER BY place_date DESC";
            ResultSet rs=con.selectCommand(in);
            
            
            
            
        %>
        
        
    
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
        <br><br><br><br>
    <center><h3>View Placement</h3></center>
        <br><br><br><br>
        <center>
        <table class="coloro" cellspacing="10" cellpadding="10">
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
                <td><a href="../College/PlacementDetails/<%=place_details %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a>(click here to download )<br></td>
            </tr>
            
        </table>
            <%
            }
            %>
    </center>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
