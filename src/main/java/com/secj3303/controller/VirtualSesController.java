package com.secj3303.controller;

// import java.util.List;
// import java.util.Map;
// import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// import com.secj3303.model.MhpSlotRepository;
import com.secj3303.model.Role;
import com.secj3303.model.User;
// import com.secj3303.model.UserRepository;
// import com.secj3303.model.VirtualSession;
import com.secj3303.model.VirtualSessionRepository;
import com.secj3303.model.VirtualSession;

@Controller
@RequestMapping("/sessions")
public class VirtualSesController {

    
    @GetMapping("/book")
    public String studBookSes(HttpSession session, Model model) {
        // User user = (User) session.getAttribute("loggedInUser");
        // if (user == null || user.getRole() != Role.STUDENT) {
        //     return "redirect:/auth/login";
        // }

        // List<User> mhps = UserRepository.getAllUsers().stream()
        //         .filter(u -> u.getRole() == Role.MENTAL_HEALTH_PROFESSIONAL)
        //         .toList();
        // model.addAttribute("user", user);
        // model.addAttribute("mhps", mhps);

        // Map<String, List<String>> slotsMap = mhps.stream()
        //         .collect(Collectors.toMap(
        //                 User::getUsername,
        //                 u -> MhpSlotRepository.getAvailableSlots(u.getUsername())
        //         ));
        // model.addAttribute("availableSlotsMap", slotsMap);

        return "virtualSes/book-session-page"; 
    } 

    @PostMapping("/book")
    // public String processStudentBooking(@RequestParam("mhpUsername") String mhpUsername,
    //                                     @RequestParam("time") String time,
    //                                     HttpSession session,
    //                                     Model model) {
    public String processStudentBooking(HttpSession session,
                                        Model model) {
        User student = (User) session.getAttribute("loggedInUser");
        if (student == null || student.getRole() != Role.STUDENT) {
            return "redirect:/auth/login";
        }

        // User mhp = UserRepository.findByUsername(mhpUsername);
        // if (mhp == null || mhp.getRole() != Role.MENTAL_HEALTH_PROFESSIONAL) {
        //     model.addAttribute("error", "Selected MHP does not exist.");
        //     return studBookSes(session, model);
        // }

        // List<String> availableSlots = MhpSlotRepository.getAvailableSlots(mhp.getUsername());
        // if (!availableSlots.contains(time)) {
        //     model.addAttribute("error", "Selected slot is no longer available.");
        //     return studBookSes(session, model);
        // }

        // VirtualSession sessionObj = new VirtualSession();
        // sessionObj.setStudent(student);
        // sessionObj.setMhp(mhp);
        // sessionObj.setTime(time);
        // sessionObj.setConfirmed(false);
        // VirtualSessionRepository.save(sessionObj);

        // model.addAttribute("message", "Session request sent. Waiting for MHP confirmation.");
        return "virtualSes/book-session-form";
    }

    

    @GetMapping("/confirm")
    public String mhpConfirmPage(HttpSession session, Model model) {
        User mhp = (User) session.getAttribute("loggedInUser");
        if (mhp == null || mhp.getRole() != Role.MENTAL_HEALTH_PROFESSIONAL) {
            return "redirect:/auth/login";
        }

        // model.addAttribute("pendingSessions",
        //         VirtualSessionRepository.findPendingByMhpUsername(mhp.getUsername()));
        return "virtualSes/confirm-session-page"; 
    }

    @PostMapping("/confirm")
    public String processMhpConfirmation(@RequestParam("sessionId") String sessionId) {
        // VirtualSession sessionObj = VirtualSessionRepository.findById(sessionId);
        // if (sessionObj != null) {
        //     sessionObj.setConfirmed(true);
        //     VirtualSessionRepository.save(sessionObj);
        // }
        return "redirect:/sessions/confirm";
    }

        //@GetMapping("/detail/{sessionId}")
        @GetMapping("/detail")
        //public String sessionDetail(@PathVariable String sessionId, Model model, HttpSession httpSession) {
        public String sessionDetail(Model model, HttpSession httpSession) {
            // VirtualSession sessionObj = VirtualSessionRepository.findById(sessionId);
            // model.addAttribute("session", sessionObj);
            return "virtualSes/session-detail"; 
        }

    
    @GetMapping("/meeting")
    public String virtualMeetingPage(@RequestParam("sessionId") String sessionId,
                                     HttpSession session,
                                     Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/auth/login";
        }

        // VirtualSession sessionObj = VirtualSessionRepository.findById(sessionId);
        // if (sessionObj == null) {
        //     model.addAttribute("error", "Session not found");
        //     return "error";
        // }

        // // Only allow student or MHP involved to enter
        // if (!sessionObj.getStudent().getUsername().equals(user.getUsername()) &&
        //     !sessionObj.getMhp().getUsername().equals(user.getUsername())) {
        //     model.addAttribute("error", "Access denied");
        //     return "error";
        // }

        // model.addAttribute("session", sessionObj);
        return "virtualSes/virtual-session-meeting"; 
    }
}
