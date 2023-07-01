<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String f_name = request.getParameter("Name");
String l_name = request.getParameter("LastName");
String email = request.getParameter("Email");
String pass = request.getParameter("Password");
ResultSet rs = null;
Connection con = null;
PreparedStatement ps =null;
String query = "insert into logininfo values(?, ?, ?, ?)";

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_loginpg","root","@deveshi2004");
	ps = con.prepareStatement(query);
	ps.setString(1,f_name);
	ps.setString(2,l_name);
	ps.setString(3,email);
	ps.setString(4,pass);
	int i = ps.executeUpdate();
	if(i>0)
	{
		out.print("<h1>Data successfully uploaded</h1>");
	}else
	{
		out.print("<h1>Error Message</h1>");
	}
}catch(Exception e)
{   out.print(e);	
}
%>

</body>
</html>