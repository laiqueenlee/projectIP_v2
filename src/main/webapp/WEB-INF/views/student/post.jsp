<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Managing exam stress - Peer Support Forum</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .header {
            background-color: transparent;
            padding: 0;
            margin-bottom: 30px;
            box-shadow: none;
        }

        .header h1 {
            font-size: 36px;
            margin-bottom: 8px;
            color: #1a1a1a;
            font-weight: 700;
        }

        .header p {
            color: #6b7280;
            font-size: 16px;
        }

        .post-card {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
            border: 1px solid #e5e7eb;
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
            background: linear-gradient(135deg, #5eead4 0%, #22d3ee 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 16px;
            flex-shrink: 0;
            font-size: 18px;
        }

        .post-meta {
            flex-grow: 1;
        }

        .post-title {
            font-size: 20px;
            font-weight: 600;
            color: #111827;
            margin-bottom: 8px;
            line-height: 1.4;
        }

        .post-info {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #6b7280;
            flex-wrap: wrap;
        }

        .badge {
            background-color: #d1fae5;
            color: #065f46;
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .post-content {
            color: #4b5563;
            margin-bottom: 20px;
            font-size: 15px;
            line-height: 1.6;
        }

        .post-stats {
            display: flex;
            gap: 24px;
            padding-top: 16px;
            border-top: 1px solid #f3f4f6;
            font-size: 14px;
            color: #6b7280;
        }

        .stat {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 500;
        }

        .replies-section {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
            border: 1px solid #e5e7eb;
        }

        .reply {
            padding: 24px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .reply:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .reply-header {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }

        .reply-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #5eead4 0%, #22d3ee 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 12px;
            font-size: 16px;
        }

        .reply-meta {
            display: flex;
            flex-direction: column;
        }

        .reply-author {
            font-weight: 600;
            color: #111827;
            font-size: 14px;
        }

        .reply-time {
            font-size: 13px;
            color: #9ca3af;
        }

        .reply-content {
            color: #4b5563;
            font-size: 15px;
            margin-left: 52px;
            line-height: 1.6;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: #22d3ee;
            text-decoration: none;
            margin-bottom: 24px;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: #06b6d4;
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
                <div class="avatar">A</div>
                <div class="post-meta">
                    <div class="post-title">Managing exam stress - what works for you?</div>
                    <div class="post-info">
                        <span>Anonymous</span>
                        <span>•</span>
                        <span class="badge">Moderated</span>
                        <span>•</span>
                        <span>Stress</span>
                        <span>•</span>
                        <span>2 hours ago</span>
                    </div>
                </div>
            </div>
            <div class="post-content">
                Finals are coming up and I'm feeling overwhelmed. What strategies have helped you cope with academic pressure?
            </div>
            <div class="post-stats">
                <div class="stat">
                    <span>👍</span>
                    <span>24</span>
                </div>
                <div class="stat">
                    <span>💬</span>
                    <span>18 replies</span>
                </div>
            </div>
        </div>

        <div class="replies-section">
            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">R</div>
                    <div class="reply-meta">
                        <div class="reply-author">Relax_Bro</div>
                        <div class="reply-time">Ali • 1 hours ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    Take deep breaths and remember that exams don't define you. You've got this!
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">S</div>
                    <div class="reply-meta">
                        <div class="reply-author">Sam</div>
                        <div class="reply-time">45 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    I totally get the stress—breaking study time into short sessions, getting enough sleep, and taking quick breaks to relax really helps me stay focused and calm during finals.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">D</div>
                    <div class="reply-meta">
                        <div class="reply-author">Daniel</div>
                        <div class="reply-time">12 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    I find that taking regular breaks, staying positive, and getting enough rest helps me manage exam stress better.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">M</div>
                    <div class="reply-meta">
                        <div class="reply-author">Maya</div>
                        <div class="reply-time">8 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    Exercise has been a game-changer for me. Even a 15-minute walk helps clear my mind and reduce anxiety.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">J</div>
                    <div class="reply-meta">
                        <div class="reply-author">Jordan</div>
                        <div class="reply-time">5 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    Making a realistic study schedule has helped me feel more in control. I break down what I need to study by day and it feels less overwhelming.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">L</div>
                    <div class="reply-meta">
                        <div class="reply-author">Lisa</div>
                        <div class="reply-time">3 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    Meditation apps like Headspace or Calm have really helped me. Just 10 minutes a day makes a difference.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">C</div>
                    <div class="reply-meta">
                        <div class="reply-author">Chris</div>
                        <div class="reply-time">2 minutes ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    Study groups help me stay accountable and motivated. Plus, explaining concepts to others really reinforces my own understanding.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">E</div>
                    <div class="reply-meta">
                        <div class="reply-author">Emma</div>
                        <div class="reply-time">1 minute ago</div>
                    </div>
                </div>
                <div class="reply-content">
                    I keep healthy snacks nearby while studying. Proper nutrition really affects my concentration and mood.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">T</div>
                    <div class="reply-meta">
                        <div class="reply-author">Tyler</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Limiting caffeine has surprisingly helped me. I was drinking too much coffee which made my anxiety worse.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">N</div>
                    <div class="reply-meta">
                        <div class="reply-author">Nina</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Talk to your professors if you're struggling! Most are really understanding and can offer guidance or extensions if needed.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">A</div>
                    <div class="reply-meta">
                        <div class="reply-author">Alex</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    I use the Pomodoro technique - 25 minutes of focused study, then a 5-minute break. It keeps me from burning out.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">K</div>
                    <div class="reply-meta">
                        <div class="reply-author">Kate</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Remember to reach out to campus counseling services if you need extra support. They're there to help!
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">B</div>
                    <div class="reply-meta">
                        <div class="reply-author">Ben</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Visualization techniques work for me. I imagine myself calmly taking the exam and doing well.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">O</div>
                    <div class="reply-meta">
                        <div class="reply-author">Olivia</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Getting enough sleep is crucial! All-nighters might seem productive but they actually hurt your performance.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">R</div>
                    <div class="reply-meta">
                        <div class="reply-author">Ryan</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Practice past exams if available. It helps reduce anxiety because you know what to expect.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">Z</div>
                    <div class="reply-meta">
                        <div class="reply-author">Zoe</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Journal your thoughts and feelings. Getting worries out of your head and onto paper can be really therapeutic.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">I</div>
                    <div class="reply-meta">
                        <div class="reply-author">Isaac</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Stay hydrated! Dehydration can affect concentration and increase stress levels.
                </div>
            </div>

            <div class="reply">
                <div class="reply-header">
                    <div class="reply-avatar">P</div>
                    <div class="reply-meta">
                        <div class="reply-author">Priya</div>
                        <div class="reply-time">Just now</div>
                    </div>
                </div>
                <div class="reply-content">
                    Be kind to yourself. One exam doesn't determine your future. You're doing your best and that's what matters.
                </div>
            </div>
        </div>
    </div>
</body>
</html>