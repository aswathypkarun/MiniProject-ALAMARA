<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alamara | View Project</title>
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
            $.ajax({url: '../Collegehead/Ajaxviewproject.jsp?lid='+lid,
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
            String project_language="";
            String project_domain="";
            if(request.getParameter("filter")!= null)
            {
                project_language=request.getParameter("language");
                project_domain=request.getParameter("Domain");
                session.setAttribute("Project_Language", project_language);
                session.setAttribute("Project_Type", project_domain);
            }
        %>
    <br><br>
    
        <form method="POST" action="Homepage_1.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    
    <center>
        <form method="POST" action="Col_Project_filtered_view.jsp">
            <table align="center">
                <tr align="center">
                    <td align="right">
                        Select Language : 
                    </td>
                    <td align="center">      
                        <select name="language">
                        <option value="">-----SELECT-----</option>
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
                <tr align="center">
                    <td align="right">                        
                        Select Domain : 
                    </td>
                    <td align="center">
                        <select name="Domain">
                        <option value="">--------SELECT--------</option>
                            <%
                                 String select_domain="select * from tbl_protype";
                                 ResultSet result_domain=con.selectCommand(select_domain);
                                 
                                 while(result_domain.next())
                                 {
                             %>
                             <option value="<%=result_domain.getString("protype_id")%>"><%=result_domain.getString("protype_name")%></option>
                             <%
                              }
                             %>
                        </select> 
                    </td>
                </tr>
                <tr align="center">
                    <td align="right">
                        <input type="submit" name="filter" value="FILTER"/>
                    </td>
                    <td align="left">
                        <input type="reset" name="btn_reset" value="RESET"/>
                    </td>
                </tr>     
            </table>
        </form>
            
                       <!-- <input type="submit"name="btn_search"/>-->
          <br><br><br><br>
        
         <div id="selid">
        <%
            String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="";
            String proj_id="";                     
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
                
                double c=1.0;
                double s=0.0;
                        double avg=0.0;
                String selc="select count(proj_id) as c from tbl_prorating where proj_id='"+ rs.getString("proj_id")+"'";
                System.out.println(selc);
                ResultSet rsc=con.selectCommand(selc);
                if(rsc.next())
                {
                    c=rsc.getDouble("c");
                }
                if(c==0){
                    c=1;
                }
                 String sels="select sum(rat_value) as su  from tbl_prorating where proj_id='"+ proj_id+"'";
                ResultSet rss=con.selectCommand(sels);
                 System.out.println(sels);
                if(rss.next())
                {
                    s=rss.getDouble("su");
                }
              System.out.println("c="+c);
               System.out.println("s="+s);
                avg=s/c;
        %>
       
        <div id="colo">
            <table border="0" class="coloro" width="50%" cellpadding="10" >
            <tr>
                <td>
            <center><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="change_font"><%=pro_name%></i></b></center><br><br>
                    <b>Description&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_descrp%><br><br>
                    <b>Language&nbsp&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_lang%><br><br>
                    <b>Date Of Upload&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=pro_date%><br><br>
                      <b>Avg Rating&nbsp&nbsp&nbsp:</b>&nbsp&nbsp<%=avg%><br><br>
                </td>
                <td>
                    <img src="../Student/Projectlogo/<%=pro_logo%>" width="100" height="100"><br>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><a href="Colprojectprofile.jsp?proj_id=<%=proj_id%>" style="color: red">Click Here for More Details</a></td>
            </tr>
        </table>
                <br><br><br>
        </div>
      
        
            <%
            }
            %>
         </div>
    </center>
    </body>
</html>
