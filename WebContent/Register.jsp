<%@page import="topSecret.secreto"%>
<%@page import="Hash.MetodosHash"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<% 
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String regex = "[0-9A-Za-z@ñÑ\\.\\,\\_\\$#\\-\\*]+";
        if (password.matches(regex))
        {
	        String hash= MetodosHash.Hasheo(password);
	        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
	        Statement st = conn.createStatement();
	        int i = st.executeUpdate("insert into `members` (uname,pass) values ('"+username+"','"+hash+"')"); 
	        if (i > 0) {
	            //session.setAttribute("userid", user);
	            response.sendRedirect("Login.jsp");
	           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	        } else {
	        
	        }
        }else
        {
        	out.println("La contrase;a debe tener al menos una letra Mayuscula, un caracter no alfanumerico y un numero" + password); 
        }
   }
   catch(Exception e){       
       out.println(e);       
   }
%>