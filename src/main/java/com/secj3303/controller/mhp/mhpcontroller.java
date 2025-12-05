package com.secj3303.controller.mhp;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.Content;
import com.secj3303.model.User;
import com.secj3303.model.Role;

@Controller
@RequestMapping("/mhp")
public class mhpcontroller{

    // --- MHP DASHBOARD ---
    @GetMapping({"/home", "/content"})
    public String showMhpDashboard(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getRole() != Role.MENTAL_HEALTH_PROFESSIONAL) {
            return "redirect:/auth/login";
        }

        // Mock Data to prevent empty table
        List<Content> contentList = new ArrayList<>();
        contentList.add(new Content(1, "Managing Stress in Finals", "Academic Stress", "Oct 24, 2023", "Published", "badge-published", "Article"));
        contentList.add(new Content(2, "5 Minute Meditation Guide", "Wellness", "Oct 26, 2023", "Draft", "badge-draft", "Video"));

        model.addAttribute("user", loggedInUser);
        model.addAttribute("contentList", contentList);
        
        // Matches your file: /WEB-INF/views/mhp/home.jsp
        return "/mhp/home"; 
    }

    // --- CREATE CONTENT PAGE (GET) ---
    @GetMapping("/create-content")
    public String showCreateContentPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) { return "redirect:/auth/login"; }
        
        // Pass empty content object to prevent crash
        model.addAttribute("content", new Content());
        model.addAttribute("isEdit", false);
        
        // FIXED: Changed to match your screenshot "create_content.jsp"
        return "/mhp/create_content"; 
    }

    // --- SAVE CONTENT PROCESS (POST) ---
    @PostMapping("/save-content")
    public String processSaveContent(
            @RequestParam("title") String title,
            @RequestParam("status") String status,
            HttpSession session) {
        
        // Logic to save would go here
        System.out.println("Saving content: " + title);
        return "redirect:/mhp/home";
    }
}