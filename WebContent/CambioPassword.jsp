<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@page import="topSecret.secreto"%>
<%@page import="Hash.MetodosHash"%>
<%
    try{
        String password1 = request.getParameter("pass1");
        String password2 = request.getParameter("pass2");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	 Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
             Statement st = conn.createStatement();
             Statement st2 = conn.createStatement();
        if (password1.equals(password2))
        {
        	
        	String hash = MetodosHash.Hasheo(password1);
        	int i = st.executeUpdate("UPDATE members SET pass='" + hash + "' WHERE uname='" + session.getAttribute("username") + "'"); 
        	int i2 = st2.executeUpdate("UPDATE members SET intentos=0 WHERE uname='" + session.getAttribute("username") + "'"); 
        	response.sendRedirect("Login.jsp");
        }
   }
   catch(Exception e){       
       out.println(e);       
   }
%>