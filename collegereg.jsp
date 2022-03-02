

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<%@include file="headheader.jsp" %>
        <title>Alamara | College Registration</title>
        <script src="../Jq/jquery.js"></script>
        <script>
function getloc(did)
{

  $.ajax({url: 'AjaxLocation.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#selloc').html(data);
  },
  });

}
</script>
 
    <body>
    <%
        String col_name="";
        String dist_id="";
        String loc_id="";
        String col_year="";
        String col_email="";
        String col_contact="";
        String col_logo="";
        String col_licno="";
        String col_user="",col_pass="";
        if(request.getParameter("btn_submit")!= null)
            {
                col_name=request.getParameter("col_name");
                dist_id=request.getParameter("op");
                loc_id=request.getParameter("op1");
                col_year=request.getParameter("col_year");
                col_email=request.getParameter("col_email");
                col_contact=request.getParameter("col_contact");
                col_logo=request.getParameter("col_logo");
                col_licno=request.getParameter("col_licno");
                col_user=request.getParameter("col_user");
                col_pass=request.getParameter("col_pass");
                String ins="insert into tbl_college(col_name,col_email,col_contact,col_licno,col_year,col_username,col_password,loc_id) values ('"+col_name+"','"+col_email+"','"+col_contact+"','"+col_licno+"','"+col_year+"','"+col_user+"','"+col_pass+"','"+loc_id+"')";
                boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Registration Successfull");window.location.replace("../guest/login.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("collegereg.jsp");</script><%
                    }
            }
        %>
    <br><br>
        
        <br><br>
        <center>
        <form method="POST" action="ProductUploadAction.jsp" enctype="multipart/form-data">
            <table>
                <thead align="center"><h3>College Registration</h3></thead>
                <tr>
                    <td>
                        College Name    :
                    </td>
                    <td><input type="text" name="col_name" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>District    :</td>
                    <td>
                        <select name="op" onchange="getloc(this.value)">
                            <option value="">-----select-----</option>
                            <%
                                 String sel="select * from tbl_dist";
                                 ResultSet rs=con.selectCommand(sel);
                                
                                 while(rs.next())
                                 {
                             %>
                             <option value="<%=rs.getString("dist_id")%>"><%=rs.getString("dist_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location    :</td>
                    <td>
                        <select name="op1" id="selloc">
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Year of Establishment   :</td>
                    <td><input type="year" name="col_year" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Email Id    :</td>
                    <td><input type="email" name="col_email" autocomplete="off" required=""/></td>
                </tr>
                 <tr>
                    <td>Contact :</td>
                    <td><input type="text" name="col_contact" pattern="[7-9]{1}[0-9]{9}" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                
                    <td>College Logo    :</td>
                     
                    <td>
                        <div class="upload-btn-wrapper">
                            <button class="btnup"><input type="file" name="col_logo" required=""/>Upload</button>
                            
                         </div>
                    </td>
                 
                </tr>
                <tr>
                    <td>College Code :</td>
                    <td><input type="text" name="col_licno"autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Username    :</td>
                    <td><input type="text" name="col_user" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password    :</td>
                    <td><input type="password" name="col_pass"  autocomplete="off" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Register"/>
                        <input type="Reset" name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
                         <br><br><br><br>
    </center>
        
    <%@include file="logfooter.jsp" %>
