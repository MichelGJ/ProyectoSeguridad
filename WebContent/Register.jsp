<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<% 
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        int hash = password.hashCode();
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seg?verifyServerCertificate=false&useSSL=true","seg", "seguridad"); 
        Statement st = conn.createStatement();
        int i = st.executeUpdate("insert into `members` (uname,pass) values ('"+username+"','"+hash+"')"); 
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("Login.jsp");
           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
        
        }
   }
   catch(Exception e){       
       out.println(e);       
   }
%>