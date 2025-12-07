package com.secj3303.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.secj3303.model.User;

// import com.secj3303.model.User;

@Controller
@RequestMapping("/admin")
public class admincontroller {

    @GetMapping("/home")
    public String showAdminHomePage(Model model, HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        
        return "/admin/home";  
    }

    @GetMapping("/content-quality")
    public String showContentQuality(Model model, HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        
        return "/admin/content-quality";  
    }

    @GetMapping("/moderation-queue")
    public String showModerationQueue(Model model, HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        
        return "/admin/moderation-queue";  
    }

    @GetMapping("/platform-analytics")
    public String showPlatformAnalytics(Model model, HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        
        return "/admin/platform-analytics";  
    }

    @GetMapping("/logout")
        public String logout(HttpSession session) {
            session.invalidate();
            return "redirect:/auth/login";
    }

}
