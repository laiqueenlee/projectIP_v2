<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Counselling Session</title>
</head>
<body>

<h1>Book Counselling Session</h1>
<p>Browse our experienced mental health professionals and book a session that works for you</p>
<br>

<table border="1" cellpadding="20" cellspacing="0" width="80%">
    <tr>
        <td>

            <h2>Virtual Counselling Session Booking</h2>
            <p>Fill in the desired date and time for your next session.</p>
            <br>

            <!-- Counselor -->
            <label><b>Counselor</b></label><br>
            <input type="text" value="Dr. Sarah Mitchell" size="80"><br><br>

            <!-- Date + Time row -->
            <table width="100%">
                <tr>
                    <td width="50%">
                        <!-- Date Dropdown -->
                        <label><b>Date</b></label><br>
                        <select name="date">
                            <option value="">Select date available</option>
                            <option value="2025-01-10">January 10, 2025</option>
                            <option value="2025-01-11">January 11, 2025</option>
                            <option value="2025-01-12">January 12, 2025</option>
                            <option value="2025-01-13">January 13, 2025</option>
                            <option value="2025-01-14">January 14, 2025</option>
                        </select>
                    </td>

                    <td width="50%">
                        <!-- Time Dropdown -->
                        <label><b>Time</b></label><br>
                        <select name="time">
                            <option value="">Select time slot</option>
                            <option value="9:00 AM">9:00 AM</option>
                            <option value="10:00 AM">10:00 AM</option>
                            <option value="11:00 AM">11:00 AM</option>
                            <option value="2:00 PM">2:00 PM</option>
                            <option value="4:00 PM">4:00 PM</option>
                        </select>
                    </td>
                </tr>
            </table>

            <br>

            <!-- Notes -->
            <label><b>Notes to Counselor</b></label><br>
            <textarea rows="3" cols="90" 
                placeholder="Enter anything you wish for your counselor to know ahead of your session"></textarea>
            <br><br>

            <!-- Preliminary Focus -->
            <label><b>Preliminary Focus</b></label><br>
            <textarea rows="8" cols="90" 
                placeholder="Enter your issue in brief explanation here"></textarea>
            <br><br>

            <!-- Book Button -->
            <form>
                <input type="submit" value="Book Now">
            </form>

        </td>
    </tr>
</table>

</body>
</html>
