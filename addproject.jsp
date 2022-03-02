
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>New Project</title>
    </head>
    <body>
        <%
            String pro_name="",pro_descrp="",pro_type="",pro_lang="";
            String stu=session.getAttribute("stu_id").toString();
            if(request.getParameter("btn_submit")!= null)
            {
                pro_name=request.getParameter("pro_name");
                pro_descrp=request.getParameter("pro_descrp");
                pro_type=request.getParameter("op");
                pro_lang=request.getParameter("op1");
            }
        %>
        <br><br><br>
    <center><h3>Add Your Ideas!</h3></center>
    <center>
        <form method="POST" action="projectuploadaction.jsp" enctype="multipart/form-data">
            <table cellpadding="10" align="center">
                <tr>
                    <td>Project Name</td>
                    <td><input type="text" name="pro_name" required=""/></td>
                </tr>
                <tr>
                    <td>Project Description</td>
                    <td><textarea name="pro_descrp" required=""></textarea></td>
                </tr>
                <tr>
                    <td>Project Domain</td>
                    <td>
                        <select name="op">
                            <option value="">-----select-----</option>
                            <%
                                 String sel="select * from tbl_protype";
                                 ResultSet rs=con.selectCommand(sel);
                                 
                                 while(rs.next())
                                 {
                             %>
                             <option value="<%=rs.getString("protype_id")%>"><%=rs.getString("protype_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Project Language</td>
                    <td>
                        <select name="op1">
                            <option value="">-----select-----</option>
                            <%
                                 String sele="select * from tbl_prolang";
                                 ResultSet rs1=con.selectCommand(sele);
                                 
                                 while(rs1.next())
                                 {
                             %>
                             <option value="<%=rs1.getString("prolang_id")%>"><%=rs1.getString("prolang_name")%></option>
                             <%
                              }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Project Logo</td>
                    
                        <td>
                           <input type="file" name="pro_logo" required=""/>
                        </td>
                    
                </tr>
                <tr>
                    <td>Project File</td>
                    <td><input type="file" name="pro_file" required=""/></td>
                </tr>
                <tr>
                        <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Upload"/>
                        <input type="Reset" name="btn_reset"/>
                        </td>
                </tr>
            </table>
        </form>
    </center>
    <%@include file="Footer.jsp" %>
