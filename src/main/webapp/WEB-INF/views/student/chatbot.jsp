<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Mental Health Assistant</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
            background-color: #f9fafb;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: #fff;
            padding: 12px 30px;
            border-bottom: 1px solid #e5e7eb;
        }

        .header h1 {
            font-size: 20px;
            font-weight: 600;
            color: #1f2937;
        }

        .chat-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
            padding: 20px 20px;
            min-height: 0;
        }

        .assistant-header {
            background-color: #f3f4f6;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            flex-shrink: 0;
        }

        .assistant-icon {
            font-size: 18px;
        }

        .assistant-info h2 {
            font-size: 14px;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 2px;
        }

        .assistant-info p {
            font-size: 12px;
            color: #6b7280;
        }

        .chat-box {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
            overflow-y: auto;
        }

        .chat-box::-webkit-scrollbar {
            width: 6px;
        }

        .chat-box::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .chat-box::-webkit-scrollbar-thumb {
            background: #d1d5db;
            border-radius: 3px;
        }

        .chat-box::-webkit-scrollbar-thumb:hover {
            background: #9ca3af;
        }

        .empty-state {
            text-align: center;
            max-width: 400px;
            margin: auto;
        }

        .empty-icon {
            font-size: 40px;
            color: #d1d5db;
            margin-bottom: 12px;
        }

        .empty-text {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 16px;
        }

        .suggestion {
            background-color: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 13px;
            color: #374151;
            cursor: pointer;
            transition: all 0.2s;
            text-align: left;
        }

        .suggestion:hover {
            background-color: #f3f4f6;
            border-color: #d1d5db;
        }

        .chat-message {
            padding: 10px 14px;
            margin-bottom: 10px;
            border-radius: 8px;
            max-width: 80%;
            word-wrap: break-word;
            font-size: 14px;
            line-height: 1.5;
        }

        .bot-message {
            background-color: #f3f4f6;
            align-self: flex-start;
            color: #1f2937;
        }

        .user-message {
            background-color: #3b82f6;
            color: white;
            align-self: flex-end;
        }

        .input-container {
            padding: 15px 20px;
            background-color: #fff;
            border-top: 1px solid #e5e7eb;
            flex-shrink: 0;
        }

        .input-wrapper {
            max-width: 900px;
            margin: 0 auto;
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .input-box {
            flex: 1;
            padding: 12px 16px;
            border-radius: 24px;
            border: 1px solid #e5e7eb;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
        }

        .input-box:focus {
            border-color: #3b82f6;
        }

        .send-button {
            background-color: #d1fae5;
            color: #065f46;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.2s;
        }

        .send-button:hover {
            background-color: #a7f3d0;
        }

        .send-button:disabled {
            background-color: #e5e7eb;
            color: #9ca3af;
            cursor: not-allowed;
        }

        .messages-area {
            display: none;
            flex-direction: column;
            width: 100%;
            padding: 10px 0;
        }

        .messages-area.active {
            display: flex;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Hello, Alex</h1>
    </div>

    <div class="chat-container">
        <div class="assistant-header">
            <div class="assistant-icon">🧠</div>
            <div class="assistant-info">
                <h2>AI Mental Health Assistant</h2>
                <p>Get personalized mental health guidance and support.</p>
            </div>
        </div>
        
        <div class="chat-box" id="chatBox">
            <div class="empty-state" id="emptyState">
                <div class="empty-icon">✨</div>
                <p class="empty-text">Start a conversation with the AI assistant</p>
                <div class="suggestion" onclick="fillPrompt('Teach me how to manage stress')">
                    Teach me how to manage stress
                </div>
            </div>

            <div class="messages-area" id="messagesArea">
                <!-- Messages will appear here -->
            </div>
        </div>
    </div>

    <div class="input-container">
        <div class="input-wrapper">
            <input type="text" class="input-box" id="userMessage" placeholder="Type your message...">
            <button class="send-button" id="sendButton" onclick="sendMessage()">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z"/>
                </svg>
            </button>
        </div>
    </div>

    <script>
        function fillPrompt(text) {
            document.getElementById("userMessage").value = text;
            document.getElementById("userMessage").focus();
        }

        function sendMessage() {
            var userMessage = document.getElementById("userMessage").value;
            if (userMessage.trim() === "") return;

            var emptyState = document.getElementById("emptyState");
            var messagesArea = document.getElementById("messagesArea");
            var chatBox = document.getElementById("chatBox");

            // Hide empty state and show messages area
            if (emptyState.style.display !== "none") {
                emptyState.style.display = "none";
                messagesArea.classList.add("active");
            }

            // Display user message
            var userDiv = document.createElement("div");
            userDiv.classList.add("chat-message", "user-message");
            userDiv.textContent = userMessage;
            messagesArea.appendChild(userDiv);

            // Scroll to the bottom
            chatBox.scrollTop = chatBox.scrollHeight;

            // Clear the input box
            document.getElementById("userMessage").value = "";

            // Simulate typing indicator
            var typingDiv = document.createElement("div");
            typingDiv.classList.add("chat-message", "bot-message");
            typingDiv.id = "typingIndicator";
            typingDiv.textContent = "AI is typing...";
            messagesArea.appendChild(typingDiv);
            chatBox.scrollTop = chatBox.scrollHeight;

            // Simulate bot response
            setTimeout(function() {
                // Remove typing indicator
                var indicator = document.getElementById("typingIndicator");
                if (indicator) {
                    indicator.remove();
                }

                var botResponse = getBotResponse(userMessage);

                var botDiv = document.createElement("div");
                botDiv.classList.add("chat-message", "bot-message");
                botDiv.textContent = botResponse;
                messagesArea.appendChild(botDiv);

                // Scroll to the bottom
                chatBox.scrollTop = chatBox.scrollHeight;
            }, 1500);
        }

        function getBotResponse(message) {
            message = message.toLowerCase();
            
            if (message.includes("stress")) {
                return "Managing stress is important for your mental health. Here are some techniques: practice deep breathing exercises, maintain a regular sleep schedule, engage in physical activity, and consider mindfulness meditation. Would you like more specific guidance on any of these techniques?";
            } else if (message.includes("anxiety")) {
                return "I understand dealing with anxiety can be challenging. Some helpful strategies include: grounding techniques like the 5-4-3-2-1 method, progressive muscle relaxation, regular exercise, and talking to someone you trust. If anxiety persists, consider reaching out to a mental health professional.";
            } else if (message.includes("sleep")) {
                return "Good sleep hygiene is crucial for mental health. Try establishing a consistent bedtime routine, avoiding screens before bed, keeping your bedroom cool and dark, and limiting caffeine in the afternoon. How has your sleep been lately?";
            } else if (message.includes("depression") || message.includes("sad")) {
                return "I'm sorry you're feeling this way. Depression is a serious condition, but there are ways to help manage it. Consider talking to a mental health professional, maintaining social connections, exercising regularly, and establishing a daily routine. Remember, it's okay to ask for help.";
            } else if (message.includes("meditation") || message.includes("mindfulness")) {
                return "Mindfulness and meditation are excellent practices for mental well-being. Start with just 5 minutes a day: find a quiet space, focus on your breathing, and gently bring your attention back when your mind wanders. Apps like Headspace or Calm can guide you through the process.";
            } else {
                return "Thank you for sharing. I'm here to support you with mental health guidance. You can ask me about stress management, anxiety coping strategies, sleep improvement, mindfulness practices, or any other mental health topics you'd like to discuss.";
            }
        }

        // Allow sending message with Enter key
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById("userMessage").addEventListener("keypress", function(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    sendMessage();
                }
            });
        });
    </script>

</body>
</html>