package com.secj3303.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // Landing page at root
    @GetMapping({"/", "/landing", "/home"})
    public String landing(Model model) {
        // you can add data to model if needed
        return "/home"; // -> /WEB-INF/views/home.jsp
    }
}