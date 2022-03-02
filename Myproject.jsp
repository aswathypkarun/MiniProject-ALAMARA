
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>My Project</title>
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
         String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="";
         String proj_id="";
            String stu=session.getAttribute("stu_id").toString();   
            
        %>
        
    <br><br><br>
        <center><h3>MY PROJECT!</h3></center>
        <center>
        
        <%
                                 
            String in="select * from tbl_project pr inner join tbl_protype pt on pr.protype_id=pt.protype_id inner join tbl_prolang pl on pr.prolang_id=pl.prolang_id where stu_id='"+stu+"'";
            ResultSet rs=con.selectCommand(in);
         
            while(rs.next())
            {
                pro_name=rs.getString("proj_name");
                pro_descrp=rs.getString("proj_descrp");
                pro_type=rs.getString("protype_name");
                pro_lang=rs.getString("prolang_name");
                pro_date=rs.getString("proj_date");
                pro_logo=rs.getString("proj_logo");
                pro_file=rs.getString("proj_file");
                proj_id=rs.getString("proj_id");
            
        %>
        
        <div id="colo">
            <table border="0" class="coloro" width="50%" cellpadding="10" >
            <tr>
                <td>
            <center><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="change_font"><%=pro_name%></i></b></center><br><br>
                    <b>Description&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_descrp%><br><br>
                    <b>Language&nbsp&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_lang%><br><br>
                    <b>Date Of Upload&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_date%><br><br>
                </td>
                <td>
                    <img src="../Student/Projectlogo/<%=pro_logo%>" width="100" height="100"><br>
                </td>
            </tr>
            <tr>
                <td><b>Project File:</b>&nbsp&nbsp</td>
                <td><a href="../Student/Projectfile/<%=pro_file %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a><br></td>
            </tr>
        </table>
                <br><br><br>
        </div>
        <div id="selid">
        
            <%
            }
            %>
        </div>
    </center>
    <br>
    <br>
    <br>
    <%@include file="Footer.jsp" %>
