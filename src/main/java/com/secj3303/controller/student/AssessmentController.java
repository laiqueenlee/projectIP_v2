package com.secj3303.controller.student;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.AssessmentResult;
import com.secj3303.model.AssessmentService;
import com.secj3303.model.User;

@Controller
@RequestMapping("/student/assessment")
public class AssessmentController {

    // --- ASSESSMENT LISTING PAGE (GET) ---
    @GetMapping("/")
    public String showAssessmentPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        return "/student/assessment-list"; // => /WEB-INF/views/student/assessment-list.jsp
    }

    // --- TAKE DAILY MOOD CHECK (GET) ---
    @GetMapping("/mood")
    public String showMoodAssessment(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", "mood");
        model.addAttribute("duration", "2 min");
        return "/student/mood-assessment";
    }

    // --- TAKE STRESS ASSESSMENT (GET) ---
    @GetMapping("/stress")
    public String showStressAssessment(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", "stress");
        model.addAttribute("duration", "5 min");
        return "/student/stress-assessment";
    }

    // --- TAKE ANXIETY SCREENING (GET) ---
    @GetMapping("/anxiety")
    public String showAnxietyAssessment(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", "anxiety");
        model.addAttribute("duration", "7 min");
        return "/student/anxiety-assessment";
    }

    // --- TAKE GENERAL WELLBEING ASSESSMENT (GET) ---
    @GetMapping("/wellbeing")
    public String showWellbeingAssessment(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", "wellbeing");
        model.addAttribute("duration", "10 min");
        return "/student/wellbeing-assessment";
    }

    // --- SUBMIT ASSESSMENT (POST) ---
    @PostMapping("/submit")
    public String submitAssessment(
            @RequestParam("assessmentType") String assessmentType,
            @RequestParam(value = "answers", required = false) String[] answersStr,
            Model model,
            HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        // Convert string answers to int array
        int[] answers = new int[0];
        if (answersStr != null && answersStr.length > 0) {
            answers = new int[answersStr.length];
            for (int i = 0; i < answersStr.length; i++) {
                try {
                    answers[i] = Integer.parseInt(answersStr[i]);
                } catch (NumberFormatException e) {
                    answers[i] = 0;
                }
            }
        }

        // Calculate result
        AssessmentResult result = AssessmentService.calculateResult(assessmentType, answers);

        // Add to model
        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", assessmentType);
        model.addAttribute("result", result);
        model.addAttribute("score", result.getOverallScore());
        model.addAttribute("category", result.getCategory());
        model.addAttribute("feedback", result.getFeedback());
        model.addAttribute("recommendations", result.getRecommendedActions());
        model.addAttribute("metrics", result.getMetrics());

        // Store in session for reference
        session.setAttribute("lastAssessmentResult", result);
        session.setAttribute("lastAssessmentType", assessmentType);

        return "/student/assessment-result"; // => /WEB-INF/views/student/assessment-result.jsp
    }

    // --- VIEW ASSESSMENT RESULTS (GET) ---
    @GetMapping("/results")
    public String viewAssessmentResults(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        AssessmentResult result = (AssessmentResult) session.getAttribute("lastAssessmentResult");
        String assessmentType = (String) session.getAttribute("lastAssessmentType");

        if (result == null) {
            return "redirect:/student/assessment/";
        }

        model.addAttribute("user", loggedInUser);
        model.addAttribute("assessmentType", assessmentType);
        model.addAttribute("result", result);
        model.addAttribute("score", result.getOverallScore());
        model.addAttribute("category", result.getCategory());
        model.addAttribute("feedback", result.getFeedback());
        model.addAttribute("recommendations", result.getRecommendedActions());
        model.addAttribute("metrics", result.getMetrics());

        return "/student/assessment-result";
    }
}
