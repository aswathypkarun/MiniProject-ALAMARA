
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project View</title>
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
            String stu_name="";
            String stu_col="";
            String stu_dept="";
            String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="";
            String stu=session.getAttribute("stu_id").toString();
            String proj_id=request.getParameter("proj_id");
//            if(request.getParameter("sub")!= null)
//                    {
//                        proj_id=request.getParameter("sub");
//                    }
//            else
//            {
//                proj_id=request.getParameter("proj_id");
//            }
            String in="select * from tbl_project pr inner join tbl_protype pt on pr.protype_id=pt.protype_id inner join tbl_prolang pl on pr.prolang_id=pl.prolang_id inner join tbl_student s on pr.stu_id=s.stu_id inner join tbl_dept d on s.dept_id=d.dept_id inner join tbl_college c on s.col_id=c.col_id where proj_id='"+proj_id+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                stu_name=rs.getString("stu_name");
                stu_col=rs.getString("col_name");
                stu_dept=rs.getString("dept_name");
                
                pro_name=rs.getString("proj_name");
                pro_descrp=rs.getString("proj_descrp");
                pro_type=rs.getString("protype_name");
                pro_lang=rs.getString("prolang_name");
                pro_date=rs.getString("proj_date");
                pro_logo=rs.getString("proj_logo");
                pro_file=rs.getString("proj_file");
            }
        %>
        <form method="POST" action="Viewproject.jsp">
            <input type="submit"name="col_back" value="Back"/>
        </form>
    <center>
        <h1>Student Profile</h1><br><br>
        <table border="0" class="coloro" width="50%" cellpadding="10" >
            <tr>
                <td>
            <center><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="change_font"><%=pro_name%></i></b></center><br><br>
                    <b>Description&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_descrp%><br><br>
                    <b>Language&nbsp&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_lang%><br><br>
                    <b>Domain&nbsp&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_type%><br><br>
                    <b>Date Of Upload&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_date%><br><br>
                    <b>Publisher Name&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=stu_name%><br><br>
                    <b>Publisher College&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=stu_col%><br><br>
                    <b>Publisher Department&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=stu_dept%><br><br>
                </td>
                <td>
                    <img src="../Student/Projectlogo/<%=pro_logo%>" width="100" height="100"><br>
                </td>
            </tr>
            <tr>
                <td><b>Project File:</b>&nbsp&nbsp</td>
                <td><a href="../Student/Projectfile/<%=pro_file %>" download><img src="../Student/semupload/1200px-PDF_file_icon.svg.png" width="50" height="50"></a>(click here to download )<br></td>
            
            </tr>
        
        
    </center>
    </body>
</html>
