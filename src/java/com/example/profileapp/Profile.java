package com.example.profileapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Profile", urlPatterns = {"/Profile"})

public class Profile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String selfIntro = request.getParameter("selfIntro");
        String[] hobbiesArray = request.getParameterValues("hobbies");

        String hobbiesString = "";
        if (hobbiesArray != null) {
            for (int i = 0; i < hobbiesArray.length; i++) {
                hobbiesString = hobbiesString + hobbiesArray[i];
                
                if (i < hobbiesArray.length - 1) {
                    hobbiesString = hobbiesString + ", ";
                }
            }
        } else {
            hobbiesString = "No hobbies selected";
        }

        ProfileBean newProfile = new ProfileBean();
        newProfile.setName(name);
        newProfile.setStudentId(studentId);
        newProfile.setProgram(program);
        newProfile.setEmail(email);
        newProfile.setHobbies(hobbiesString);
        newProfile.setSelfIntro(selfIntro);

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/student_profile", "app", "app");
            
            String sql = "INSERT INTO PROFILE (NAME, STUDENT_ID, PROGRAM, EMAIL, HOBBIES, SELF_INTRO) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, newProfile.getName());
            stmt.setString(2, newProfile.getStudentId());
            stmt.setString(3, newProfile.getProgram());
            stmt.setString(4, newProfile.getEmail());
            stmt.setString(5, newProfile.getHobbies());
            stmt.setString(6, newProfile.getSelfIntro());
            
            stmt.executeUpdate();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("userProfile", newProfile);
        
request.getRequestDispatcher("/viewProfile.jsp").forward(request, response);
    }
}