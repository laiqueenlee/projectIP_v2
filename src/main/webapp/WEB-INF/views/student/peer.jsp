<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peer Support Forum - MindWell</title>
    <style>
        :root {
            --primary: #00bfa5;
            --primary-dark: #00897b;
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

        .forum-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 24px 20px;
        }

        /* Header */
        header {
            margin-bottom: 24px;
            animation: fadeInDown 0.5s ease-out;
        }

        header h1 {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 6px;
        }

        header p {
            font-size: 14px;
            color: var(--text-secondary);
        }

        /* Top Bar - Tabs and New Post */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            gap: 16px;
            animation: fadeIn 0.5s ease-out 0.1s backwards;
        }

        .tabs {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .tab-btn {
            padding: 8px 16px;
            background: transparent;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            color: var(--text-secondary);
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
        }

        .tab-btn:hover {
            background: var(--border-light);
            color: var(--text-primary);
        }

        .tab-btn.active {
            background: var(--bg-card);
            color: var(--text-primary);
            box-shadow: var(--shadow);
        }

        .new-post-btn {
            padding: 10px 20px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            white-space: nowrap;
            box-shadow: 0 2px 8px rgba(0, 191, 165, 0.3);
        }

        .new-post-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 191, 165, 0.4);
        }

        /* Search Bar */
        .search-container {
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-out 0.2s backwards;
        }

        .search-wrapper {
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 12px 16px 12px 44px;
            border: 1px solid var(--border);
            border-radius: 10px;
            font-size: 14px;
            background: var(--bg-card);
            transition: var(--transition);
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        .search-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
        }

        /* Category Filter */
        .filter-container {
            display: flex;
            gap: 8px;
            margin-bottom: 24px;
            overflow-x: auto;
            padding: 8px 4px 4px; /* give a little top padding so button borders are not visually clipped */
            -webkit-overflow-scrolling: touch;
            animation: fadeIn 0.5s ease-out 0.3s backwards;
        }

        .filter-container::-webkit-scrollbar {
            height: 4px;
        }

        .filter-container::-webkit-scrollbar-thumb {
            background: var(--border);
            border-radius: 4px;
        }

        .category-btn {
            padding: 8px 16px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 20px;
            font-size: 13px;
            color: var(--text-secondary);
            cursor: pointer;
            transition: var(--transition);
            white-space: nowrap;
            font-weight: 500;
            background-clip: padding-box; /* ensure full rounded border is rendered */
            -webkit-background-clip: padding-box;
            position: relative;
        }

        .category-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: var(--primary-light);
        }

        .category-btn.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(0, 191, 165, 0.06); /* subtle ring so top edge looks complete */
        }

        /* Posts Section */
        .posts-section {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .post {
            background: var(--bg-card);
            border-radius: var(--radius);
            padding: 20px;
            box-shadow: var(--shadow);
            transition: var(--transition);
            cursor: pointer;
            animation: fadeInUp 0.5s ease-out backwards;
        }

        .post:nth-child(1) { animation-delay: 0.1s; }
        .post:nth-child(2) { animation-delay: 0.2s; }
        .post:nth-child(3) { animation-delay: 0.3s; }
        .post:nth-child(4) { animation-delay: 0.4s; }

        .post:hover {
            box-shadow: var(--shadow-hover);
            transform: translateY(-2px);
        }

        .post-header {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 12px;
        }

        .post-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 16px;
            flex-shrink: 0;
        }

        .post-content {
            flex: 1;
        }

        .post-title-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 6px;
        }

        .post h3 {
            font-size: 16px;
            font-weight: 600;
            color: var(--text-primary);
            flex: 1;
        }

        .post-badge {
            padding: 4px 10px;
            background: var(--primary-light);
            color: var(--primary-dark);
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .post-badge.moderated {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .post-info {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 8px;
        }

        .post-info span {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .post-info span::after {
            content: "•";
            margin-left: 8px;
        }

        .post-info span:last-child::after {
            content: "";
            margin-left: 0;
        }

        .post-text {
            font-size: 14px;
            color: var(--text-secondary);
            line-height: 1.5;
            margin-bottom: 14px;
        }

        .post-interactions {
            display: flex;
            gap: 20px;
            padding-top: 12px;
            border-top: 1px solid var(--border-light);
        }

        .interaction-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            background: transparent;
            border: none;
            color: var(--text-muted);
            font-size: 13px;
            cursor: pointer;
            transition: var(--transition);
            padding: 4px 8px;
            border-radius: 6px;
        }

        .interaction-btn:hover {
            background: var(--border-light);
            color: var(--text-primary);
        }

        .interaction-btn.liked {
            color: var(--primary);
        }

        .interaction-icon {
            font-size: 16px;
        }

        /* Community Guidelines */
        .guidelines {
            background: var(--bg-card);
            border-radius: var(--radius);
            padding: 20px;
            margin-top: 32px;
            box-shadow: var(--shadow);
            animation: fadeIn 0.5s ease-out 0.5s backwards;
        }

        .guidelines h3 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 12px;
            color: var(--text-primary);
        }

        .guidelines ul {
            list-style: none;
            padding: 0;
        }

        .guidelines li {
            font-size: 13px;
            color: var(--text-secondary);
            padding: 6px 0;
            padding-left: 24px;
            position: relative;
        }

        .guidelines li::before {
            content: "•";
            position: absolute;
            left: 8px;
            color: var(--primary);
            font-weight: bold;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--text-muted);
        }

        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 16px;
            opacity: 0.3;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

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

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .forum-container {
                padding: 16px 12px;
            }

            header h1 {
                font-size: 24px;
            }

            .top-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .tabs {
                overflow-x: auto;
                padding-bottom: 4px;
            }

            .new-post-btn {
                width: 100%;
            }

            .post {
                padding: 16px;
            }

            .post-header {
                gap: 10px;
            }

            .post-avatar {
                width: 36px;
                height: 36px;
                font-size: 14px;
            }

            .post h3 {
                font-size: 15px;
            }

            .post-text {
                font-size: 13px;
            }
        }

        /* Accessibility */
        @media (prefers-reduced-motion: reduce) {
            * {
                animation: none !important;
                transition: none !important;
            }
        }

        button:focus, .category-btn:focus, .tab-btn:focus {
            outline: 2px solid var(--primary);
            outline-offset: 2px;
        }
    </style>
