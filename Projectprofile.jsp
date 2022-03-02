
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alamara | Project In Detail</title>
          
<!--        <style>
          
            .change_font{
                font-size: 20px;
            }
            .coloro
            {
                background-color:aquamarine;
            }
        </style>
        
    -->
    <script src="../Jq/jquery.js" type="text/javascript"></script>
        <style>
               body{width:610;}
               .demo-table {width: 50%;border-spacing: initial;margin: 20px 30%;word-break: break-word;table-layout: auto;line-height:1.8em;color:#333;}
               .demo-table th {background: #999;padding: 5px;text-align: left;color:#FFF;}
               .demo-table td {border-bottom: #f0f0f0 1px solid;background-color: #ffffff;padding: 5px;}
               .demo-table td div.feed_title{text-decoration: none;color:#00d4ff;font-weight:bold;}
               .demo-table ul{margin:0;padding:0;}
               .demo-table li{cursor:pointer;list-style-type: none;display: inline-block;color: #F0F0F0;text-shadow: 0 0 1px #666666;font-size:20px;}
               .demo-table .highlight, .demo-table .selected {color:#F4B30A;text-shadow: 0 0 1px #F48F0A;}
</style>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>


<script>
    
    function highlightStar(obj,id){
//        alert("this"+obj);
//        alert("Bandid"+id);
//        alert('Hiii');
	removeHighlight(id);		
	$('.demo-table #tutorial-'+id+' li').each(function(index) {
		$(this).addClass('highlight');
		if(index === $('.demo-table #tutorial-'+id+' li').index(obj)) {
			return false;	
		}
	});
}

    
    function removeHighlight(id) {
	$('.demo-table #tutorial-'+id+' li').removeClass('selected');
	$('.demo-table #tutorial-'+id+' li').removeClass('highlight');
}


function addRating(obj,id) {
    alert("Object"+obj)
    alert("id"+id)
	$('.demo-table #tutorial-'+id+' li').each(function(index) {
		$(this).addClass('selected');
		$('#tutorial-'+id+' #rating').val((index+1));
		if(index == $('.demo-table #tutorial-'+id+' li').index(obj)) {
			return false;	
		}
	});
	$.ajax({
	url: "add_rating.jsp",
	data:'id='+id+'&proid='+'&rating='+$('#tutorial-'+id+' #rating').val(),
	type: "POST"
	});
}
function resetRating(id) {
	if($('#tutorial-'+id+' #rating').val() != 0) {
		$('.demo-table #tutorial-'+id+' li').each(function(index) {
			$(this).addClass('selected');
			if((index+1) == $('#tutorial-'+id+' #rating').val()) {
				return false;	
			}
		});
	}
}

    
</script>


    </head>
    <body>
        <%
            String stu_name="";
            String stu_col="";
            String stu_dept="";
            String pro_name="",pro_descrp="",pro_type="",pro_lang="",pro_date="",pro_logo="",pro_file="",proj_rating="";
            
            String proj_id=request.getParameter("proj_id");
            String in="select * from tbl_project pr inner join tbl_protype pt on pr.protype_id=pt.protype_id inner join tbl_prolang pl on pr.prolang_id=pl.prolang_id inner join tbl_student s on pr.stu_id=s.stu_id inner join tbl_dept d on s.dept_id=d.dept_id inner join tbl_college c on s.col_id=c.col_id where proj_id='"+proj_id+"'";
            ResultSet rs=con.selectCommand(in);
            
            if(rs.next())
            {
                stu_name=rs.getString("stu_name");
                stu_col=rs.getString("col_name");
                stu_dept=rs.getString("dept_name");
                // pro_id=rs.getString("proj_id");
                  proj_rating=rs.getString("proj_rating");
                pro_name=rs.getString("proj_name");
                pro_descrp=rs.getString("proj_descrp");
                pro_type=rs.getString("protype_name");
                pro_lang=rs.getString("prolang_name");
                pro_date=rs.getString("proj_date");
                pro_logo=rs.getString("proj_logo");
                pro_file=rs.getString("proj_file");
            
        %>
        <form method="POST" action="Colviewproject.jsp">
            <input type="submit" name="col_back" value="Back"/>
        </form>
    <center>

        <table border="0"  width="50%" cellpadding="10" class="demo-table">
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
            <tr>
                <td>
                                      
                <div id="tutorial-<%=proj_id%>">
			<input type="hidden" name="rating" id="rating" value="<%=rs.getString("proj_rating")%>" />

                <ul onMouseOut="resetRating(<%=proj_id%>);">
                            <%
                            int j=0;
                            int rating=Integer.parseInt(rs.getString("proj_rating"));
                                    for(j=1; j<=5; j++)
                                        {
                                                String selected = "";
                                                    if(rating!=0 && j<=rating) {
                                                        selected = "selected";
                                                         }
                            %>
                            <li class='<% out.print(selected); %>' onMouseOver="highlightStar(this,<%=proj_id%>);" onMouseOut="removeHighlight(<%=proj_id%>);" onClick="addRating(this,<%=proj_id%>);">&#9733;</li>  
  <% 
  }  
  
  %>
</ul>
</div>
                </td>
            </tr>
        </table>
                <% } %>
                <%
                String comm_des="";
                
                %>
               
        
    </center>
    </body>
</html>
