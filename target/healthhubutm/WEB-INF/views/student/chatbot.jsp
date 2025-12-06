<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8fafb; /* MindWell light grey background */
            height: 100vh;
            display: flex;
            flex-direction: column;
            color: #1a1a1a;
        }

        /* --- Header Styling (Fixed Layout) --- */
        .page-header-strip {
            background-color: #fff;
            border-bottom: 1px solid #e5e7eb;
            width: 100%;
        }

        .header-inner-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 16px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header-title h1 {
            font-size: 24px;
            font-weight: 700;
            color: #1a1a1a;
        }

        .header-title p {
            font-size: 14px;
            color: #666;
            margin-top: 2px;
        }

        /* --- Button Styling --- */
        .btn-back {
            display: inline-flex;
            align-items: center;
            padding: 8px 16px;
            background-color: white;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            color: #666;
            font-weight: 600;
            font-size: 14px;
            text-decoration: none;
            transition: all 0.2s;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
        }

        .btn-back:hover {
            border-color: #5dd5c3; /* MindWell Teal */
            color: #5dd5c3;
            transform: translateY(-1px);
        }

        /* --- Chat Layout --- */
        .chat-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
            padding: 24px 20px 0 20px; /* Added top padding */
            min-height: 0;
        }

        .assistant-header {
            background-color: #fff; /* Changed to white for card look */
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-shrink: 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }

        .assistant-icon {
            font-size: 24px;
            background: #e0f7f4;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .assistant-info h2 {
            font-size: 16px;
            font-weight: 700;
            color: #1a1a1a;
        }

        .assistant-info p {
            font-size: 13px;
            color: #666;
        }

        .chat-box {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
            overflow-y: auto;
            padding-bottom: 20px;
        }

        /* Scrollbar Styling */
        .chat-box::-webkit-scrollbar { width: 6px; }
        .chat-box::-webkit-scrollbar-track { background: transparent; }
        .chat-box::-webkit-scrollbar-thumb { background: #d1d5db; border-radius: 3px; }

        /* Empty State */
        .empty-state {
            text-align: center;
            margin: auto;
            padding: 40px;
        }

        .empty-icon { font-size: 48px; margin-bottom: 16px; opacity: 0.5; }
        
        .empty-text {
            font-size: 15px;
            color: #666;
            margin-bottom: 24px;
        }

        .suggestion {
            background-color: white;
            border: 1px solid #e5e7eb;
            border-radius: 24px; /* Pill shape */
            padding: 10px 20px;
            font-size: 14px;
            color: #1a1a1a;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-block;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
        }

        .suggestion:hover {
            border-color: #5dd5c3;
            color: #5dd5c3;
        }

        /* Messages */
        .chat-message {
            padding: 12px 16px;
            margin-bottom: 12px;
            border-radius: 12px;
            max-width: 80%;
            font-size: 15px;
            line-height: 1.5;
        }

        .bot-message {
            background-color: #fff;
            border: 1px solid #e5e7eb;
            align-self: flex-start;
            color: #1f2937;
            border-bottom-left-radius: 2px;
        }

        .user-message {
            background-color: #5dd5c3; /* MindWell Teal */
            color: white;
            align-self: flex-end;
            border-bottom-right-radius: 2px;
            box-shadow: 0 1px 2px rgba(93, 213, 195, 0.3);
        }

        /* Input Area */
        .input-container {
            background-color: #fff;
            border-top: 1px solid #e5e7eb;
            padding: 20px 0;
            flex-shrink: 0;
        }

        .input-wrapper {
            max-width: 900px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .input-box {
            flex: 1;
            padding: 14px 20px;
            border-radius: 24px;
            border: 1px solid #e5e7eb;
            font-size: 15px;
            outline: none;
            background-color: #f9fafb;
            transition: all 0.2s;
        }

        .input-box:focus {
            border-color: #5dd5c3;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(93, 213, 195, 0.1);
        }

        .send-button {
            background-color: #5dd5c3;
            color: white;
            border: none;
            border-radius: 50%;
            width: 44px;
            height: 44px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.2s;
            box-shadow: 0 2px 4px rgba(93, 213, 195, 0.3);
        }

        .send-button:hover {
            background-color: #4cc4b3;
            transform: translateY(-1px);
        }

        .messages-area {
            display: none;
            flex-direction: column;
            width: 100%;
        }

        .messages-area.active { display: flex; }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
    
    <c:choose>
        <c:when test="${not empty loggedInUser.fullName}">
            <c:set var="displayName" value="${loggedInUser.fullName}"/>
        </c:when>
        <c:otherwise>
            <c:set var="displayName" value="${loggedInUser.username}"/>
        </c:otherwise>
    </c:choose>

    <div class="page-header-strip">
        <div class="header-inner-container">
            <div class="header-title">
                <h1>Hello, <c:out value="${displayName}" default="Student"/></h1>
                </div>
            
            <a href="#" class="btn-back" onclick="if(history.length>1){ history.back(); } else { window.location.href='${pageContext.request.contextPath}/'; } return false;">
                ← Back
            </a>
        </div>
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
                </div>
        </div>
    </div>

    <div class="input-container">
        <div class="input-wrapper">
            <input type="text" class="input-box" id="userMessage" placeholder="Type your message...">
            <button class="send-button" id="sendButton" onclick="sendMessage()">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="22" y1="2" x2="11" y2="13"></line>
                    <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
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

            if (emptyState.style.display !== "none") {
                emptyState.style.display = "none";
                messagesArea.classList.add("active");
            }

            // User Message
            var userDiv = document.createElement("div");
            userDiv.classList.add("chat-message", "user-message");
            userDiv.textContent = userMessage;
            messagesArea.appendChild(userDiv);

            chatBox.scrollTop = chatBox.scrollHeight;
            document.getElementById("userMessage").value = "";

            // Typing Indicator
            var typingDiv = document.createElement("div");
            typingDiv.classList.add("chat-message", "bot-message");
            typingDiv.id = "typingIndicator";
            typingDiv.style.fontStyle = "italic";
            typingDiv.style.color = "#999";
            typingDiv.textContent = "AI is typing...";
            messagesArea.appendChild(typingDiv);
            chatBox.scrollTop = chatBox.scrollHeight;

            // Bot Response Simulation
            setTimeout(function() {
                var indicator = document.getElementById("typingIndicator");
                if (indicator) indicator.remove();

                var botResponse = getBotResponse(userMessage);
                var botDiv = document.createElement("div");
                botDiv.classList.add("chat-message", "bot-message");
                botDiv.textContent = botResponse;
                messagesArea.appendChild(botDiv);

                chatBox.scrollTop = chatBox.scrollHeight;
            }, 1500);
        }

        function getBotResponse(message) {
            message = message.toLowerCase();
            
            if (message.includes("stress")) {
                return "Managing stress is important. Try deep breathing, regular sleep, physical activity, and mindfulness. Would you like details on any of these?";
            } else if (message.includes("anxiety")) {
                return "For anxiety, grounding techniques (5-4-3-2-1), muscle relaxation, and talking to someone you trust can help significantly.";
            } else if (message.includes("sleep")) {
                return "Good sleep hygiene involves a routine, cool room, and no screens before bed. How has your sleep been lately?";
            } else if (message.includes("sad") || message.includes("depress")) {
                return "I'm sorry you feel this way. Maintaining routine, exercise, and social connection helps. Please consider talking to a professional if it persists.";
            } else {
                return "I'm here to support you. Ask me about stress, anxiety, sleep, mindfulness, or anything on your mind.";
            }
        }

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