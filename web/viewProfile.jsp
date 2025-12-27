<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Profiles</title>
        <style>
            table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
            th { background-color: #f2f2f2; }
            .search-box { margin-bottom: 20px; padding: 10px; background: #eee; }
        </style>
    </head>
    <body>
        <h1>Student Database</h1>

        <div class="search-box">
            <form action="viewProfile.jsp" method="GET">
                Search: <input type="text" name="keyword" placeholder="Enter Name or ID">
                <input type="submit" value="Search">
                <a href="viewProfile.jsp"><button type="button">Reset</button></a>
            </form>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Student ID</th>
                <th>Program</th>
                <th>Hobbies</th>
            </tr>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/student_profile", "app", "app");

                    String keyword = request.getParameter("keyword");
                    String sql;
                    PreparedStatement stmt;

                    if (keyword != null && !keyword.isEmpty()) {
                        sql = "SELECT * FROM PROFILE WHERE NAME LIKE ? OR STUDENT_ID LIKE ?";
                        stmt = con.prepareStatement(sql);
                        stmt.setString(1, "%" + keyword + "%");
                        stmt.setString(2, "%" + keyword + "%");
                    } else {
                        sql = "SELECT * FROM PROFILE";
                        stmt = con.prepareStatement(sql);
                    }

                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("student_id") %></td>
                <td><%= rs.getString("program") %></td>
                <td><%= rs.getString("hobbies") %></td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
        
        <br>
        <a href="index.html">Register New Student</a>
    </body>
</html>