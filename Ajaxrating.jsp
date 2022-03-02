
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            System.out.println("hai");
        String rat="";
        
        String proj="";
        String comp=session.getAttribute("comp_id").toString();
         String proj_id=request.getParameter("proj_id");
        comp=request.getParameter("comp");
        rat=request.getParameter("stars");
        proj=request.getParameter("proj");
        
       
                    
                            
                            String ss="insert into tbl_prorating(rat_value,proj_id,user_id)values('"+rat+"','"+proj+"','"+comp+"')";
                            boolean b=con.executeCommand(ss);
                            System.out.println(ss);
                            if(b==true)
                            {
                             out.println("inserted");   
                            }
                            else
                            {
                                out.println("failes");
                            }
                     
                  
        %>
    </body>
</html>
