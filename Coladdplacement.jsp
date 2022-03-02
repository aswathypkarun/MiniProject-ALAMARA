<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="editheader.jsp" %>
        <title>Add Placement</title>
    
    <body>
        <%
            String place_name="",place_vanue="",place_date="",place_time="";
                    String col=session.getAttribute("col_id").toString();

            
            if(request.getParameter("btn_submit")!= null)
            {
               place_name=request.getParameter("place_name");
               place_vanue=request.getParameter("place_vanue");
               place_date=request.getParameter("place_date");
               place_time=request.getParameter("place_time");
               
            }
        %>
     <br><br>    <br><br> 
    <center><h3>Add Placement</h3></center>
    
    <center>
        <form method="POST" action="PlaceUploadAction.jsp" enctype="multipart/form-data">
            
            <table>
                <tr>
                    <td>Placement Name</td>
                    <td><input type="text" name="place_name" required=""/></td>
                </tr>
                <tr>
                    <td>Placement Venue</td>
                    <td><input type="text" name="place_venue" required=""/></td>
                </tr>
                
                <tr>
                    <td>Placement Date</td>
                    <td><input type="Date" name="place_date" required=""/></td>
                </tr>
                <tr>
                    <td>Placement Time</td>
                    <td><input type="Time" name="place_date" required=""/></td>
                </tr>
                
                
                
                <tr>
                    <td>Placement Details</td>
                    <td>
                        <div class="upload-btn-wrapper">
                            <button class="btnup"><input type="File" name="place_details" required=""/>Upload</button>
                        </div>
                    </td>
                </tr>
                
                <tr>    
                    <td>Placement Logo</td>
                    <td>
                        <div class="upload-btn-wrapper">
                            <button class="btnup"><input type="File" name="place_logo" required=""/>Upload</button>
                        </div>
                    </td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit"name="btn_submit"/>
                        <input type="Reset"name="comp_reset"/>
                        </td>
                </tr>
            </table>
                
        </form>
    </center>
        
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
