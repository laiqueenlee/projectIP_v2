package com.secj3303.controller.student;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.ChatbotModel;
import com.secj3303.model.User;

@Controller
@RequestMapping("/student")
public class studentcontroller {

    // --- STUDENT HOME PAGE (GET) ---
    @GetMapping("/home")
    public String showStudentHomePage(Model model, HttpSession session) {
        
        // Retrieve the logged-in user from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            // If no user is logged in, redirect to the login page
            return "redirect:/auth/login";
        }

        // Add the logged-in user to the model
        model.addAttribute("user", loggedInUser);
        
        // Render the student homepage
        return "/student/home";  // => /WEB-INF/views/student/home.jsp
    }

    // --- STUDENT PROFILE PAGE (GET) ---
    @GetMapping("/profile")
    public String showStudentProfilePage(Model model, HttpSession session) {
        
        // Retrieve the logged-in user from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            // If no user is logged in, redirect to the login page
            return "redirect:/auth/login";
        }

        // Add the logged-in user details to the model
        model.addAttribute("user", loggedInUser);
        
        // Render the student profile page
        return "/student/profile";  // => /WEB-INF/views/student/profile.jsp
    }

    // --- STUDENT DASHBOARD PAGE (GET) ---
    @GetMapping("/dashboard")
    public String showStudentDashboardPage(Model model, HttpSession session) {
        
        // Retrieve the logged-in user from the session
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            // If no user is logged in, redirect to the login page
            return "redirect:/auth/login";
        }

        // Add the logged-in user and other necessary data to the model
        model.addAttribute("user", loggedInUser);
        
        // Render the student dashboard page
        return "/student/dashboard";  // => /WEB-INF/views/student/dashboard.jsp
    }

    // --- STUDENT LOGOUT (GET) ---
    @GetMapping("/logout")
    public String studentLogout(HttpSession session) {
        session.invalidate();  // Invalidate the session to log out
        return "redirect:/auth/login";  // Redirect to the login page
    }

    // --- NEW POST PAGE (GET) ---
    //@GetMapping("/new-post")
    //public String showNewPostPage(Model model) {
        // Add model attributes if needed
    //    return "/student/new-post"; // Resolves to /WEB-INF/views/student/new-post.jsp
    //}

    // Redirect student-scoped forum route to the central ForumController
    //@GetMapping("/forum")
    //public String showForumPage(Model model) {
    //    return "redirect:/forum";
    //}

    private ChatbotModel chatbotModel = new ChatbotModel();

    @GetMapping("/chatbot")
    public String showChatbotPage(Model model) {
        // Static data for chatbot responses
        model.addAttribute("chatbotResponses", chatbotModel.getResponse("default"));
        return "/student/chatbot"; 
    }

    // Method to handle sending messages (in the case of dynamic user input)
    @PostMapping("/chatbot")
    public String handleUserMessage(@RequestParam("userMessage") String userMessage, Model model) {
        // Get the chatbot response based on user message
        String botResponse = chatbotModel.getResponse(userMessage);

        model.addAttribute("chatbotResponses", botResponse);
        return "/student/chatbot";
    }

}

