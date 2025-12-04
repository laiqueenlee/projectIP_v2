<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${post.title}"/> - Peer Support Forum</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 8px;
            color: #1a1a1a;
        }

        .header p {
            color: #666;
            font-size: 14px;
        }

        /* --- Post Card Styles --- */
        .post-card {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .post-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #22d3ee;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 12px;
            flex-shrink: 0;
        }

        .post-meta {
            flex-grow: 1;
        }

        .post-title {
            font-size: 18px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 4px;
        }

        .post-info {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            color: #666;
        }

        .badge {
            background-color: #dbeafe;
            color: #1e40af;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
        }

        .post-content {
            color: #4b5563;
            margin-bottom: 15px;
            font-size: 15px;
        }

        .post-stats {
            display: flex;
            gap: 20px;
            padding-top: 12px;
            border-top: 1px solid #e5e7eb;
            font-size: 14px;
            color: #666;
        }

        .stat {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* --- NEW: Reply Form Styles --- */
        .reply-form-card {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .reply-form-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #1a1a1a;
        }

        .reply-textarea {
            width: 100%;
            padding: 15px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            resize: vertical;
            min-height: 100px;
            margin-bottom: 15px;
            outline: none;
            transition: border-color 0.2s;
        }

        .reply-textarea:focus {
            border-color: #22d3ee;
        }

        .submit-btn {
            background-color: #22d3ee;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .submit-btn:hover {
            background-color: #06b6d4;
        }

        /* --- Existing Reply List Styles --- */
        .replies-section {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .reply {
            padding: 20px 0;
            border-bottom: 1px solid #f0f0f0;
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
            background-color: #e5e7eb; /* Slightly different gray for replies */
            color: #4b5563;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 10px;
            font-size: 14px;
        }

        .reply-meta {
            display: flex;
            flex-direction: column;
        }

        .reply-author {
            font-weight: 600;
            color: #1a1a1a;
            font-size: 14px;
        }

        .reply-time {
            font-size: 12px;
            color: #999;
        }

        .reply-content {
            color: #4b5563;
            font-size: 14px;
            margin-left: 46px;
        }

        .back-link {
            display: inline-block;
            color: #22d3ee;
            text-decoration: none;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/forum" class="back-link">← Back to Forum</a>
        
        <div class="header">
            <h1>Peer Support Forum</h1>
            <p>A safe space to share, connect, and support each other</p>
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
                <p style="text-align: center; color: #999; padding: 20px;">No replies yet. Be the first to reply!</p>
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