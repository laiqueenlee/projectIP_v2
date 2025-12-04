package com.secj3303.model;

import java.util.HashMap;
import java.util.Map;

public class ChatbotModel {

    // A map to hold the question and static responses
    private static final Map<String, String> responses = new HashMap<>();

    static {
        responses.put("profile", "Your profile details are as follows...");
        responses.put("dashboard", "Here is your student dashboard...");
        responses.put("logout", "You have successfully logged out.");
        responses.put("default", "I'm sorry, I didn't understand that. Can you ask something else?");
    }

    // Method to get a response based on a question
    public String getResponse(String question) {
        return responses.getOrDefault(question.toLowerCase(), responses.get("default"));
    }
}
