package com.secj3303.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.secj3303.model.ModerationItem;
import com.secj3303.model.ModerationRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @GetMapping("/content_quality")
    public String showContentQualityPage() {
        return "/admin/content_quality"; 
    }

    @GetMapping("/moderation_queue")
    public String showModerationQueue(Model model) {
        // Fetch data from the Repository
        model.addAttribute("queueItems", ModerationRepository.getAll());
        return "/admin/moderation_queue";
    }

    @PostMapping("/approve")
    public String approveContent(@RequestParam("id") String id) {
        // Call Repository to remove/approve
        ModerationRepository.delete(id); 
        return "redirect:/admin/moderation_queue";
    }

    @PostMapping("/delete")
    public String deleteContent(@RequestParam("id") String id) {
        // Call Repository to delete
        ModerationRepository.delete(id);
        return "redirect:/admin/moderation_queue";
    }
}