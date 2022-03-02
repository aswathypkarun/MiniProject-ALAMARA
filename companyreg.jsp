<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<%@include file="headheader.jsp" %>
        <title>Alamara | Company Registration</title>
        <script src="../Jq/jquery.js"></script>
        <script>
function getloc(did)
{

  $.ajax({url: 'AjaxLocation.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#seloc').html(data);
  },
  });

}


</script>
    
    <body>
    <%
        String comp_name="";
        String comp_email="";
        String comp_contact="";
        String comp_licno="";
        String dist_id="";
        String loc_id="";
        String comp_user="";
        String comp_pass="";
        if(request.getParameter("btn_submit")!= null)
            {
                comp_name=request.getParameter("comp_name");
                comp_email=request.getParameter("comp_email");
                comp_contact=request.getParameter("comp_contact");
                comp_licno=request.getParameter("comp_licno");
                dist_id=request.getParameter("op");
                loc_id=request.getParameter("op1");
                comp_user=request.getParameter("comp_user");
                comp_pass=request.getParameter("comp_pass");
                String ins="insert into tbl_company(comp_name,comp_email,comp_contact,comp_licno,loc_id,comp_username,comp_password) values('"+comp_name+"','"+comp_email+"','"+comp_contact+"','"+comp_licno+"','"+loc_id+"','"+comp_user+"','"+comp_pass+"')";
                boolean b=con.executeCommand(ins);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("companyreg.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("companyreg.jsp");</script><%
                    }
            }
        %>
   
        <br><br><br><br>
        <center>
        <form method="POST" action="complogoupload.jsp" enctype="multipart/form-data">
            <table>
             <thead align="center"><h3>Company Registration</h3></thead>
                <tr>
                    <td>
                        Company Name
                    </td>
                    <td><input type="text" name="comp_name" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="email" name="comp_email" autocomplete="off" required=""/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="comp_contact" pattern="[7-9]{1}[0-9]{9}" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>License No</td>
                    <td><input type="text" name="comp_licno" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Company Logo</td>
                    <td>
                        <input type="file" name="col_logo" required=""/> 
                    </td>
                </tr>

<div id="fileList"></div>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="op" onchange="getloc(this.value)" required="">
                            <option value="" required="">-----select-----</option>
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
                    <td>Location</td>
                    <td>
                        <select name="op1" id="seloc" required="">
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="comp_user" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="comp_pass" required="" /></td>
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
