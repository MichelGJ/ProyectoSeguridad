package topSecret;

public class secreto {

	private static String direccion = "jdbc:mysql://localhost:3306/seg?verifyServerCertificate=false&useSSL=true";
	private static String user = "seg";
	private static String pass= "seguridad";
	public static String username;

	public static String getDireccion() {
		return direccion;
	}
	public static String getUser() {
		return user;
	}
	public static String getPass() {
		return pass;
	}
	
	public static void setUsername(String param){
		username=param;
	}
	public static String getUsername() {
		return username;
	}
}
	
