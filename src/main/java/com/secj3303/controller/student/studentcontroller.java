package com.secj3303.controller.student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @GetMapping("/new-post")
    public String showNewPostPage(Model model) {
        // Add model attributes if needed
        return "/student/new-post"; // Resolves to /WEB-INF/views/student/new-post.jsp
    }

    @GetMapping("/forum")
    public String showForumPage(Model model) {
        // Add model attributes if needed
        return "/student/peer"; // Resolves to /WEB-INF/views/student/new-post.jsp
    }

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

    @GetMapping("/post")
    public String viewPost(@RequestParam(name = "id", required = false, defaultValue = "1") int id,
                           Model model) {
        // static data for id=1
        if (id == 1) {
            Map<String,Object> post = new HashMap<>();
            post.put("id", 1);
            post.put("title", "Managing exam stress - what works for you?");
            post.put("author", "Anonymous");
            post.put("badge", "Moderated");
            post.put("category", "Stress");
            post.put("time", "2 hours ago");
            post.put("content", "Finals are coming up and I'm feeling overwhelmed. What strategies have helped you cope with academic pressure?");
            post.put("likes", 24);
            post.put("replyCount", 18);
            post.put("avatar", "A");
            model.addAttribute("post", post);

            List<Map<String,String>> replies = new ArrayList<>();
            replies.add(makeReply("Relax_Bro","Ali • 1 hour ago","Take deep breaths and remember that exams don't define you. You've got this!", "R"));
            replies.add(makeReply("Sam","45 minutes ago","Breaking study time into short sessions, getting enough sleep and quick breaks really helps.", "S"));
            replies.add(makeReply("Daniel","12 minutes ago","I find that taking regular breaks, staying positive, and getting enough rest helps me manage exam stress better.", "D"));
            replies.add(makeReply("Maya","8 minutes ago","Exercise has been a game-changer for me. Even a 15-minute walk helps clear my mind and reduce anxiety.", "M"));
            replies.add(makeReply("Jordan","5 minutes ago","Making a realistic study schedule has helped me feel more in control. I break down what I need to study by day and it feels less overwhelming.", "J"));
            replies.add(makeReply("Lisa","3 minutes ago","Meditation apps like Headspace or Calm have really helped me. Just 10 minutes a day makes a difference.", "L"));
            replies.add(makeReply("Chris","2 minutes ago","Study groups help me stay accountable and motivated. Plus, explaining concepts to others really reinforces my own understanding.", "C"));
            replies.add(makeReply("Emma","1 minute ago","I keep healthy snacks nearby while studying. Proper nutrition really affects my concentration and mood.", "E"));
            replies.add(makeReply("Tyler","Just now","Limiting caffeine has surprisingly helped me. I was drinking too much coffee which made my anxiety worse.", "T"));
            replies.add(makeReply("Nina","Just now","Talk to your professors if you're struggling! Most are really understanding and can offer guidance or extensions if needed.", "N"));
            replies.add(makeReply("Alex","Just now","I use the Pomodoro technique - 25 minutes of focused study, then a 5-minute break. It keeps me from burning out.", "A"));
            replies.add(makeReply("Kate","Just now","Remember to reach out to campus counseling services if you need extra support. They're there to help!", "K"));
            replies.add(makeReply("Ben","Just now","Visualization techniques work for me. I imagine myself calmly taking the exam and doing well.", "B"));
            replies.add(makeReply("Olivia","Just now","Getting enough sleep is crucial! All-nighters might seem productive but they actually hurt your performance.", "O"));
            replies.add(makeReply("Ryan","Just now","Practice past exams if available. It helps reduce anxiety because you know what to expect.", "R"));
            replies.add(makeReply("Zoe","Just now","Journal your thoughts and feelings. Getting worries out of your head and onto paper can be really therapeutic.", "Z"));
            replies.add(makeReply("Isaac","Just now","Stay hydrated! Dehydration can affect concentration and increase stress levels.", "I"));
            replies.add(makeReply("Priya","Just now","Be kind to yourself. One exam doesn't determine your future. You're doing your best and that's what matters.", "P"));

            model.addAttribute("replies", replies);
        }

        return "student/post"; // resolves to /WEB-INF/views/student/post.jsp
    }

    private Map<String,String> makeReply(String author, String time, String content, String avatar){
        Map<String,String> r = new HashMap<>();
        r.put("author", author);
        r.put("time", time);
        r.put("content", content);
        r.put("avatar", avatar);
        return r;
    }

}