</head>
<body>
    <div class="forum-container">
        <header>
            <h1>Peer Support Forum</h1>
            <p>A safe space to share, connect, and support each other</p>
        </header>

        <!-- Top Bar with Tabs and New Post Button -->
        <div class="top-bar">
            <div class="tabs">
                <button class="tab-btn active" onclick="switchTab('recent', event)">
                    <span>🕐</span> Recent
                </button>
                <button class="tab-btn" onclick="switchTab('popular', event)">
                    <span>⭐</span> Popular
                </button>
            </div>
            <button class="new-post-btn" onclick="window.location.href='${pageContext.request.contextPath}/student/new-post'">
                + New Post
            </button>
        </div>

        <!-- Search Bar -->
        <div class="search-container">
            <div class="search-wrapper">
                <span class="search-icon">🔍</span>
                <input type="text" class="search-input" placeholder="Search posts..." id="searchInput" onkeyup="searchPosts()">
            </div>
        </div>

        <!-- Category Filter -->
        <div class="filter-container">
            <button class="category-btn active" data-category="All" onclick="filterByCategory(this, 'All')">All</button>
            <button class="category-btn" data-category="Stress" onclick="filterByCategory(this, 'Stress')">Stress</button>
            <button class="category-btn" data-category="Anxiety" onclick="filterByCategory(this, 'Anxiety')">Anxiety</button>
            <button class="category-btn" data-category="Depression" onclick="filterByCategory(this, 'Depression')">Depression</button>
            <button class="category-btn" data-category="Wellness" onclick="filterByCategory(this, 'Wellness')">Wellness</button>
            <button class="category-btn" data-category="Self-Care" onclick="filterByCategory(this, 'Self-Care')">Self-Care</button>
            <button class="category-btn" data-category="Relationships" onclick="filterByCategory(this, 'Relationships')">Relationships</button>
        </div>

        <!-- Posts Section -->
        <div class="posts-section" id="postsSection">
            <!-- Post 1 -->
            <div class="post" data-category="Stress" onclick="viewPost(1)">
                <div class="post-header">
                    <div class="post-avatar">A</div>
                    <div class="post-content">
                        <div class="post-title-row">
                            <h3>Managing exam stress - what works for you?</h3>
                            <span class="post-badge moderated">Moderated</span>
                        </div>
                        <div class="post-info">
                            <span>Anonymous</span>
                            <span>Stress</span>
                            <span>2 hours ago</span>
                        </div>
                        <p class="post-text">Finals are coming up and I'm feeling overwhelmed. What strategies have helped you cope with academic pressure?</p>
                        <div class="post-interactions">
                            <button class="interaction-btn" onclick="toggleLike(event, this)">
                                <span class="interaction-icon">👍</span>
                                <span class="count">24</span>
                            </button>
                            <a class="interaction-btn" href="${pageContext.request.contextPath}/student/post?id=1" onclick="event.stopPropagation()" role="button" aria-label="View replies">
                                <span class="interaction-icon">💬</span>
                                <span>18 replies</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Post 2 -->
            <div class="post" data-category="Wellness" onclick="viewPost(2)">
                <div class="post-header">
                    <div class="post-avatar">S</div>
                    <div class="post-content">
                        <div class="post-title-row">
                            <h3>Meditation apps recommendations</h3>
                            <span class="post-badge moderated">Moderated</span>
                        </div>
                        <div class="post-info">
                            <span>Student123</span>
                            <span>Wellness</span>
                            <span>5 hours ago</span>
                        </div>
                        <p class="post-text">I'm looking to start a meditation practice. Does anyone have good app recommendations for beginners?</p>
                        <div class="post-interactions">
                            <button class="interaction-btn" onclick="toggleLike(event, this)">
                                <span class="interaction-icon">👍</span>
                                <span class="count">15</span>
                            </button>
                            <button class="interaction-btn">
                                <span class="interaction-icon">💬</span>
                                <span>12 replies</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Post 3 -->
            <div class="post" data-category="Anxiety" onclick="viewPost(3)">
                <div class="post-header">
                    <div class="post-avatar">A</div>
                    <div class="post-content">
                        <div class="post-title-row">
                            <h3>How to deal with imposter syndrome</h3>
                            <span class="post-badge">Moderated</span>
                        </div>
                        <div class="post-info">
                            <span>Anonymous</span>
                            <span>Anxiety</span>
                            <span>1 day ago</span>
                        </div>
                        <p class="post-text">Sometimes I feel like I don't belong here and everyone is better than me. Can anyone relate?</p>
                        <div class="post-interactions">
                            <button class="interaction-btn liked" onclick="toggleLike(event, this)">
                                <span class="interaction-icon">👍</span>
                                <span class="count">43</span>
                            </button>
                            <button class="interaction-btn">
                                <span class="interaction-icon">💬</span>
                                <span>31 replies</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Post 4 -->
            <div class="post" data-category="Self-Care" onclick="viewPost(4)">
                <div class="post-header">
                    <div class="post-avatar">S</div>
                    <div class="post-content">
                        <div class="post-title-row">
                            <h3>Sleep schedule tips needed</h3>
                            <span class="post-badge moderated">Moderated</span>
                        </div>
                        <div class="post-info">
                            <span>Sleepless</span>
                            <span>Self-Care</span>
                            <span>1 day ago</span>
                        </div>
                        <p class="post-text">My sleep has been all over the place. Looking for practical advice to get back on track.</p>
                        <div class="post-interactions">
                            <button class="interaction-btn" onclick="toggleLike(event, this)">
                                <span class="interaction-icon">👍</span>
                                <span class="count">19</span>
                            </button>
                            <button class="interaction-btn">
                                <span class="interaction-icon">💬</span>
                                <span>16 replies</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Community Guidelines -->
        <div class="guidelines">
            <h3>Community Guidelines</h3>
            <ul>
                <li>Be respectful and supportive of others</li>
                <li>Keep discussions constructive and on-topic</li>
                <li>Protect privacy - no personal information or photos</li>
                <li>Report any concerning content to moderators</li>
                <li>Remember: This is peer support, not professional therapy</li>
            </ul>
        </div>
    </div>

    <script>
        // Filter posts by category
        function filterByCategory(btn, category) {
            // Update active button
            document.querySelectorAll('.category-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            // Filter posts
            const posts = document.querySelectorAll('.post');
            posts.forEach(post => {
                if (category === 'All' || post.dataset.category === category) {
                    post.style.display = 'block';
                } else {
                    post.style.display = 'none';
                }
            });

            // Check if no posts found
            checkEmptyState();
        }

        // Search posts
        function searchPosts() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const posts = document.querySelectorAll('.post');

            posts.forEach(post => {
                const title = post.querySelector('h3').textContent.toLowerCase();
                const text = post.querySelector('.post-text').textContent.toLowerCase();
                
                if (title.includes(filter) || text.includes(filter)) {
                    post.style.display = 'block';
                } else {
                    post.style.display = 'none';
                }
            });

            checkEmptyState();
        }

        // Switch between Recent and Popular tabs
        function switchTab(tab, evt) {
            // update active tab button
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            if (evt && evt.target) {
                const btn = evt.target.closest('.tab-btn');
                if (btn) btn.classList.add('active');
            }

            // Recent: keep DOM order. Popular: sort posts by like count (descending).
            const postsSection = document.getElementById('postsSection');
            const posts = Array.from(postsSection.querySelectorAll('.post'));

            if (tab === 'popular') {
                posts.sort((a, b) => {
                    const aCountEl = a.querySelector('.interaction-btn .count');
                    const bCountEl = b.querySelector('.interaction-btn .count');
                    const aVal = aCountEl ? parseInt(aCountEl.textContent, 10) || 0 : 0;
                    const bVal = bCountEl ? parseInt(bCountEl.textContent, 10) || 0 : 0;
                    return bVal - aVal;
                });
            } else {
                // keep original document order (assumes current DOM order is "recent")
                posts.sort((a, b) => {
                    return 0; // no-op: maintain current order
                });
            }

            // re-attach posts in new order
            posts.forEach(p => postsSection.appendChild(p));
        }

        // Toggle like on post
        function toggleLike(event, btn) {
            event.stopPropagation();
            btn.classList.toggle('liked');
            
            const countSpan = btn.querySelector('.count');
            let count = parseInt(countSpan.textContent);
            
            if (btn.classList.contains('liked')) {
                count++;
            } else {
                count--;
            }
            
            countSpan.textContent = count;
        }

        // View post details
        function viewPost(postId) {
            window.location.href = '${pageContext.request.contextPath}/forum/post/' + postId;
        }

        // Check if there are no visible posts
        function checkEmptyState() {
            const postsSection = document.getElementById('postsSection');
            const visiblePosts = Array.from(document.querySelectorAll('.post')).filter(p => p.style.display !== 'none');
            
            // Remove existing empty state
            const existingEmpty = postsSection.querySelector('.empty-state');
            if (existingEmpty) {
                existingEmpty.remove();
            }

            if (visiblePosts.length === 0) {
                const emptyState = document.createElement('div');
                emptyState.className = 'empty-state';
                emptyState.innerHTML = `
                    <div class="empty-state-icon">💬</div>
                    <p>No posts found</p>
                `;
                postsSection.appendChild(emptyState);
            }
        }

        // Keyboard accessibility
        document.querySelectorAll('.post').forEach(post => {
            post.setAttribute('tabindex', '0');
            post.addEventListener('keypress', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    post.click();
                }
            });
        });
    </script>
</body>
</html>