<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Post - Peer Support Forum</title>
    <style>
        :root {
            --primary: #5dd5c3;
            --primary-dark: #4cc4b3;
            --primary-light: #e0f7f4;
            --text-primary: #1a1a1a;
            --text-secondary: #666;
            --text-muted: #999;
            --bg-page: #f8fafb;
            --bg-card: #ffffff;
            --border: #e5e7eb;
            --border-light: #f0f2f4;
            --radius: 12px;
            --shadow: 0 2px 8px rgba(0,0,0,0.06);
            --shadow-lg: 0 4px 16px rgba(0,0,0,0.1);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-page);
            color: var(--text-primary);
            line-height: 1.6;
        }

        /* Page Header */
        .page-header {
            background: white;
            border-bottom: 1px solid var(--border);
            padding: 20px 24px;
            margin-bottom: 24px;
        }

        .page-header-content {
            max-width: 800px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-header h1 {
            font-size: 24px;
            font-weight: 700;
            color: var(--text-primary);
        }

        .page-header p {
            font-size: 14px;
            color: var(--text-secondary);
            margin-top: 4px;
        }

        .header-btn {
            padding: 10px 20px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .header-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
        }

        /* Create Post Container */
        .create-post-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 24px 40px;
            animation: fadeInUp 0.5s ease-out;
        }

        .post-form-card {
            background: var(--bg-card);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 32px;
        }

        .form-header {
            margin-bottom: 24px;
        }

        .form-header h2 {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 6px;
        }

        .form-header p {
            font-size: 14px;
            color: var(--text-secondary);
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
        }

        .form-group input[type="text"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            color: var(--text-primary);
            background: white;
            transition: var(--transition);
        }

        .form-group input[type="text"]:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        .form-group input[type="text"]::placeholder,
        .form-group textarea::placeholder {
            color: var(--text-muted);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 160px;
            line-height: 1.6;
        }

        .form-hint {
            font-size: 13px;
            color: var(--text-muted);
            margin-top: 6px;
            font-style: italic;
        }

        /* Select Dropdown */
        .form-group select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23666' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            padding-right: 36px;
        }

        /* Checkbox */
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 24px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--primary);
        }

        .checkbox-group label {
            font-size: 14px;
            color: var(--text-secondary);
            cursor: pointer;
            margin: 0;
            user-select: none;
        }

        /* Form Actions */
        .form-actions {
            display: flex;
            gap: 12px;
            padding-top: 8px;
        }

        .btn {
            padding: 12px 32px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            font-family: inherit;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            flex: 1;
            box-shadow: 0 2px 8px rgba(93, 213, 195, 0.3);
        }

        .btn-primary:hover:not(:disabled) {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(93, 213, 195, 0.4);
        }

        .btn-primary:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-secondary {
            background: white;
            color: var(--text-secondary);
            border: 1px solid var(--border);
            padding: 12px 24px;
        }

        .btn-secondary:hover {
            background: var(--bg-page);
            border-color: var(--text-muted);
        }

        /* Character Counter */
        .char-counter {
            text-align: right;
            font-size: 12px;
            color: var(--text-muted);
            margin-top: 6px;
        }

        .char-counter.warning {
            color: #f59e0b;
        }

        .char-counter.error {
            color: #ef4444;
        }

        /* Voice Input Button (shown in image) */
        .textarea-wrapper {
            position: relative;
        }

        .voice-input-btn {
            position: absolute;
            right: 12px;
            bottom: 12px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #6b7280;
            border: none;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .voice-input-btn:hover {
            background: #4b5563;
            transform: scale(1.05);
        }

        .voice-input-btn.recording {
            background: #ef4444;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page-header {
                padding: 16px 16px;
            }

            .page-header-content {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .header-btn {
                width: 100%;
                justify-content: center;
            }

            .create-post-container {
                padding: 0 16px 24px;
            }

            .post-form-card {
                padding: 24px 20px;
            }

            .form-header h2 {
                font-size: 18px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .btn-primary,
            .btn-secondary {
                width: 100%;
            }
        }

        /* Focus visible for accessibility */
        button:focus-visible,
        input:focus-visible,
        textarea:focus-visible,
        select:focus-visible {
            outline: 2px solid var(--primary);
            outline-offset: 2px;
        }

        /* Loading State */
        .btn-primary.loading {
            position: relative;
            color: transparent;
            pointer-events: none;
        }

        .btn-primary.loading::after {
            content: '';
            position: absolute;
            width: 16px;
            height: 16px;
            top: 50%;
            left: 50%;
            margin-left: -8px;
            margin-top: -8px;
            border: 2px solid white;
            border-top-color: transparent;
            border-radius: 50%;
            animation: spin 0.6s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        @media (prefers-reduced-motion: reduce) {
            * {
                animation: none !important;
                transition: none !important;
            }
        }
    </style>
</head>
<body>
    <!-- Page Header -->
    <div class="page-header">
        <div class="page-header-content">
            <div>
                <h1>Peer Support Forum</h1>
                <p>A safe space to share, connect, and support each other</p>
            </div>
            <a href="${pageContext.request.contextPath}/student/forum" class="header-btn">
                ← Back to Forum
            </a>
        </div>
    </div>

    <!-- Create Post Form -->
    <div class="create-post-container">
        <div class="post-form-card">
            <div class="form-header">
                <h2>Create a New Post</h2>
                <p>Share your thoughts or questions with the community</p>
            </div>

            <form action="${pageContext.request.contextPath}/forum/submit-post" 
      method="POST" 
      id="createPostForm" 
      onsubmit="handleSubmit(event)">
                <!-- Post Title -->
                <div class="form-group">
                    <label for="postTitle">Post title</label>
                    <input 
                        type="text" 
                        id="postTitle" 
                        name="postTitle" 
                        placeholder="Enter a descriptive title..." 
                        required
                        maxlength="200"
                        oninput="updateCharCount('postTitle', 200, 'titleCounter')"
                    >
                    <div class="char-counter" id="titleCounter">0 / 200</div>
                </div>

                <!-- Post Content -->
                <div class="form-group">
                    <label for="postContent">What's on your mind? Remember, you can post anonymously.</label>
                    <div class="textarea-wrapper">
                        <textarea 
                            id="postContent" 
                            name="postContent" 
                            placeholder="Share your thoughts, ask questions, or seek support..."
                            required
                            maxlength="2000"
                            oninput="updateCharCount('postContent', 2000, 'contentCounter')"
                        ></textarea>
                        <button type="button" class="voice-input-btn" onclick="toggleVoiceInput()" title="Voice input" aria-label="Voice input">
                            <span id="voiceIcon">🎤</span>
                        </button>
                    </div>
                    <div class="char-counter" id="contentCounter">0 / 2000</div>
                </div>

                <!-- Category Selection -->
                <div class="form-group">
                    <label for="category">Select category</label>
                    <select id="category" name="category" required>
                        <option value="">Choose a category...</option>
                        <option value="Stress">Stress</option>
                        <option value="Anxiety">Anxiety</option>
                        <option value="Depression">Depression</option>
                        <option value="Wellness">Wellness</option>
                        <option value="Self-Care">Self-Care</option>
                        <option value="Relationships">Relationships</option>
                    </select>
                </div>

                <!-- Post Anonymously Checkbox -->
                <div class="checkbox-group">
                    <input type="checkbox" id="postAnonymously" name="postAnonymously" value="true">
                    <label for="postAnonymously">Post anonymously</label>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary" id="submitBtn">
                        Post
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="handleCancel()">
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>

<script>
        // 1. Create a flag to track if we are intentionally submitting
        let isSubmitting = false;

        // Character counter
        function updateCharCount(inputId, maxLength, counterId) {
            const input = document.getElementById(inputId);
            const counter = document.getElementById(counterId);
            const currentLength = input.value.length;
            
            counter.textContent = `${currentLength} / ${maxLength}`;
            
            counter.classList.remove('warning', 'error');
            if (currentLength > maxLength * 0.9) {
                counter.classList.add('warning');
            }
            if (currentLength >= maxLength) {
                counter.classList.add('error');
            }
        }

        // Voice input toggle (Visual only for now)
        let isRecording = false;
        function toggleVoiceInput() {
            const btn = document.querySelector('.voice-input-btn');
            const icon = document.getElementById('voiceIcon');
            isRecording = !isRecording;
            if (isRecording) {
                btn.classList.add('recording');
                icon.textContent = '⏹️';
            } else {
                btn.classList.remove('recording');
                icon.textContent = '🎤';
            }
        }

        // 2. UPDATED: Handle Form Submission
        function handleSubmit(event) {
            const form = event.target;
            
            // Validate form
            if (!form.checkValidity()) {
                // If invalid, let the browser show errors, but DO NOT set isSubmitting
                return; 
            }
            
            // If valid, set the flag to TRUE so the popup doesn't appear
            isSubmitting = true;
            
            // Add loading state
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('loading');
            submitBtn.innerText = 'Posting...'; // Optional: Change text
            
            // Clear the draft from local storage
            localStorage.removeItem('forumPostDraft');

            // The form will now submit naturally to the server
        }

        // Cancel handler
        function handleCancel() {
            if (confirm('Are you sure you want to cancel? Your post will not be saved.')) {
                // We set isSubmitting to true here too, so we don't get double alerts
                isSubmitting = true; 
                window.location.href = '${pageContext.request.contextPath}/student/forum';
            }
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            updateCharCount('postTitle', 200, 'titleCounter');
            updateCharCount('postContent', 2000, 'contentCounter');
            restoreDraft();
        });

        // 3. UPDATED: Warn before leaving (Check isSubmitting flag)
        window.addEventListener('beforeunload', function(e) {
            // If we are submitting the form, STOP here. Do not show the popup.
            if (isSubmitting) {
                return undefined;
            }

            const title = document.getElementById('postTitle').value;
            const content = document.getElementById('postContent').value;
            
            // Only show popup if there is text AND we are not submitting
            if (title || content) {
                e.preventDefault();
                e.returnValue = ''; // Required for Chrome
            }
        });

        // Auto-save logic
        function autoSave() {
            if (isSubmitting) return; // Don't save if we are leaving
            
            const title = document.getElementById('postTitle').value;
            const content = document.getElementById('postContent').value;
            const category = document.getElementById('category').value;
            
            if (title || content) {
                const draft = { title, content, category, timestamp: Date.now() };
                localStorage.setItem('forumPostDraft', JSON.stringify(draft));
            }
        }

        function restoreDraft() {
            const draftStr = localStorage.getItem('forumPostDraft');
            if (draftStr) {
                try {
                    const draft = JSON.parse(draftStr);
                    if (Date.now() - draft.timestamp < 24 * 60 * 60 * 1000) {
                        // Optional: ask user? For now just load it or ignore
                        // Simple logic: if fields are empty, fill them
                        if (!document.getElementById('postTitle').value) {
                             document.getElementById('postTitle').value = draft.title || '';
                             document.getElementById('postContent').value = draft.content || '';
                             document.getElementById('category').value = draft.category || '';
                             updateCharCount('postTitle', 200, 'titleCounter');
                             updateCharCount('postContent', 2000, 'contentCounter');
                        }
                    }
                } catch (e) {}
            }
        }

        setInterval(autoSave, 30000);
    </script>
</body>
</html>