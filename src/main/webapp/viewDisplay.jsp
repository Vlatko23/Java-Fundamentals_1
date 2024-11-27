<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View responsive Data into Database</title>
<link href="css/bootstrap.css" rel="stylesheet" type ="text/css">
</head>
<body>
<div class="container">
<div class="row">

<table class="table table-bordered table-responsive table-striped">
<thead>
<tr>
<th>Course Id</th>
<th>Course Title</th>
<th>Trainer</th>
<th>Image URL</th>
<th>Fees</th>
<th>Course Description</th>
</tr>
</thead>
<%
String course_id = request.getParameter("id");
try {
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "jugo", "1234");
PreparedStatement ps = con.prepareStatement("Select * from courses where Course_Id=?");
ps.setString(1, course_id);
ResultSet rs = ps.executeQuery();
while (rs.next() == true) {
%>
<tbody>
<tr>
<td> <%= rs.getInt(1) %> </td>
<td> <%= rs.getString(2) %> </td>
<td> <%= rs.getString(3) %> </td>
<td> <%= rs.getString(4) %> </td>
<td> <%= rs.getString(5) %> </td>
<td> <%= rs.getString(6) %> </td>
</tr>
</tbody>

<%

}
} catch (Exception ex) {
out.println("Error here:" + ex);
}finally{
}

%>
</table>
</div>
</div>

<!--Some JS Put here -->

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>