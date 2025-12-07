package com.secj3303.model;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ModerationRepository {
    
    // This acts as our "Fake Database"
    private static List<ModerationItem> queue = new ArrayList<>();

    // Initialize with some dummy data
    static {
        queue.add(new ModerationItem("1", "Forum Post", "high", "Struggling with exam anxiety", "Anonymous", "Potential crisis", "I feel like I can't breathe every time I think about the finals. I don't know if I can keep going like this. It feels simpler to just give up entirely."));
        queue.add(new ModerationItem("2", "Comment", "medium", "Re: Coping strategies", "Student123", "Inappropriate language","That advice is completely stupid. You are an idiot if you believe that works."));
        queue.add(new ModerationItem("3", "Article", "low", "Managing Depression", "Dr. Smith", "Pending review","Depression is a common mental disorder. Globally, it is estimated that 5% of adults suffer from depression. This article explores cognitive behavioral techniques..."));
    }

    // Get all items
    public static List<ModerationItem> getAll() {
        return new ArrayList<>(queue); // Return a copy to be safe
    }

    // Find item by ID
    public static ModerationItem findById(String id) {
        return queue.stream()
                .filter(item -> item.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    // Remove item (Simulates Approval or Deletion)
    public static void delete(String id) {
        queue.removeIf(item -> item.getId().equals(id));
    }

    // Add new item (Useful if you want to test adding later)
    public static void add(ModerationItem item) {
        queue.add(item);
    }
}