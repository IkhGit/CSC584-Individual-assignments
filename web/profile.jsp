<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.example.profileapp.ProfileBean"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Saved</title>
        <style>
            body { font-family: sans-serif; padding: 20px; }
            .card { border: 1px solid #ccc; padding: 20px; border-radius: 10px; max-width: 500px; }
            h2 { color: green; }
        </style>
    </head>
    <body>
        <% 
            // Get the bean from the Servlet
            ProfileBean p = (ProfileBean) request.getAttribute("userProfile");
        %>
        
        <div class="card">
            <h2>Profile Saved Successfully!</h2>
            <p><strong>Name:</strong> <%= p.getName() %></p>
            <p><strong>ID:</strong> <%= p.getStudentId() %></p>
            <p><strong>Program:</strong> <%= p.getProgram() %></p>
            <p><strong>Email:</strong> <%= p.getEmail() %></p>
            <p><strong>Hobbies:</strong> <%= p.getHobbies() %></p>
            <p><strong>Intro:</strong> <%= p.getSelfIntro() %></p>
            
            <br>
            <a href="index.html">Add New Profile</a> | 
            <a href="viewProfile.jsp">View All Profiles</a>
        </div>
    </body>
</html>