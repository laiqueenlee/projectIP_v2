<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Upcoming Sessions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6fdfb;
            color: #1a1a1a;
            margin: 40px;
        }

        h1 {
            color: #00c4c3;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        p {
            color: #6b7280;
            font-size: 14px;
            margin-top: 0;
        }

        table.card {
            width: 100%;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 20px;
            border-collapse: separate;
            border-spacing: 0;
        }

        table.session-header {
            width: 100%;
            margin-bottom: 15px;
        }

        table.session-header td {
            vertical-align: middle;
        }

        table.session-item {
            width: 100%;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 12px;
            background-color: #fff;
            border-collapse: separate;
            border-spacing: 0;
        }

        td.session-info {
            vertical-align: top;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #00c4c3;
            color: #fff;
            font-weight: bold;
            text-align: center;
            line-height: 40px;
            display: inline-block;
        }

        .session-text h3 {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .badge {
            font-size: 10px;
            font-weight: 600;
            border-radius: 12px;
            padding: 2px 8px;
        }

        .badge-confirmed {
            background-color: #34d399;
            color: #fff;
        }

        .badge-pending {
            background-color: #d1d5db;
            color: #6b7280;
        }

        .session-subtext {
            font-size: 13px;
            color: #6b7280;
        }

        td.session-actions {
            text-align: right;
            vertical-align: middle;
            gap: 8px;
        }

        /* Modern button styles for links */
        .btn-view, .btn-start {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .btn-view {
            background-color: #f1f2f6;
            color: #1a1a1a;
        }
        .btn-view:hover {
            background-color: #e2e4ea;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.12);
        }

        .btn-start {
            background-color: #00c4c3;
            color: #fff;
        }
        .btn-start:hover {
            background-color: #00afa9;
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.12);
        }

        /* Disabled start button */
        .btn-start.disabled {
            background-color: #d1d5db;
            color: #6b7280;
            cursor: not-allowed;
            box-shadow: none;
            transform: none;
        }
    </style>
</head>
<body>

<jsp:include file="/WEB-INF/views/includes/mhp-navbar.jsp" />
<h1>Manage Upcoming Sessions</h1>
<p>Manage your schedule and upcoming counseling sessions</p>

<table class="card">
    <tr>
        <td>
            <table class="session-header">
                <tr>
                    <td><h2>Upcoming Sessions</h2></td>
                </tr>
            </table>

            <table class="session-item">
                <tr>
                    <td class="session-info">
                        <table>
                            <tr>
                                <td><div class="avatar">JS</div></td>
                                <td style="padding-left: 15px;">
                                    <div class="session-text">
                                        <h3>
                                            John Smith <span class="badge badge-confirmed">Confirmed</span>
                                        </h3>
                                        <div class="session-subtext">
                                            Initial Consultation <br>
                                            &#128337; 12 Dec 2025 • 60 min
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="session-actions">
                        <a href="${pageContext.request.contextPath}/sessions/detail" class="btn-view">View Details</a>
                        <a href="${pageContext.request.contextPath}/sessions/meeting" class="btn-start">&#127909; Start Session</a>
                    </td>
                </tr>
            </table>

            <table class="session-item">
                <tr>
                    <td class="session-info">
                        <table>
                            <tr>
                                <td><div class="avatar">AM</div></td>
                                <td style="padding-left: 15px;">
                                    <div class="session-text">
                                        <h3>
                                            Alice Moore <span class="badge badge-pending">Pending</span>
                                        </h3>
                                        <div class="session-subtext">
                                            Follow Up Session <br>
                                            &#128337; 13 Dec 2025 • 45 min
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="session-actions">
                        <a href="${pageContext.request.contextPath}/sessions/detail" class="btn-view">View Details</a>
                        <span class="btn-start disabled">&#127909; Start Session</span>
                    </td>
                </tr>
            </table>

            <!-- Additional sessions follow same structure -->

        </td>
    </tr>
</table>

</body>
</html>
