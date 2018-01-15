<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cambio de password</title>
</head>
<body>
<form method="post" action="CambioPassword.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Ingrese Nuevo Password</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nueva Contraseña</td>
                        <td><input type="password" name="pass1" required/></td>
                    </tr>
                    <tr>
                        <td>Repita la nueva contraseña</td>
                        <td><input type="password" name="pass2" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Registrese" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Resetea" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
</body>
</html>