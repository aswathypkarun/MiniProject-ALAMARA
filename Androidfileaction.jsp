
<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date.*"%>

<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEAM</title>
    </head>
    <body>
        <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        
        String stu=request.getParameter("id");
String field_name="";
String file_name="";
String fn="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("sem_rep"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Student\\semupload\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            fn="Seminar_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
          
           
       }
           
           }
    //Strinh str1="insert into tbl_wantedlist ()";
    String sid="";
    String sel="select max(sem_id) as s from tbl_seminar";
    ResultSet rs=con.selectCommand(sel);
    if(rs.next())
    {
        sid=rs.getString("s");
    }
    
        
        String str1="insert into tbl_seminar (sem_name,sem_descrp,sem_pdf,stu_id,sem_date)values('"+session.getAttribute("semname").toString()+"','"+session.getAttribute("semdesc").toString()+"','"+fn+"','"+session.getAttribute("stid").toString()+"',curdate())";
       System.out.println(str1);
   
    boolean status=con.executeCommand(str1);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Uploaded Successfully..");
            setTimeout(function(){window.location.href='Androidfileup.jsp'},100);
        </script>
     <%
    }
     }   
//F:\ProjectHub\Project\Projecthub\web\Student\Androidfileup.jsp

      

        %>
    </body>
</html>
