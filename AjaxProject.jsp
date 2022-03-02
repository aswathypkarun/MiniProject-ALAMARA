
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
 <%
         String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="";
         String proj_id="";                         
            String in="select * from tbl_project pr inner join tbl_protype pt on pr.protype_id=pt.protype_id inner join tbl_prolang pl on pr.prolang_id=pl.prolang_id where pr.prolang_id='"+request.getParameter("lid")+"'";
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
                <td colspan="2" align="center"><a href="Projectprofile.jsp?proj_id=<%=proj_id%>">Click Here for More Details</a></td>
            </tr>
        </table>
                <br><br><br>
        </div>
      
        
            <%
            }
            %>
        