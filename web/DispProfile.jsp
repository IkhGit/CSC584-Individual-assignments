<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Personal Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #B3CDE0; /* Light green background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            color: #333;
        }
        .profile-card {
            background-color: #6497b1;
            padding: 35px 50px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            text-align: center;
            border-left: 8px solid #005b96; /* Green accent */
        }
        h1 {
            color: #2c3e50; /* Darker green */
            margin-bottom: 25px;
            font-size: 2.5em;
            position: relative;
        }
        h1::after {
            content: '';
            display: block;
            width: 60px;
            height: 3px;
            background-color: #2c3e50;
            margin: 15px auto 0;
        }
        .profile-detail {
            margin-bottom: 18px;
            font-size: 1.1em;
            line-height: 1.6;
            text-align: left;
            display: flex;
            align-items: flex-start;
        }
        .profile-detail strong {
            color: #2c3e50; /* Medium green */
            min-width: 140px; /* Align labels */
            display: inline-block;
            margin-right: 15px;
        }
        .profile-detail span {
            flex-grow: 1;
        }
        .profile-intro {
            background-color: #b3cde0;
            border: 1px dashed #011f4b;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
            font-style: italic;
            color: #2c3e50;
            text-align: left;
            line-height: 1.8;
        }
        .back-link {
            display: inline-block;
            margin-top: 40px;
            padding: 12px 25px;
            background-color: #03396c; /* Lighter green */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: bold;
        }
        .back-link:hover {
            background-color: #005b96;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <h1>Hello, <%= request.getAttribute("profileName") %>!</h1>

        <div class="profile-detail">
            <strong>Student ID:</strong> <span><%= request.getAttribute("profileStudentId") %></span>
        </div>
        <div class="profile-detail">
            <strong>Program:</strong> <span><%= request.getAttribute("profileProgram") %></span>
        </div>
        <div class="profile-detail">
            <strong>Email:</strong> <span><%= request.getAttribute("profileEmail") %></span>
        </div>
        <div class="profile-detail">
            <strong>Hobbies:</strong> <span><%= request.getAttribute("profileHobbies") %></span>
        </div>

        <div class="profile-intro">
            <strong>About Me:</strong><br>
            <span><%= request.getAttribute("profileSelfIntro") %></span>
        </div>

        <a href="index.html" class="back-link">Create Another Profile</a>
    </div>
</body>
</html>