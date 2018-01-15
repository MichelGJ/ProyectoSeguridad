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
    	int intentos=0;
    	String username = request.getParameter("username");   
        String password = request.getParameter("password");
        String hash = MetodosHash.Hasheo(password);
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	 Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
             Statement st = conn.createStatement();
             Statement st2 = conn.createStatement();
             ResultSet rs;
             rs = st.executeQuery("select * from members where uname='" + username + "' and pass='" + hash + "'");
  			 ResultSet rs2;
  			 rs2=st2.executeQuery("select intentos from members where uname='" + username + "'");
  		if(rs2.next())
  		{	
  		 intentos = rs2.getInt(1);
  		}
  		if (intentos==3)
  		{	response.sendRedirect("Cambio.jsp");
  			session.setAttribute("username", username);
  		}
  		else
  		{     if(rs.next())           
             {   
            	 int i = st.executeUpdate("UPDATE members SET intentos=0 WHERE uname='" + username + "' and pass='" + hash + "'"); 
            	 out.println("Valid login credentials");
             }
             else
             {  
            	 int i = st.executeUpdate("UPDATE members SET intentos=intentos+1 WHERE uname='" + username + "'");  
            	 out.println("Invalid login credentials"); 
            	
             }
  		}            
   }
   catch(Exception e){       
       out.println(e);       
   } 
%>