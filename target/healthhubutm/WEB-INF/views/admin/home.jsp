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

        /* Tabs */
        .tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tab {
            padding: 8px 16px;
            border-radius: 12px;
            background-color: #f3f4f6;
            color: #6b7280;
            font-weight: 500;
            cursor: pointer;
        }

        .tab.active {
            background-color: #ffffff;
            color: #111827;
            border: 1px solid #e5e7eb;
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
            display: flex;
            flex-direction: column;
        }

        /* User List */
        .user-list, .distribution-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 15px;
        }

        /* User Entry */
        .user-entry {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 15px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            width: 100%;
            box-sizing: border-box;
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
            width: 100%;
            box-sizing: border-box;
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
    <jsp:include page="/WEB-INF/views/includes/admin-header.jsp" />

    <!-- Dashboard Content -->
    <div class="dashboard-content">

        <!-- Platform Growth -->
        <div class="card">
            <h2>Platform Growth</h2>
            <small>User acquisition trends</small>

            <div style="margin-top: 25px;">
                <div style="margin-bottom: 20px;">
                    <strong>This Month</strong>
                    <div style="color:#10b981; font-weight:600; margin-top:4px;">
                        +156 users &#8599;
                    </div>
                </div>

                <div style="margin-bottom: 20px;">
                    <strong>Last Month</strong>
                    <div style="color:#111827; margin-top:4px;">
                        +124 users
                    </div>
                </div>

                <div>
                    <strong>Growth Rate</strong>
                    <div style="color:#10b981; font-weight:600; margin-top:4px;">
                        +25.8%
                    </div>
                </div>
            </div>
        </div>

        <!-- Engagement Metrics -->
        <div class="card">
            <h2>Engagement Metrics</h2>
            <small>User activity overview</small>

            <div style="margin-top: 25px;">
                <div style="margin-bottom: 20px;">
                    <strong>Avg. Session Duration</strong>
                    <div style="margin-top:4px;">
                        18 min
                    </div>
                </div>

                <div style="margin-bottom: 20px;">
                    <strong>Daily Active Users</strong>
                    <div style="margin-top:4px;">
                        432
                    </div>
                </div>

                <div>
                    <strong>Completion Rate</strong>
                    <div style="margin-top:4px;">
                        72%
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
