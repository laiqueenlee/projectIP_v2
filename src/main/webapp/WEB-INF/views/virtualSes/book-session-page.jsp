<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Counselling Session</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Inter", Arial, sans-serif;
            background: linear-gradient(to bottom, #eef6f8, #f7fbfc);
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
            text-align: center;
        }

        h1 {
            font-size: 32px;
            font-weight: 700;
            color: #222;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #6c757d;
            font-size: 16px;
            margin-bottom: 40px;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .card {
            width: 340px;
            background: #ffffff;
            border-radius: 18px;
            padding: 0 0 25px 0;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            height: 560px; 
        }

        .card img {
            width: 100%;
            height: 260px;
            object-fit: cover;
        }

        .card h3 {
            font-size: 18px;
            font-weight: 700;
            text-align: left;
            margin: 15px 20px 5px;
        }

        .card p {
            text-align: left;
            margin: 0 20px 8px;
            color: #6c757d;
            font-size: 13px;
        }

        .rating-box {
            display: inline-flex;
            align-items: center;
            background: #e8fdf8;
            color: #22c58b;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 5px;
        }

        .available-times-title {
            font-weight: 600;
            color: #222;
            margin-top: 15px;
            margin-bottom: 10px;
            text-align: left;
            padding-left: 20px;
            font-size: 14px;
        }

        .available-times span {
            display: inline-block;
            padding: 6px 14px;
            background: #f1f5f9;
            border-radius: 8px;
            margin: 4px;
            font-size: 13px;
            color: #333;
        }

        .btn-book {
            margin-top: 20px;
            width: 90%;
            padding: 12px;
            background: #00d1d1;
            border: none;
            color: #fff;
            font-size: 15px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn-book:hover {
            background: #00baba;
        }

        select {
            margin-top: 10px;
            padding: 10px;
            width: 90%;
            border-radius: 10px;
            border: 1px solid #ccd5dd;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>

<div class="container">

    <h1>Book Counselling Session</h1>
    <p class="subtitle">Browse our experienced mental health professionals and book a session that works for you</p>

    <div class="cards">

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/mhp1.jpg" alt="Dr. John Doe">

            <h3>Dr. John Doe <span class="rating-box">4.9</span></h3>
            <p>General Counselling</p>
            <p>41 sessions completed</p>

            <p class="available-times-title">Available Times</p>
            <div class="available-times">
                <span>Mon 10:00 AM</span>
                <span>Thu 2:00 PM</span>
                <span>Fri 4:00 PM</span>
            </div>

            <form action="${pageContext.request.contextPath}/sessions/book" method="post">
                <!-- <select name="time">
                    <option>Mon 10:00 AM</option>
                    <option>Thu 2:00 PM</option>
                    <option>Fri 4:00 PM</option>
                </select> -->
                <button class="btn-book">Book Session</button>
            </form>
        </div>

            <div class="card">
            <img src="${pageContext.request.contextPath}/images/mhp2.jpg" alt="Dr. Emily Stone">

            <h3>Dr. Emily Stone <span class="rating-box">4.8</span></h3>
            <p>Anxiety & Stress Management</p>
            <p>128 sessions completed</p>

            <p class="available-times-title">Available Times</p>
            <div class="available-times">
                <span>Mon 9am–1pm</span>
                <span>Wed 3pm–6pm</span>
                <span>Fri 10am–12pm</span>
            </div>

            <form action="${pageContext.request.contextPath}/sessions/book" method="post">
                <!-- <select name="time">
                    <option>Mon 9am–1pm</option>
                    <option>Wed 3pm–6pm</option>
                    <option>Fri 10am–12pm</option>
                </select> -->
                <button class="btn-book">Book Session</button>
            </form>
        </div>

        <div class="card">
            <img src="${pageContext.request.contextPath}/images/mhp3.jpg" alt="Dr. Michael Tan">

            <h3>Dr. Michael Tan <span class="rating-box">5.0</span></h3>
            <p>Depression & Mood Disorders</p>
            <p>203 sessions completed</p>

            <p class="available-times-title">Available Times</p>
            <div class="available-times">
                <span>Tue 11am–3pm</span>
                <span>Thu 9am–12pm</span>
                <span>Sat 1pm–4pm</span>
            </div>

            <form action="${pageContext.request.contextPath}/sessions/book" method="post">
                <!-- <select name="time">
                    <option>Tue 11am–3pm</option>
                    <option>Thu 9am–12pm</option>
                    <option>Sat 1pm–4pm</option>
                </select> -->
                <button class="btn-book">Book Session</button>
            </form>
        </div>

    </div>
</div>
</body>
</html>




<!-- DYNAMIC -->
<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Counselling Session</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body>
<div class="container">
    <h1>Book Counselling Session</h1>
    <p class="subtitle">Browse our experienced mental health professionals and book a session that works for you</p>

    
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <div class="cards">

        <c:choose>
            <c:when test="${empty mhps}">
                <p>No counsellors available.</p>
            </c:when>

            <c:otherwise>
                <c:forEach var="mhp" items="${mhps}">
                    <div class="card">

                        
                        <c:url value='/images/${mhp.username}.jpg' var='profileImg'/>
                        <c:url value='/images/default.jpg' var='defaultImg'/>

                        <img src="${profileImg}"
                             onerror="this.src='${defaultImg}'"
                             alt="${mhp.fullName}" />

                        <h3>${mhp.fullName}</h3>
                        <p>General Counselling</p>

                        <%-- ORIGINAL DYNAMIC FIELDS REMOVED BECAUSE MODEL DOESN’T HAVE THE PROPERTIES --%>
                        <%-- <p>Rating: <span class="rating">${mhp.rating}</span></p> --%>
                        <%-- <p>${mhp.completedSessions} sessions completed</p> --%>

                        
                        <p>Rating: 8.5/10</p>
                        <p>41 sessions completed</p>

                        <div class="available-times">
                            <p><strong>Available Times:</strong></p>

                            <c:choose>
                                <c:when test="${empty availableSlotsMap[mhp.username]}">
                                    <span>No slots available</span>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="slot" items="${availableSlotsMap[mhp.username]}">
                                        <span>${slot}</span>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <form action="<c:url value='/sessions/book'/>" method="post">
                            <input type="hidden" name="mhpUsername" value="${mhp.username}"/>

                            <select name="time" required>

                                <c:choose>
                                    <c:when test="${empty availableSlotsMap[mhp.username]}">
                                        <option disabled>No slots available</option>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach var="slot" items="${availableSlotsMap[mhp.username]}">
                                            <option value="${slot}">${slot}</option>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                            </select>

                            <button type="submit" class="btn-book">Book Session</button>
                        </form>

                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html> -->
