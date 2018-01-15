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
        String pregunta1 = request.getParameter("pregunta1");
        String pregunta2 = request.getParameter("pregunta2");
        String regex = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$";
        Connection conn = DriverManager.getConnection(secreto.getDireccion(),secreto.getUser(), secreto.getPass()); 
        Statement st2 = conn.createStatement();
        ResultSet rs2=st2.executeQuery("select uname from members where uname='" + username + "'");
       if (rs2.next()) 
       {	
    	   out.println("ya existe ese username");
       }
       else
       {  if (password.matches(regex))
        {
	        String hash= MetodosHash.Hasheo(password);
	        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
	        Statement st = conn.createStatement();
	        int i = st.executeUpdate("insert into `members` (uname,pass,preg1,preg2,intentos) values ('"+username+"','"+hash+"','"+pregunta1+"','"+pregunta2+"',"+0+")"); 
	        if (i > 0) {
	            //session.setAttribute("userid", user);
	            response.sendRedirect("Login.jsp");
	           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	        } else {
	        
	        }
        }else
        {
        	out.println("La contrase;a debe ser de 8 caracteres y tener al menos una letra Mayuscula, un caracter no alfanumerico y un numero" + password); 
        }
       }    
   }
   catch(Exception e){       
       out.println(e);       
   }
%>