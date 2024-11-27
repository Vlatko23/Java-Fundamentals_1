<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View responsive Data into Database</title>
</head>
<body>

<%

String course_id = request.getParameter("id");
try {
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "jugo", "1234");
PreparedStatement ps = con.prepareStatement("Select * from courses where Course_Id=?");

ps.setString(1, course_id);
ResultSet rs = ps.executeQuery();
while (rs.next() == true) {

out.println("Course_Id" + rs.getInt(1));
out.println("Course_Title" + rs.getString(2));
out.println("Trainer" + rs.getString(3));
out.println("Image_Url" + rs.getString(4));
out.println("Fees" + rs.getString(5));
out.println("Course_Description" + rs.getString(6));
}
} catch (Exception ex) {
out.println("Error here:" + ex);
}finally{
}

%>
</body>
</html>