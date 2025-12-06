<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 20px 40px;
            color: #111827;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        h2 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        small {
            color: #6b7280;
        }
        .right-logout {
            position: absolute;
            top: 20px;   /* adjust based on your page padding */
            right: 40px; /* matches your body padding */
        }

        .logout-btn {
            background: #6c6c6c;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }

        .logout-btn:hover {
            background: white;
            color: black;
        }

        .btn-ghost{
            padding:10px 14px;
            border-radius:8px;
            border:none;
            cursor:pointer;
            transition:var(--transition);
            font-weight:600;
            font-size:13px;
            background:#fff;
            border:1px solid rgba(18,24,33,0.06);
            color:#27433f;
        }

        /* Top Summary Cards */
        .summary-cards {
            display: flex;
            gap: 20px;
            margin: 20px 0 30px 0;
            flex-wrap: wrap;
        }

        .summary-card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 20px;
            flex: 1;
            min-width: 180px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #111827;
        }

        .summary-card .info {
            display: flex;
            flex-direction: column;
        }

        .summary-card .info .number {
            font-size: 24px;
            font-weight: 700;
        }

        .summary-card .info .percent {
            color: #10b981; /* green for positive growth */
            font-weight: 500;
        }

        .summary-card .icon {
            font-size: 28px;
            background-color: #e0f7f6;
            border-radius: 8px;
            padding: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #14b8a6;
        }

        .tabs {
            display: flex;
            gap: 8px;
            margin-bottom: 20px;
            background-color: #f3f5f7;  /* light grey/blue background bar */
            padding: 6px;
            border-radius: 12px;
            align-items: center;
            width: fit-content;
        }

        /* Reset default button styles */
        .tabs form {
            margin: 0;
        }

        .tabs button {
            all: unset;
            cursor: pointer;
            display: inline-block;
            font-weight: 500;
            font-size: 14px;
            line-height: 1;
            padding: 8px 16px;
            border-radius: 8px;
            transition: background-color 0.15s ease, color 0.15s ease;
        }

        /* Inactive tab: greyish text, transparent/none background initially */
        .tab {
            background-color: transparent;
            color: #6b7280;  /* grey text for inactive */
        }

        /* When a tab is active (selected) */
        .tab.active {
            background-color: #ffffff;  /* white pill */
            color: #111827;             /* dark text */
        }

        /* Hover effect on inactive tabs */
        .tab:not(.active):hover {
            background-color: #e5e8eb;  /* slightly lighter grey background on hover */
            color: #374151;             /* slightly darker grey text on hover */
        }
        /* Dashboard Content */
        .dashboard-content {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 20px;
            flex: 1;
            min-width: 300px;
        }

        /* User Entry */
        .user-entry {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            padding: 12px 15px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-info span {
            font-size: 12px;
            color: #6b7280;
            margin-top: 3px;
        }

        .badge {
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 12px;
            font-weight: 500;
            color: #ffffff;
            text-transform: capitalize;
        }

        .badge.active {
            background-color: #14b8a6;
        }

        .badge.inactive {
            background-color: #d1d5db;
            color: #6b7280;
        }

        /* User Distribution */
        .distribution-item {
            margin-top: 15px;
        }

        .distribution-item .label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .progress-bar-container {
            background-color: #e5e7eb;
            border-radius: 8px;
            height: 10px;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            border-radius: 8px;
        }

        .progress-student {
            width: 87%;
            background-color: #14b8a6;
        }

        .progress-mhp {
            width: 11%;
            background-color: #3b82f6;
        }

        .progress-admin {
            width: 2%;
            background-color: #ec4899;
        }
    </style>
</head>
<body>

    <div class="top-bar">
        <div class="left-tabs">
            <h1>Admin Dashboard</h1>
            <small>Monitor platform health and user activity</small>
        </div>

    <div class="right-logout">
        <form action="${pageContext.request.contextPath}/auth/logout" method="get">
            <button type="submit" class="tab logout-btn">Logout</button>
        </form>
    </div>
</div>


<!-- Top Summary Cards -->
<div class="summary-cards">
    <div class="summary-card">
        <div class="info">
            <div>Total Users</div>
            <div class="number">1,247</div>
            <div class="percent">+12%</div>
        </div>
        <div class="icon">👤</div>
    </div>

    <div class="summary-card">
        <div class="info">
            <div>Active Content</div>
            <div class="number">156</div>
            <div class="percent">+8%</div>
        </div>
        <div class="icon">📄</div>
    </div>

    <div class="summary-card">
        <div class="info">
            <div>Forum Posts</div>
            <div class="number">892</div>
            <div class="percent">+23%</div>
        </div>
        <div class="icon">💬</div>
    </div>

    <div class="summary-card">
        <div class="info">
            <div>Daily Active</div>
            <div class="number">432</div>
            <div class="percent">+5%</div>
        </div>
        <div class="icon">📈</div>
    </div>
</div>

<!-- Continuous Tabs Bar -->
<div class="tabs">

    <form action="#" method="get">
        <button class="tab <%= request.getRequestURI().contains("user-management") ? "active" : "" %>">
            User Management
        </button>
    </form>

    <form action="${pageContext.request.contextPath}/admin/content-quality" method="get">
        <button class="tab <%= request.getRequestURI().contains("content-quality") ? "active" : "" %>">
            Content Quality
        </button>
    </form>

    <form action="${pageContext.request.contextPath}/admin/moderation-queue" method="get">
        <button class="tab <%= request.getRequestURI().contains("moderation-queue") ? "active" : "" %>">
            Moderation Queue
        </button>
    </form>

    <form action="${pageContext.request.contextPath}/admin/platform-analytics" method="get">
        <button class="tab <%= request.getRequestURI().contains("platform-analytics") ? "active" : "" %>">
            Platform Analytics
        </button>
    </form>

</div>

<!-- (rest of page: dashboard content, cards, etc.) -->

</body>
</html>
