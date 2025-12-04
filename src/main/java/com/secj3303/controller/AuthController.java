package com.secj3303.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.Role;
import com.secj3303.model.User;
import com.secj3303.model.UserRepository;

@Controller
@RequestMapping("/auth")
public class AuthController {

    // --- LOGIN PAGE (GET) ---
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        model.addAttribute("roles", Role.values());
        return "/auth/login";    // => /WEB-INF/views/login.jsp
    }

    // --- LOGIN PROCESS (POST) ---
    @PostMapping("/login")
    public String processLogin(
            @RequestParam("username") String usernameOrEmail,
            @RequestParam("password") String password,
            Model model,
            HttpSession session) {

        // find by username or email
        User user = UserRepository.findByUsernameOrEmail(usernameOrEmail);

        if (user == null || !user.getPassword().equals(password)) {
            model.addAttribute("error", "Invalid username or password");
            return "/auth/login";
        }

        session.setAttribute("loggedInUser", user);

        switch (user.getRole()) {
            case STUDENT:
                return "redirect:/student/home";
            case ADMIN:
                return "redirect:/admin/home";
            case MENTAL_HEALTH_PROFESSIONAL:
                return "redirect:/mhp/home";
            default:
                return "redirect:/auth/login";
        }
    }

    // --- REGISTER PAGE (GET) ---
    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("roles", Role.values());
        return "/auth/register";  // => /WEB-INF/views/register.jsp
    }

    // --- REGISTER PROCESS (POST) ---
    @PostMapping("/register")
    public String processRegister(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam("role") String roleStr,
            Model model) {

        // check if username already exists
        if (UserRepository.findByUsername(username) != null) {
            model.addAttribute("error", "Username already exists");
            model.addAttribute("roles", Role.values());
            return "/auth/register";
        }

        Role role = Role.valueOf(roleStr);
        User newUser = new User(username, password, fullName, email, role);
        UserRepository.addUser(newUser);

        // after register, go to login
        model.addAttribute("msg", "Registration successful! Please log in.");
        model.addAttribute("roles", Role.values());
        return "/auth/login";
    }

    // --- LOGOUT ---
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }
}
