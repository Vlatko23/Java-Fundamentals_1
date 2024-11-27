<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Responsive Data into Database</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <style>
        /* Style for table header - gray background */
        th {
            background-color: #808080 !important; /* Gray */
            color: white !important; /* White text */
        }

        /* Style for table body - white background */
        tbody {
            background-color: white !important; /* White background */
        }

        /* Optional: Hover effect for rows in the table body */
        tbody tr:hover {
            background-color: #f0f0f0 !important; /* Light gray on hover */
        }
    </style>
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
                <tbody>
                    <%
                    String course_id = request.getParameter("id"); // Get the course ID from the URL parameter
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        // Load JDBC driver (MySQL)
                        Class.forName("com.mysql.jdbc.Driver");

                        // Establish the database connection
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_abhay", "jugo", "1234");

                        // Prepare SQL query with the course ID
                        String query = "SELECT * FROM courses WHERE Course_Id = ?";
                        ps = con.prepareStatement(query);
                        ps.setString(1, course_id); // Set the course ID parameter

                        // Execute the query and get the result
                        rs = ps.executeQuery();

                        // Check if any data is returned
                        if (rs.next()) {
                    %>
                            <tr>
                                <td><%= rs.getInt(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td><%= rs.getString(5) %></td>
                                <td><%= rs.getString(6) %></td>
                            </tr>
                    <%
                        } else {
                            out.println("<tr><td colspan='6'>No data found for the provided Course ID.</td></tr>");
                        }
                    } catch (Exception ex) {
                        out.println("<tr><td colspan='6'>Error: " + ex.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            // Close the resources
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            out.println("Error closing resources: " + e.getMessage());
                        }
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include JavaScript files for Bootstrap and jQuery -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
</body>
</html>
