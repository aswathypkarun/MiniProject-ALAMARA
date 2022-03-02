
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Viewheader1.jsp" %>
        <title>Alamara | Projects</title>
        <style>
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                background-color:aquamarine;
            }
        </style>
       
         <script src="../Jq/jquery.js"></script>
        <script>
function getProject(lid)
{

  $.ajax({url: 'AjaxProject.jsp?lid='+lid,
  type: 'GET',
  success: function(data) {
	  
	  $('#selid').html(data);
  },
  });

}
</script>
    </head>
    <body>
        <%
         String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="";
         String proj_id="";
            //String stu=session.getAttribute("stu_id").toString();   
            
        %>
        <br><br><br><br> 
    <center>
        <table align="center" style="width:80%">
            <tr align="center">
                <td align="right" style="width:30%">
                    Filter By Language : 
                </td> 
                <td align="left" style="width:70%">
                   <select name="op" onchange="getProject(this.value)">
                            <option value="">SELECT</option>
                            <%
                                 String sel="select * from tbl_prolang";
                                 ResultSet rs1=con.selectCommand(sel);
                                 
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
        </table>
            
                       <!-- <input type="submit"name="btn_search"/>-->
                       <br><br>
       
         <div id="selid">
        <%
                                 
            String in="select * from tbl_project pr inner join tbl_protype pt on pr.protype_id=pt.protype_id inner join tbl_prolang pl on pr.prolang_id=pl.prolang_id where proj_status='1'";
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
                <td colspan="2" align="center"><a href="Projectprofile.jsp?proj_id=<%=proj_id%>">Click Here for More Details</a></td>
            </tr>
        </table>
                <br><br><br>
        </div>
      
        
            <%
            }
            %>
         </div>
    </center>
         
    <%@include file="Footer.jsp" %>
