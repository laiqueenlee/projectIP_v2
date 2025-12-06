<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${not empty newPost}">Post Created - Peer Support Forum</c:when>
            <c:otherwise>Create New Post - Peer Support Forum</c:otherwise>
        </c:choose>
    </title>
    <style>
        /* --- MERGED CSS VARIABLES --- */
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
            --shadow-hover: 0 4px 16px rgba(0,0,0,0.1);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-page);
            color: var(--text-primary);
            line-height: 1.6;
        }

        /* --- HEADER STYLES --- */
        .page-header { background: white; border-bottom: 1px solid var(--border); padding: 20px 24px; margin-bottom: 24px; }
        .page-header-content { max-width: 900px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; }
        .page-header h1 { font-size: 24px; font-weight: 700; color: var(--text-primary); }
        .page-header p { font-size: 14px; color: var(--text-secondary); margin-top: 4px; }
        .header-btn { padding: 10px 20px; background: var(--primary); color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; transition: var(--transition); text-decoration: none; display: inline-flex; align-items: center; gap: 6px; }
        .header-btn:hover { background: var(--primary-dark); transform: translateY(-1px); }

        /* --- FORM STYLES --- */
        .create-post-container { max-width: 800px; margin: 0 auto; padding: 0 24px 40px; animation: fadeInUp 0.5s ease-out; }
        .post-form-card { background: var(--bg-card); border-radius: var(--radius); box-shadow: var(--shadow); padding: 32px; }
        .form-header { margin-bottom: 24px; }
        .form-header h2 { font-size: 20px; font-weight: 700; margin-bottom: 6px; }
        .form-group { margin-bottom: 24px; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 8px; }
        .form-group input[type="text"], .form-group textarea, .form-group select { width: 100%; padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; background: white; }
        .form-group input:focus, .form-group textarea:focus, .form-group select:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px var(--primary-light); }
        .form-group textarea { resize: vertical; min-height: 160px; }
        .checkbox-group { display: flex; align-items: center; gap: 8px; margin-bottom: 24px; }
        .checkbox-group input[type="checkbox"] { width: 18px; height: 18px; accent-color: var(--primary); }
        .form-actions { display: flex; gap: 12px; padding-top: 8px; }
        .btn { padding: 12px 32px; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; border: none; }
        .btn-primary { background: var(--primary); color: white; flex: 1; }
        .btn-secondary { background: white; color: var(--text-secondary); border: 1px solid var(--border); padding: 12px 24px; }
        .char-counter { text-align: right; font-size: 12px; color: var(--text-muted); margin-top: 6px; }
        .char-counter.warning { color: #f59e0b; }
        .char-counter.error { color: #ef4444; }
        .voice-input-btn { position: absolute; right: 12px; bottom: 12px; width: 40px; height: 40px; border-radius: 50%; background: #6b7280; border: none; color: white; cursor: pointer; display: flex; align-items: center; justify-content: center; }
        .textarea-wrapper { position: relative; }

        /* --- LIST STYLES --- */
        .forum-container { max-width: 900px; margin: 0 auto; padding: 24px 20px; }
        .success-banner { background: #d1fae5; border: 1px solid #10b981; color: #065f46; padding: 16px; border-radius: 8px; margin-bottom: 24px; display: flex; align-items: center; gap: 12px; animation: fadeInDown 0.5s ease-out; }
        .posts-section { display: flex; flex-direction: column; gap: 16px; }
        .post { background: var(--bg-card); border-radius: var(--radius); padding: 20px; box-shadow: var(--shadow); transition: var(--transition); cursor: pointer; animation: fadeInUp 0.5s ease-out backwards; }
        .post:hover { box-shadow: var(--shadow-hover); transform: translateY(-2px); }
        .post-header { display: flex; align-items: flex-start; gap: 12px; margin-bottom: 12px; }
        .post-avatar { width: 40px; height: 40px; border-radius: 50%; background: linear-gradient(135deg, var(--primary), var(--primary-dark)); display: flex; align-items: center; justify-content: center; color: white; font-weight: 600; flex-shrink: 0; }
        .post-content { flex: 1; }
        .post h3 { font-size: 16px; font-weight: 600; color: var(--text-primary); }
        .post-info { display: flex; align-items: center; gap: 8px; font-size: 13px; color: var(--text-muted); margin-bottom: 8px; }
        .post-info span::after { content: "•"; margin-left: 8px; }
        .post-info span:last-child::after { content: ""; }
        .post-text { font-size: 14px; color: var(--text-secondary); margin-bottom: 14px; }
        .post-interactions { display: flex; gap: 20px; padding-top: 12px; border-top: 1px solid var(--border-light); }
        .interaction-btn { display: flex; align-items: center; gap: 6px; background: transparent; border: none; color: var(--text-muted); font-size: 13px; cursor: pointer; padding: 4px 8px; border-radius: 6px; text-decoration: none; }
        .interaction-btn:hover { background: var(--border-light); color: var(--text-primary); }

        /* Animations */
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeInDown { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
        
        /* New Post Highlight */
        .post.highlight-new { border: 2px solid var(--primary); background-color: var(--primary-light); }
    </style>
</head>
<body>

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

    <c:choose>
        
        <%-- SCENARIO 1: POST CREATED SUCCESSFULLY (Show List View) --%>
        <c:when test="${not empty newPost}">
            <div class="forum-container">
                
                <div class="success-banner">
                    <span style="font-size: 20px;">✅</span>
                    <div>
                        <strong>Post Published!</strong><br>
                        Your post has been shared with the community.
                    </div>
                </div>

                <div class="posts-section">
                    <c:forEach var="p" items="${posts}">
                        <div class="post ${p.id == newPost.id ? 'highlight-new' : ''}" 
                             onclick="window.location.href='${pageContext.request.contextPath}/forum/post/${p.id}'">
                            
                            <div class="post-header">
                                <div class="post-avatar"><c:out value="${p.avatar}"/></div>
                                <div class="post-content">
                                    <div class="post-title-row">
                                        <h3><c:out value="${p.title}"/></h3>
                                    </div>

                                    <div class="post-info">
                                        <span><c:out value="${p.author}"/></span>
                                        <span><c:out value="${p.category}"/></span>
                                        <span><c:out value="${p.time}"/></span>
                                    </div>

                                    <p class="post-text"><c:out value="${p.excerpt}"/></p>

                                    <div class="post-interactions">
                                        <button class="interaction-btn">
                                            <span>👍</span> <span class="count"><c:out value="${p.likes}"/></span>
                                        </button>
                                        <a href="#" class="interaction-btn">
                                            <span>💬</span> <span><c:out value="${p.replyCount}"/> replies</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <div style="margin-top: 20px; text-align: center;">
                    <a href="${pageContext.request.contextPath}/student/new-post" class="btn btn-secondary" style="text-decoration: none;">Create Another Post</a>
                </div>
            </div>
        </c:when>

        <%-- SCENARIO 2: DEFAULT (Show Create Form) --%>
        <c:otherwise>
            <div class="create-post-container">
                <div class="post-form-card">
                    <div class="form-header">
                        <h2>Create a New Post</h2>
                        <p>Share your thoughts or questions with the community</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/forum/submit-post" method="POST" id="createPostForm" onsubmit="handleSubmit(event)">
                        <div class="form-group">
                            <label for="postTitle">Post title</label>
                            <input type="text" id="postTitle" name="postTitle" placeholder="Enter a descriptive title..." required maxlength="200" oninput="updateCharCount('postTitle', 200, 'titleCounter')">
                            <div class="char-counter" id="titleCounter">0 / 200</div>
                        </div>

                        <div class="form-group">
                            <label for="postContent">What's on your mind? Remember, you can post anonymously.</label>
                            <div class="textarea-wrapper">
                                <textarea id="postContent" name="postContent" placeholder="Share your thoughts..." required maxlength="2000" oninput="updateCharCount('postContent', 2000, 'contentCounter')"></textarea>
                                <button type="button" class="voice-input-btn" onclick="toggleVoiceInput()"><span id="voiceIcon">🎤</span></button>
                            </div>
                            <div class="char-counter" id="contentCounter">0 / 2000</div>
                        </div>

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

                        <div class="checkbox-group">
                            <input type="checkbox" id="postAnonymously" name="postAnonymously" value="true">
                            <label for="postAnonymously">Post anonymously</label>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary" id="submitBtn">Post</button>
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/student/forum'">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                // Script specific to the FORM view
                let isSubmitting = false;
                
                function updateCharCount(inputId, maxLength, counterId) {
                    const input = document.getElementById(inputId);
                    const counter = document.getElementById(counterId);
                    const currentLength = input.value.length;
                    counter.textContent = currentLength + " / " + maxLength;
                    if (currentLength > maxLength * 0.9) counter.classList.add('warning');
                    else counter.classList.remove('warning');
                }

                function toggleVoiceInput() {
                    alert("Voice input simulated.");
                }

                function handleSubmit(event) {
                    const form = event.target;
                    if (!form.checkValidity()) return;
                    isSubmitting = true;
                    document.getElementById('submitBtn').innerText = 'Posting...';
                }

                document.addEventListener('DOMContentLoaded', function() {
                    updateCharCount('postTitle', 200, 'titleCounter');
                    updateCharCount('postContent', 2000, 'contentCounter');
                });
            </script>
        </c:otherwise>
    </c:choose>

</body>
</html>