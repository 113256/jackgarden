/*
package gardenpeople.servlet;

import gardenpeople.dao.ImageDAO;
import gardenpeople.model.User;

import java.io.File;
import java.io.IOException;
  

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
  
@WebServlet("/UploadPhoto")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    // 10 MB
                 maxFileSize=1024*1024*50,          // 50 MB
                 maxRequestSize=1024*1024*100)      // 100 MB
public class PhotoUploadServlet extends HttpServlet {
  
    private static final long serialVersionUID = 205242440643911308L;
     
    */
/**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     * From http://www.journaldev.com/2122/servlet-3-file-upload-using-multipartconfig-annotation-and-part-interface
     *//*

    private static final String UPLOAD_PATH = "G:\\JavaEE_Dev\\imageServer\\images";
    private static final String ACCESS_ROOT = "/images/";
      
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets absolute path of the web application
    	
        */
/*String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;*//*

          
        // creates the save directory if it does not exists
        User user = (User)request.getSession(false).getAttribute("user");
        File fileSaveDir = new File(UPLOAD_PATH );
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
         
        String fileName = null;
        //Get all the parts from request and write it to the file on server
        */
/*for (Part part : request.getParts()) {
            fileName = getFileName(part);
            part.write(fileSaveDir.getAbsolutePath()+ File.separator +user.getAutoIncrementID() +"__"+ fileName);
        }*//*

        */
/*ImageDAO imageDAO= new ImageDAO();

        imageDAO.addImagePath(user.getAutoIncrementID(), ACCESS_ROOT + user.getAutoIncrementID() +"__" + fileName);
  *//*

        request.setAttribute("message", fileName + " File uploaded successfully!");
        response.sendRedirect("/photos");

        //request.getRequestDispatcher("photos").forward(request, response);



    }
  
    */
/**
     * Utility method to get file name from HTTP header content-disposition
     *//*

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }
}*/
