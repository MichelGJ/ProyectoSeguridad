<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@page import="topSecret.secreto"%>
<% 
    try{
        String pregunta1 = request.getParameter("pregunta1");
        String pregunta2 = request.getParameter("pregunta2");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	 Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
             Statement st = conn.createStatement();
             ResultSet rs;
             rs = st.executeQuery("select * from members where preg1='" + pregunta1 + "' and preg2='" + pregunta2 + "'");
        if (rs.next())
        {
        	response.sendRedirect("CambioPass.jsp");
        }
        else
        {
        	out.println("no son las respuestas correctas");
        }
   }
   catch(Exception e){       
       out.println(e);       
   }
%>