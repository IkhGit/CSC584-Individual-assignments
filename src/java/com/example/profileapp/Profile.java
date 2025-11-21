package com.example.profileapp;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the HTML form
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String[] hobbiesArray = request.getParameterValues("hobbies"); // For multiple checkboxes
        String selfIntro = request.getParameter("selfIntro");

        // Process hobbies: convert array to a single string or list if needed for display
        String hobbies = (hobbiesArray != null && hobbiesArray.length > 0)
                            ? String.join(", ", hobbiesArray)
                            : "No hobbies selected";

        request.setAttribute("profileName", name);
        request.setAttribute("profileStudentId", studentId);
        request.setAttribute("profileProgram", program);
        request.setAttribute("profileEmail", email);
        request.setAttribute("profileHobbies", hobbies);
        request.setAttribute("profileSelfIntro", selfIntro);

        // Forward the request and response to the JSP page for display
        request.getRequestDispatcher("/DispProfile.jsp").forward(request, response);
    }
}
