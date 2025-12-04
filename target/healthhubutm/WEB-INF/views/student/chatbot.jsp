<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Chatbot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .chat-container {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            margin: 0 auto;
        }

        .chat-box {
            background-color: #f1f1f1;
            height: 300px;
            overflow-y: scroll;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .chat-message {
            padding: 10px;
            margin-bottom: 10px;
            background-color: #e0e0e0;
            border-radius: 5px;
        }

        .bot-message {
            background-color: #d0f0c0;
        }

        .user-message {
            background-color: #c0d0f0;
        }
    </style>
</head>
<body>

    <div class="chat-container">
        <h2>AI Chatbot</h2>
        
        <div class="chat-box" id="chatBox">
            <div class="chat-message bot-message">
                <strong>Bot:</strong> ${chatbotResponses}
            </div>
        </div>

        <input type="text" class="input-box" id="userMessage" placeholder="Type your message...">
        <button onclick="sendMessage()">Send</button>
    </div>

    <script>
        function sendMessage() {
            var userMessage = document.getElementById("userMessage").value;
            if (userMessage.trim() === "") return;

            var chatBox = document.getElementById("chatBox");

            // Display user message
            var userDiv = document.createElement("div");
            userDiv.classList.add("chat-message", "user-message");
            userDiv.innerHTML = "<strong>You:</strong> " + userMessage;
            chatBox.appendChild(userDiv);

            // Scroll to the bottom
            chatBox.scrollTop = chatBox.scrollHeight;

            // Clear the input box
            document.getElementById("userMessage").value = "";

            // Simulate a bot response (you can expand this with more logic or static responses)
            setTimeout(function() {
                var botResponse = "I'm sorry, I can only provide static responses for now. Please select an option:\n" +
                                  "\n1. Ask about your profile.\n" +
                                  "\n2. Get student dashboard information.\n" +
                                  "\n3. Log out.";

                var botDiv = document.createElement("div");
                botDiv.classList.add("chat-message", "bot-message");
                botDiv.innerHTML = "<strong>Bot:</strong> " + botResponse;
                chatBox.appendChild(botDiv);

                // Scroll to the bottom
                chatBox.scrollTop = chatBox.scrollHeight;
            }, 1000);
        }
    </script>

</body>
</html>
