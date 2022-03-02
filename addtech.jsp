
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html>
<%@include file="editheader.jsp" %>
        <title>Tech Fest</title>
    </head>
    <body>
        <%
            String tech_name="",tech_about="",tech_loc="",tech_date="",tech_time="";
            if(request.getParameter("btn_submit")!= null)
            {
                tech_name=request.getParameter("tech_name");
                tech_about=request.getParameter("tech_about");
                tech_loc=request.getParameter("op");
                tech_date=request.getParameter("tech_date");
                tech_time=request.getParameter("tech_time");
                String in="insert into tbl_tech(tech_name,tech_descrip,col_id,tech_date,tech_time)values('"+tech_name+"','"+tech_about+"','"+tech_loc+"','"+tech_date+"','"+tech_time+"')";
                boolean b=con.executeCommand(in);
                    if(b==true)
                    {%>
                     <script>alert("Data Inserted");window.location.replace("addtech.jsp");</script><%
                    }
                    else
                    {%>
                       <script>alert("failed");window.location.replace("addtech.jsp");</script><%
                    }
            }
        %>
        
    
        <br><br>
         <br><br> 
    <center><h3>Add TechFest</h3></center>
       
        <center>
        <form method="post" action="Techimage.jsp" enctype="multipart/form-data">
            <table >
                <tr>
                    <td>Tech Fest Name </td>
                    <td><input type="text" name="tech_name" required=""/></td>
                </tr>
                <tr>
                    <td>About Tech </td>
                    <td><textarea rows="6" cols="10" name="tech_about" required=""/></textarea></td>
                </tr>
                <tr>
                    <td>College Name</td>
                    <td>
                        <select name="op">
                            <option value="">-----select-----</option>
                            <%
                                 String sel="select * from tbl_college";
                                 ResultSet rs=con.selectCommand(sel);
                                 
                                 while(rs.next())
                                 {
                             %>
                             <option value="<%=rs.getString("col_id")%>"><%=rs.getString("col_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>    
                </tr>
                <tr>
                    <td>Tech Fest Image </td>
                    <td>
                        <div class="upload-btn-wrapper">
                            <button class="btnup"><input type="file" name="tech_file" />Upload</button>
                            
                         </div>
                    </td>
                </tr>
                 <tr>
                    <td>Date </td>
                    <td><input type="date" name="tech_date" required=""/></td>
                </tr>
                <tr>
                    <td>Time </td>
                    <td><input type="time" name="tech_time" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="btn_submit"/>
                        <input type="Reset"name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
   <%@include file="Footer.jsp" %>
