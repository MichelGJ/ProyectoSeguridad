<%@page import="Hash.MetodosHash"%>
<%@page import="topSecret.secreto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.regex.Matcher" %>
<%@ page import ="java.util.regex.Pattern" %>
<% 
    try{
    	String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String hash = MetodosHash.Hasheo(password);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	 Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
             Statement st = conn.createStatement();
             ResultSet rs;
             rs = st.executeQuery("select * from members where uname='" + username + "' and pass='" + hash + "'");                     
             if(rs.next())           
                out.println("Valid login credentials");        
             else
                out.println("Invalid login credentials"); 

        
                  
   }
   catch(Exception e){       
       out.println(e);       
   } 
%>