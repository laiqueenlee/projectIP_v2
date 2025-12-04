package com.secj3303.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MhpSlotRepository {

    private static Map<String, List<String>> mhpSlots = new HashMap<>();

    public static void addSlots(String mhpUsername, List<String> slots) {
        mhpSlots.put(mhpUsername, new ArrayList<>(slots));
    }

    public static List<String> getAvailableSlots(String mhpUsername) {
        List<String> slots = mhpSlots.getOrDefault(mhpUsername, new ArrayList<>());
        List<VirtualSession> bookedSessions = VirtualSessionRepository.findByMhpUsername(mhpUsername);
        List<String> bookedTimes = new ArrayList<>();
        for (VirtualSession vs : bookedSessions) {
            bookedTimes.add(vs.getTime());
        }

        List<String> available = new ArrayList<>();
        for (String slot : slots) {
            if (!bookedTimes.contains(slot)) {
                available.add(slot);
            }
        }
        return available;
    }

}

