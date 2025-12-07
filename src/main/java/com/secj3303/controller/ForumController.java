package com.secj3303.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.secj3303.model.User; // Ensure you have this import based on your model

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class ForumController {

    // 1. STATIC LIST: in-memory posts store
    private static List<Map<String, String>> posts = new ArrayList<>();

    // 2. STATIC BLOCK: initialize sample data
    static {
        posts.add(makePost("1", "Managing exam stress - what works for you?", "Anonymous", "Stress",
                "Finals are coming up and I'm feeling overwhelmed. What strategies have helped you cope with academic pressure?",
                "A", "Moderated", "24", "18", "2 hours ago"));

        posts.add(makePost("2", "How to deal with imposter syndrome", "Anonymous", "Anxiety",
                "Sometimes I feel like I don't belong here and everyone is better than me. Can anyone relate?",
                "A", "Moderated", "43", "31", "1 day ago"));

        posts.add(makePost("3", "Small wins: share one thing you accomplished today", "StudentUser", "Wellness",
                "I finished a short workout and it really lifted my mood — what about you?",
                "S", "Moderated", "12", "6", "3 hours ago"));
    }

    // --- PAGE ROUTES ---

    @GetMapping("/student/forum")
    public String forumIndex(Model model) {
        model.addAttribute("posts", posts);
        return "student/peer";
    }

    @GetMapping("/student/new-post")
    public String showCreatePostPage() {
        return "student/new-post";
    }

    // --- ACTION ROUTES ---

    @PostMapping("/forum/submit-post")
    public String submitPost(
            @RequestParam("postTitle") String title,
            @RequestParam("postContent") String content,
            @RequestParam("category") String category,
            @RequestParam(value = "postAnonymously", required = false) String anonymous,
            Model model,
            HttpSession session // <--- Added Session to get the logged-in user
    ) {
        // 1. Generate new ID
        int maxId = posts.stream()
                .mapToInt(p -> Integer.parseInt(p.get("id")))
                .max()
                .orElse(0);
        String newId = String.valueOf(maxId + 1);

        // 2. Determine Author and Avatar logic
        String author = "Student User"; // Default fallback
        String avatar = "S";

        if (anonymous != null) {
            // Case A: User checked "Post Anonymously"
            author = "Anonymous";
            avatar = "A";
        } else {
            // Case B: Public Post - Get User from Session
            Object logged = session.getAttribute("loggedInUser");
            if (logged instanceof User) {
                User u = (User) logged;
                // Use Full Name if available, otherwise Username
                if (u.getFullName() != null && !u.getFullName().isEmpty()) {
                    author = u.getFullName();
                } else {
                    author = u.getUsername();
                }
                
                // create an initial for the avatar (e.g., "Ali" -> "A")
                if (author != null && !author.isEmpty()) {
                    avatar = author.substring(0, 1).toUpperCase();
                }
            }
        }

        // 3. Create the post map
        Map<String, String> newPost = makePost(
                newId,
                title,
                author,
                category,
                content,
                avatar,
                "", // no badge
                "0", // likes
                "0", // replies
                "Just now"
        );

        // 4. Add new post at top of list
        posts.add(0, newPost);

        // 5. Prepare model for the success view
        model.addAttribute("replies", Collections.emptyList());
        model.addAttribute("newPost", newPost);
        model.addAttribute("posts", posts);

        // Return to the "Post Created" view (using new-post.jsp logic)
        return "student/new-post";
    }

    // --- VIEW SINGLE POST ---

    @GetMapping("/forum/post")
    public String viewPostByParam(@RequestParam(name = "id", required = false, defaultValue = "1") String id,
                                  Model model) {
        return viewPostById(id, model);
    }

    @GetMapping("/forum/post/{id}")
    public String viewPostByPath(@PathVariable String id, Model model) {
        return viewPostById(id, model);
    }

    private String viewPostById(String id, Model model) {
        Map<String, String> foundPost = posts.stream()
                .filter(p -> p.get("id").equals(id))
                .findFirst()
                .orElse(null);

        if (foundPost != null) {
            model.addAttribute("post", foundPost);

            // Limit replies logic
            List<Map<String, String>> allReplies = sampleReplies();
            int targetCount = 0;
            try {
                targetCount = Integer.parseInt(foundPost.getOrDefault("replyCount", "0"));
            } catch (NumberFormatException e) {
                targetCount = Math.min(allReplies.size(), 5);
            }
            if (targetCount > allReplies.size()) {
                targetCount = allReplies.size();
            }
            List<Map<String, String>> limitedReplies = allReplies.subList(0, targetCount);
            model.addAttribute("replies", limitedReplies);
            return "student/post";
        } else {
            return "redirect:/student/forum";
        }
    }

    // --- HELPERS ---

    private static Map<String, String> makePost(String id, String title, String author, String category, String content,
                                                String avatar, String badge, String likes, String replyCount, String time) {
        Map<String, String> p = new HashMap<>();
        p.put("id", id);
        p.put("title", title);
        p.put("author", author);
        p.put("category", category);
        p.put("excerpt", content);
        p.put("content", content);
        p.put("avatar", avatar);
        p.put("badge", badge);
        p.put("likes", likes);
        p.put("replyCount", replyCount);
        p.put("time", time);
        return p;
    }

    private List<Map<String,String>> sampleReplies() {
        // (Your existing sample replies code remains here...)
        List<Map<String,String>> replies = new ArrayList<>();
        replies.add(makeReply("Relax_Bro", "Ali • 1 hour ago", "Take deep breaths and remember that exams don't define you. You've got this!", "R"));
        // ... (truncated for brevity, keep your original list)
        return replies;
    }

    private Map<String,String> makeReply(String author, String time, String content, String avatar) {
        Map<String,String> r = new HashMap<>();
        r.put("author", author);
        r.put("time", time);
        r.put("content", content);
        r.put("avatar", avatar);
        return r;
    }

    @PostMapping("/forum/addReply")
    public String addReply(
            @RequestParam("postId") String postId,
            @RequestParam("content") String content,
            Model model,
            HttpSession session
    ) {
        // Find post
        Map<String, String> foundPost = posts.stream()
                .filter(p -> p.get("id").equals(postId))
                .findFirst()
                .orElse(null);

        if (foundPost == null) {
            return "redirect:/student/forum";
        }

        // Determine author from session
        String author = "Current User";
        Object logged = session.getAttribute("loggedInUser");
        if (logged instanceof User) {
            User u = (User) logged;
            if (u.getFullName() != null && !u.getFullName().isEmpty()) {
                author = u.getFullName();
            } else if (u.getUsername() != null && !u.getUsername().isEmpty()) {
                author = u.getUsername();
            }
        }

        // Create new reply
        Map<String, String> newReply = new HashMap<>();
        newReply.put("author", author);
        newReply.put("time", "Just now");
        newReply.put("content", content);
        newReply.put("avatar", author.substring(0, 1).toUpperCase());

        // Update counts
        int newCount = 1;
        try {
            int rc = Integer.parseInt(foundPost.getOrDefault("replyCount", "0"));
            newCount = rc + 1;
        } catch (NumberFormatException ignored) {
            newCount = 1;
        }
        foundPost.put("replyCount", String.valueOf(newCount));

        // Logic to simulate adding reply to the top
        List<Map<String, String>> allReplies = new ArrayList<>(sampleReplies());
        allReplies.add(0, newReply);
        
        int targetCount = newCount;
        if (targetCount > allReplies.size()) targetCount = allReplies.size();
        
        List<Map<String, String>> limitedReplies = new ArrayList<>(allReplies.subList(0, targetCount));

        model.addAttribute("post", foundPost);
        model.addAttribute("replies", limitedReplies);

        return "student/newreply";
    }
}