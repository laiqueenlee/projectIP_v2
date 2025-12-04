<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${post.title}"/> - Peer Support Forum</title>
    <style>
        :root {
            --primary: #5dd5c3; 
            --primary-dark: #4cc4b3;
            --primary-light: #e0f7f4;
            --text-primary: #1a1a1a;
            --text-secondary: #666;
            --bg-page: #f8fafb; 
            --bg-card: #ffffff;
            --border: #e5e7eb;
            --radius: 12px; 
            --shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--bg-page);
            color: var(--text-primary);
            line-height: 1.6;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 24px 20px;
        }

        /* --- Header Section (UPDATED) --- */
        .header {
            margin-bottom: 24px;
            display: flex;              /* Enables side-by-side layout */
            justify-content: space-between; /* Pushes text left, button right */
            align-items: center;        /* Vertically centers them */
        }

        .header h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 6px;
            color: var(--text-primary);
        }

        .header p {
            color: var(--text-secondary);
            font-size: 14px;
        }

        /* --- Back Link (UPDATED) --- */
        .back-link {
            display: inline-flex;
            align-items: center;
            color: var(--text-secondary); /* or use var(--primary) for teal */
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.2s;
            
            /* Optional: Make it look like a button */
            background-color: white;
            padding: 8px 16px;
            border-radius: 8px;
            border: 1px solid var(--border);
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
        }

        .back-link:hover {
            color: var(--primary);
            border-color: var(--primary);
            transform: translateY(-1px);
        }

        /* --- Post Card Styles --- */
        .post-card {
            background-color: var(--bg-card);
            border-radius: var(--radius);
            padding: 30px;
            margin-bottom: 24px;
            box-shadow: var(--shadow);
        }

        .post-header {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 18px;
            margin-right: 16px;
            flex-shrink: 0;
            box-shadow: 0 2px 4px rgba(93, 213, 195, 0.3);
        }

        .post-meta {
            flex-grow: 1;
        }

        .post-title {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 6px;
            line-height: 1.3;
        }

        .post-info {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            font-size: 13px;
            color: var(--text-secondary);
        }

        .badge {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .post-content {
            color: #4b5563;
            margin-bottom: 24px;
            font-size: 16px;
            line-height: 1.7;
        }

        .post-stats {
            display: flex;
            gap: 24px;
            padding-top: 16px;
            border-top: 1px solid var(--border);
            font-size: 14px;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .stat {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* --- Reply Form --- */
        .reply-form-card {
            background-color: var(--bg-card);
            border-radius: var(--radius);
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: var(--shadow);
        }
        
        .reply-form-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
            color: var(--text-primary);
        }

        .reply-textarea {
            width: 100%;
            padding: 16px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            resize: vertical;
            min-height: 120px;
            margin-bottom: 16px;
            outline: none;
            transition: all 0.2s;
            background-color: #fff;
        }

        .reply-textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        .submit-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: 0 2px 4px rgba(93, 213, 195, 0.2);
        }

        .submit-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
        }

        /* --- Replies Section --- */
        .replies-section {
            background-color: var(--bg-card);
            border-radius: var(--radius);
            padding: 10px 30px;
            box-shadow: var(--shadow);
        }

        .reply {
            padding: 24px 0;
            border-bottom: 1px solid var(--border);
        }

        .reply:last-child {
            border-bottom: none;
        }

        .reply-header {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }

        .reply-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #f3f4f6;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 12px;
            font-size: 14px;
        }

        .reply-meta {
            display: flex;
            flex-direction: column;
        }

        .reply-author {
            font-weight: 600;
            color: var(--text-primary);
            font-size: 14px;
        }

        .reply-time {
            font-size: 12px;
            color: #999;
        }

        .reply-content {
            color: #4b5563;
            font-size: 14px;
            margin-left: 48px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
    
    <div class="container">
        <div class="header">
            <div>
                <h1>Peer Support Forum</h1>
                <p>A safe space to share, connect, and support each other</p>
            </div>
            <a href="${pageContext.request.contextPath}/student/forum" class="back-link">← Back to Forum</a>
        </div>

        <div class="post-card">
            <div class="post-header">
                <div class="avatar"><c:out value="${post.avatar}"/></div>
                <div class="post-meta">
                    <div class="post-title"><c:out value="${post.title}"/></div>
                    <div class="post-info">
                        <span><c:out value="${post.author}"/></span>
                        <span>•</span>
                        <span class="badge"><c:out value="${post.badge}"/></span>
                        <span>•</span>
                        <span><c:out value="${post.category}"/></span>
                        <span>•</span>
                        <span><c:out value="${post.time}"/></span>
                    </div>
                </div>
            </div>
            <div class="post-content">
                <c:out value="${post.content}"/>
            </div>
            <div class="post-stats">
                <div class="stat">
                    <span>👍</span>
                    <span><c:out value="${post.likes}"/></span>
                </div>
                <div class="stat">
                    <span>💬</span>
                    <span><c:out value="${post.replyCount}"/> replies</span>
                </div>
            </div>
        </div>

        <div class="reply-form-card">
            <div class="reply-form-title">Join the discussion</div>
            <form action="${pageContext.request.contextPath}/forum/addReply" method="POST">
                
                <input type="hidden" name="postId" value="${post.id}" />
                
                <textarea 
                    name="content" 
                    class="reply-textarea" 
                    placeholder="Type your reply here... Be kind and supportive."
                    required></textarea>
                    
                <button type="submit" class="submit-btn">Post Reply</button>
            </form>
        </div>

        <div class="replies-section">
            <c:if test="${empty replies}">
                <div style="text-align: center; color: #999; padding: 40px 20px;">
                    <div style="font-size: 24px; margin-bottom: 10px;">💬</div>
                    <p>No replies yet. Be the first to share your thoughts!</p>
                </div>
            </c:if>

            <c:forEach var="r" items="${replies}">
                <div class="reply">
                    <div class="reply-header">
                        <div class="reply-avatar"><c:out value="${r.avatar}"/></div>
                        <div class="reply-meta">
                            <div class="reply-author"><c:out value="${r.author}"/></div>
                            <div class="reply-time"><c:out value="${r.time}"/></div>
                        </div>
                    </div>
                    <div class="reply-content">
                        <c:out value="${r.content}"/>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>