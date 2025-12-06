<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book Counselling Session</title>

    <style>
        body {
            font-family: "Inter", Arial, sans-serif;
            background-color: #f6fdfb;
            color: #1a1a1a;
            margin: 0; 
        }

        .navbar-placeholder {
            height: 70px; 
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        p {
            color: #6b7280;
            margin-top: 0;
        }

        .container {
            margin: 20px auto;
            width: 80%;
        }

        .card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0px 2px 4px rgba(0,0,0,0.03);
        }

        label {
            font-weight: 600;
            font-size: 14px;
        }

        input, select, textarea {
            border: 1px solid #d1d5db;
            border-radius: 8px;
            padding: 10px;
            margin-top: 5px;
            font-size: 14px;
        }

        input[type="text"], textarea, select {
            width: 95%;
        }

        input[readonly] {
            background-color: #e5e7eb;
            color: #6b7280;
            cursor: not-allowed;
        }

        .submit-btn {
            background-color: #2dd4bf;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
            font-size: 15px;
        }

        .submit-btn:hover {
            background-color: #1fb3a3;
        }

        .back-btn {
            background-color: #d1d5db;
            color: #1a1a1a;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
            font-size: 15px;
            margin-right: 10px;
        }

        .back-btn:hover {
            background-color: #b0b3b8;
        }

        .button-group {
            display: flex;
            justify-content: flex-start;
            gap: 10px;
        }

        .flex-row {
            display: flex;
            gap: 20px;
            width: 100%;
        }

        .flex-item {
            flex: 1;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>

<div class="navbar-placeholder"></div>

    <div class="container">

        <h1>Book Counselling Session</h1>
        <p>Browse our experienced mental health professionals and book a session that works for you</p>
        <br>

        <div class="card">

            <h2 style="margin-top:0; font-size:22px;">Virtual Counselling Session Booking</h2>
            <p>Fill in the desired date and time for your next session.</p>
            <br>

            <label>Counselor</label><br>
            <input type="text" value="Dr. Michael Tan" readonly>
            <br><br>
            <div class="flex-row">
                <div class="flex-item">
                    <label>Date</label><br>
                    <select name="date">
                        <option value="">Select date available</option>
                        <option value="2025-01-10">02 January 2025</option>
                        <option value="2025-01-11">04 January 2025</option>
                        <option value="2025-01-12">06 January 2025</option>
                        <option value="2025-01-13">09 January 2025</option>
                        <option value="2025-01-14">11 January 2025</option>
                    </select>
                </div>

                <div class="flex-item">
                    <label>Time</label><br>
                    <select name="time">
                        <option value="">Select time slot</option>
                        <option value="11:00 AM"> 11:00 AM</option>
                        <option value="12:00 AM">12:00 AM</option>
                        <option value="2:00 AM">2:00 AM</option>
                        <option value="3:00 PM"> 3:00 PM</option>
                    </select>
                </div>
            </div>

            <br>

            <label>Notes to Counselor</label><br>
            <textarea rows="3" placeholder="Enter anything you wish for your counselor to know ahead of your session"></textarea>
            <br><br>

            <label>Preliminary Focus</label><br>
            <textarea rows="5" placeholder="Enter your issue in brief explanation here"></textarea>

            <br>

            <div class="button-group">
                <form method="get" action="${pageContext.request.contextPath}/sessions/book" style="display:inline;">
                    <button class="back-btn" type="submit">Back</button>
                </form>

                <form method="post" action="#" style="display:inline;">
                    <button class="submit-btn" type="submit">Book Now</button>
                </form>
            </div>

    </div>
</div>

</body>
</html>
