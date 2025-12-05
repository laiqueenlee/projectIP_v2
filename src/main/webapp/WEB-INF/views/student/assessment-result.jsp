<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Assessment Complete - MindWell</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <style>
        :root {
            --teal: #6fd7cc;
            --teal-dark: #3fb9a8;
            --teal-light: #e8f9f7;
            --muted: #7b8794;
            --success: #28a745;
            --card-bg: #ffffff;
            --page-bg: #f6fbfa;
            --radius: 12px;
            --shadow: 0 10px 30px rgba(18,24,33,0.06);
            --shadow-hover: 0 15px 40px rgba(18,24,33,0.1);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Inter, "Segoe UI", Roboto, Arial, sans-serif;
            background: var(--page-bg);
            color: #123;
            line-height: 1.5;
        }
        .page {
            max-width: 900px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .completion-header {
            text-align: center;
            margin-bottom: 40px;
            animation: slideDown 0.6s ease-out;
        }
        .checkmark {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--success), #1e8449);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 48px;
            box-shadow: 0 10px 40px rgba(40, 167, 69, 0.3);
            animation: popIn 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }
        .completion-header h1 {
            font-size: 32px;
            font-weight: 700;
            color: #123;
            margin: 0;
        }
        .completion-header p {
            color: var(--muted);
            font-size: 16px;
            margin: 8px 0 0 0;
        }
        .result-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 30px;
        }
        .result-card {
            background: var(--card-bg);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.6s ease-out backwards;
            transition: var(--transition);
        }
        .result-card:hover { box-shadow: var(--shadow-hover); }
        .result-card:nth-child(1) { animation-delay: 0.1s; }
        .result-card:nth-child(2) { animation-delay: 0.2s; }
        .score-section {
            text-align: center;
        }
        .score-number {
            font-size: 64px;
            font-weight: 800;
            color: var(--teal-dark);
            margin: 0;
            animation: countUp 1s ease-out;
        }
        .score-label {
            color: var(--muted);
            font-size: 13px;
            margin: 8px 0 0 0;
        }
        .score-category {
            display: inline-block;
            background: var(--teal-light);
            color: var(--teal-dark);
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 700;
            font-size: 12px;
            margin-top: 16px;
        }
        .wellness-metrics {
            display: grid;
            gap: 12px;
        }
        .metric {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px;
            background: #fbfffe;
            border-radius: 10px;
        }
        .metric-name {
            font-weight: 600;
            color: #123;
        }
        .metric-value {
            color: var(--teal-dark);
            font-weight: 700;
        }
        .metric-bar {
            width: 120px;
            height: 6px;
            background: #eef6f5;
            border-radius: 6px;
            overflow: hidden;
        }
        .metric-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--teal), var(--teal-dark));
            border-radius: 6px;
            animation: fillBar 1.5s ease-out 0.3s forwards;
            width: 0;
        }
        .feedback-section {
            background: var(--card-bg);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 24px;
            animation: fadeInUp 0.6s ease-out 0.3s backwards;
            border-left: 4px solid var(--teal-dark);
        }
        .feedback-title {
            font-size: 18px;
            font-weight: 700;
            color: #123;
            margin: 0 0 12px 0;
        }
        .feedback-text {
            color: #123;
            font-size: 14px;
            line-height: 1.8;
            margin: 0;
        }
        .recommendations-section {
            background: var(--card-bg);
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.6s ease-out 0.4s backwards;
        }
        .recommendations-title {
            font-size: 18px;
            font-weight: 700;
            color: #123;
            margin: 0 0 16px 0;
        }
        .recommendations-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: grid;
            gap: 12px;
        }
        .recommendation-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px;
            background: linear-gradient(135deg, var(--teal-light) 0%, #f0fffe 100%);
            border-radius: 10px;
            border-left: 4px solid var(--teal);
            transition: var(--transition);
        }
        .recommendation-item:hover {
            background: linear-gradient(135deg, #d4f4f2 0%, #e8f9f7 100%);
            transform: translateX(4px);
        }
        .check-icon {
            width: 24px;
            height: 24px;
            background: var(--success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 700;
            flex-shrink: 0;
        }
        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-top: 30px;
        }
        .btn {
            padding: 14px 24px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 600;
            font-size: 14px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background: linear-gradient(180deg, var(--teal), var(--teal-dark));
            color: #fff;
            box-shadow: 0 4px 12px rgba(63,185,168,0.3);
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(63,185,168,0.4);
        }
        .btn-secondary {
            background: #fff;
            border: 2px solid var(--teal);
            color: var(--teal-dark);
        }
        .btn-secondary:hover {
            background: var(--teal-light);
        }
        .share-section {
            background: #f0f9f9;
            border-left: 4px solid var(--teal);
            border-radius: var(--radius);
            padding: 20px;
            margin-top: 30px;
            animation: fadeInUp 0.6s ease-out 0.5s backwards;
        }
        .share-title {
            font-size: 14px;
            font-weight: 700;
            color: var(--teal-dark);
            margin: 0 0 12px 0;
        }
        .share-text {
            color: #123;
            font-size: 13px;
            margin: 0;
        }
        
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes popIn {
            0% { opacity: 0; transform: scale(0); }
            50% { transform: scale(1.1); }
            100% { opacity: 1; transform: scale(1); }
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes countUp {
            from { opacity: 0; transform: scale(0.5); }
            to { opacity: 1; transform: scale(1); }
        }
        @keyframes fillBar {
            to { width: 100%; }
        }

        @media (max-width: 768px) {
            .page { padding: 20px 16px; }
            .result-grid { grid-template-columns: 1fr; }
            .button-group { grid-template-columns: 1fr; }
            .completion-header h1 { font-size: 24px; }
            .score-number { font-size: 48px; }
        }
    </style>
</head>
<body>
<div class="page">
    <!-- Completion Header -->
    <div class="completion-header">
        <div class="checkmark">✓</div>
        <h1>Assessment Complete!</h1>
        <p>Here are your personalized results</p>
    </div>

    <!-- Score and Metrics Cards -->
    <div class="result-grid">
        <!-- Your Overall Score -->
        <div class="result-card score-section">
            <h3 style="color: var(--muted); font-size: 12px; margin: 0 0 12px 0; text-transform: uppercase; letter-spacing: 0.5px; font-weight: 700;">Your Overall Score</h3>
            <div class="score-number"><c:out value="${score}"/></div>
            <div class="score-label">/25</div>
            <div class="score-category"><c:out value="${category}"/></div>
        </div>

        <!-- Wellness Metrics -->
        <div class="result-card">
            <h3 style="color: var(--muted); font-size: 12px; margin: 0 0 12px 0; text-transform: uppercase; letter-spacing: 0.5px; font-weight: 700;">Wellness Metrics</h3>
            <div class="wellness-metrics">
                <div class="metric">
                    <div class="metric-name">Engagement</div>
                    <div class="metric-value"><c:out value="${metrics.engagement}"/>%</div>
                </div>
                <div class="metric-bar">
                    <div class="metric-fill" style="width: ${metrics.engagement}%;"></div>
                </div>

                <div class="metric" style="margin-top: 16px;">
                    <div class="metric-name">Consistency</div>
                    <div class="metric-value"><c:out value="${metrics.consistency}"/>%</div>
                </div>
                <div class="metric-bar">
                    <div class="metric-fill" style="width: ${metrics.consistency}%;"></div>
                </div>

                <div class="metric" style="margin-top: 16px;">
                    <div class="metric-name">Progress</div>
                    <div class="metric-value"><c:out value="${metrics.progress}"/>%</div>
                </div>
                <div class="metric-bar">
                    <div class="metric-fill" style="width: ${metrics.progress}%;"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Personalized Feedback -->
    <div class="feedback-section">
        <h3 class="feedback-title">💭 Personalized Feedback</h3>
        <p class="feedback-text">
            <c:out value="${feedback}"/>
        </p>
    </div>

    <!-- Recommended Actions -->
    <div class="recommendations-section">
        <h3 class="recommendations-title">✨ Recommended Actions</h3>
        <ul class="recommendations-list">
            <c:forEach items="${recommendations}" var="rec">
                <li class="recommendation-item">
                    <div class="check-icon">✓</div>
                    <div><c:out value="${rec}"/></div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Action Buttons -->
    <div class="button-group">
        <a href="${pageContext.request.contextPath}/student/assessment/" class="btn btn-secondary">Take Another Assessment</a>
        <a href="${pageContext.request.contextPath}/student/home" class="btn btn-primary">View Dashboard</a>
    </div>

    <!-- Share Section -->
    <div class="share-section">
        <h3 class="share-title">💡 Tip</h3>
        <p class="share-text">Regular assessments help you track your mental health journey over time. Consider taking assessments weekly to monitor your progress and wellbeing trends.</p>
    </div>
</div>

<script>
    // Smooth scroll to top
    window.scrollTo({ top: 0, behavior: 'smooth' });
</script>
</body>
</html>
