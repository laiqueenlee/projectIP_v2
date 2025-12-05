package com.secj3303.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.EducationalModule;
import com.secj3303.model.User;

@Controller
@RequestMapping("/content") 
public class EducationController {

    // --- 1. LIST PAGE (/content/browse) ---
    @GetMapping("/browse")
    public String showEducationPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", loggedInUser);

        List<EducationalModule> modules = new ArrayList<>();
        
        modules.add(new EducationalModule("1", "Understanding Mental Health", "Introduces students to the basics of mental health.", "2 min", "fas fa-heartbeat", "/content/module/1", "Article"));
        modules.add(new EducationalModule("2", "Recognizing Signs and Symptoms", "Helps students identify early warning signs.", "10 min", "fas fa-chart-line", "/content/module/2", "Video"));
        modules.add(new EducationalModule("3", "Coping Strategies and Self Care", "Focuses on practical ways to manage stress.", "7 min", "fas fa-spa", "/content/module/3", "Interactive"));
        modules.add(new EducationalModule("4", "Supporting Peers", "Builds skills to support friends.", "15 min", "fas fa-check-circle", "/content/module/4", "Article"));

        model.addAttribute("modules", modules);
        return "/student/education"; 
    }

    // --- 2. SPECIFIC MODULE CONTENT ---
    @GetMapping("/module/{moduleId}")
    public String showModuleContent(@PathVariable String moduleId, 
                                    @RequestParam(defaultValue = "1") int page, 
                                    Model model, 
                                    HttpSession session) {
        
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) return "redirect:/auth/login";

        model.addAttribute("moduleId", moduleId);
        model.addAttribute("currentPage", page);
        model.addAttribute("nextPage", page + 1);

        // --- MODULE 1: Understanding Mental Health (Article) ---
        if ("1".equals(moduleId)) {
            model.addAttribute("moduleTitle", "Understanding Mental Health");
            model.addAttribute("moduleSubtitle", "Introduces students to the basics of mental health, its importance, and it affects daily life.");

            Map<String, String> content = new HashMap<>();
            if (page == 1) {
                content.put("html", 
                    "<h3>1.1 Definition of Mental Health</h3>" +
                    "<p>Mental health refers to a state of emotional, psychological, and social well-being in which a person can use their abilities, cope with normal stresses, work productively, and contribute to their community.</p>" +
                    "<h3>1.2 Importance of Mental Health</h3>" +
                    "<p>Good mental health allows us to: Think clearly, make good decisions, and build healthy relationships.</p>" +
                    "<ul><li>Build healthy relationships with friends, family, and peers.</li><li>Handle academic and life challenges with resilience.</li><li>Stay motivated and confident.</li></ul>" +
                    "<h3>1.3 Common Myths and Misconceptions</h3>" +
                    "<p>There are many misunderstandings about mental health that create stigma. One common myth is that mental health problems only affect weak people. In reality, they can happen to anyone.</p>" +
                    "<h3>1.4 Why Mental Health Matters for Students</h3>" +
                    "<p>University life is an exciting phase filled with new opportunities, but it also brings stress from academic pressure and social adjustments.</p>"
                );
            } else if (page == 2) {
                 content.put("html", 
                    "<h3>2.0 Factors Affecting Mental Health</h3>" +
                    "<p>Mental health is shaped by a complex interaction of biological, psychological, and social factors.</p>" +
                    "<h3>2.1 Biological Factors</h3>" +
                    "<p>Biological factors include genetic, neurological, and physical components.</p>" +
                    "<h3>2.2 Psychological Factors</h3>" +
                    "<p>Psychological factors refer to internal emotional processes, coping styles, and thought patterns.</p>"
                  );
            } else {
                 content.put("html", "<h3>Conclusion</h3><p>You have completed this module.</p>");
                 model.addAttribute("isComplete", true);
            }
            model.addAttribute("contentHtml", content.get("html"));
            return "/student/module-content"; 
        }

        // --- MODULE 2: Recognizing Signs (Video) ---
        else if ("2".equals(moduleId)) {
            model.addAttribute("moduleTitle", "Recognizing Signs and Symptoms");
            model.addAttribute("moduleSubtitle", "Watch this guided session to learn how to identify early warning signs.");
            model.addAttribute("videoUrl", "https://www.youtube.com/embed/1i9OktVk5VE"); 
            return "/student/module-video"; 
        }

        // --- MODULE 3: Coping Strategies (Interactive/Quiz) ---
        else if ("3".equals(moduleId)) {
            model.addAttribute("moduleTitle", "Coping Strategies and Self Care");
            model.addAttribute("moduleSubtitle", "Focuses on practical ways to manage stress and maintain mental balance.");

            if (page == 1) {
                String htmlContent = 
                    "<h3>Understanding Stress Management</h3>" +
                    "<p>Stress is a natural reaction to life's challenges, but chronic stress can harm your health. Effective management involves identifying triggers and using positive coping mechanisms.</p>" +
                    "<h3>Healthy Coping Mechanisms</h3>" +
                    "<ul>" +
                    "<li><strong>Mindfulness & Meditation:</strong> Staying present can reduce anxiety.</li>" +
                    "<li><strong>Physical Activity:</strong> Exercise releases endorphins that boost mood.</li>" +
                    "<li><strong>Social Support:</strong> Talking to trusted friends or counselors helps process emotions.</li>" +
                    "</ul>" +
                    "<h3>Self-Care Essentials</h3>" +
                    "<p>Self-care isn't a luxury; it's necessary maintenance. Prioritize sleep (7-9 hours), eat balanced meals, and take breaks when studying.</p>";
                
                model.addAttribute("contentHtml", htmlContent);
                return "/student/module-content";
            } else {
                List<Map<String, Object>> quizQuestions = new ArrayList<>();
                
                Map<String, Object> q1 = new HashMap<>();
                q1.put("id", 1);
                q1.put("question", "Which of the following is considered a healthy coping strategy for academic stress?");
                q1.put("options", Arrays.asList("Pulling an all-nighter with energy drinks", "Practicing mindfulness and deep breathing", "Isolating yourself from friends", "Skipping meals to save time"));
                q1.put("correctIndex", 1); 
                quizQuestions.add(q1);

                Map<String, Object> q2 = new HashMap<>();
                q2.put("id", 2);
                q2.put("question", "True or False: Self-care is selfish and should only be done when you have free time.");
                q2.put("options", Arrays.asList("True", "False"));
                q2.put("correctIndex", 1); 
                quizQuestions.add(q2);

                Map<String, Object> q3 = new HashMap<>();
                q3.put("id", 3);
                q3.put("question", "If you notice a friend withdrawing socially and acting differently, what is the best approach?");
                q3.put("options", Arrays.asList("Ignore them until they come to you", "Tell them to 'cheer up'", "Ask them gently how they are doing and listen", "Post about it on social media"));
                q3.put("correctIndex", 2); 
                quizQuestions.add(q3);

                model.addAttribute("quizQuestions", quizQuestions);
                model.addAttribute("moduleSubtitle", "Test your knowledge on healthy coping mechanisms and self-care practices.");
                return "/student/module-quiz";
            }
        }

        // --- MODULE 4: Supporting Peers (Article) ---
        else if ("4".equals(moduleId)) {
            model.addAttribute("moduleTitle", "Supporting Peers");
            model.addAttribute("moduleSubtitle", "Builds skills to support friends and maintain healthy boundaries.");

            Map<String, String> content = new HashMap<>();
            
            // Page 1: Active Listening
            if (page == 1) {
                content.put("html", 
                    "<h3>The Power of Active Listening</h3>" +
                    "<p>Supporting a peer often starts with simply showing up and listening. You don't need to have all the answers or 'fix' their problems.</p>" +
                    "<ul>" +
                    "<li><strong>Listen to understand, not to reply:</strong> Focus entirely on what they are saying rather than planning your response.</li>" +
                    "<li><strong>Validate their feelings:</strong> Use phrases like \"That sounds really difficult\" or \"I'm sorry you're going through this.\"</li>" +
                    "</ul>" +
                    "<h3>What to Avoid</h3>" +
                    "<p>Avoid toxic positivity (e.g., \"Just choose to be happy!\") or minimizing their struggles (e.g., \"Others have it worse\"). These responses can make people feel unheard.</p>"
                );
            } 
            // Page 2: Recognizing Signs & Resources
            else if (page == 2) {
                content.put("html", 
                    "<h3>Recognizing Warning Signs</h3>" +
                    "<p>Be observant of changes in your friends' behavior, such as drastic mood swings, withdrawal from social activities, or changes in sleeping/eating habits.</p>" +
                    "<h3>Knowing Your Limits</h3>" +
                    "<p>You are a friend, not a counselor. It is important to set boundaries to protect your own mental well-being.</p>" +
                    "<h3>Referral Resources</h3>" +
                    "<p>If a friend is in distress, encourage them to seek professional help. You can say, \"I care about you and I think speaking to a professional could really help. I can help you find the number if you like.\"</p>"
                );
            } 
            // Conclusion
            else {
                 content.put("html", "<h3>Module Complete</h3><p>You have reviewed the key principles of supporting peers. Remember, being there is what counts.</p>");
                 model.addAttribute("isComplete", true);
            }
            
            model.addAttribute("contentHtml", content.get("html"));
            return "/student/module-content"; 
        }
        
        return "redirect:/content/browse";
    }
}