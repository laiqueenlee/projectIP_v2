<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>MindWell Hub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        body { margin:0; font-family: "Segoe UI", Roboto, Arial, sans-serif; color:#222; }
        .hero {
            display:flex;
            align-items:center;
            justify-content:center;
            flex-direction:column;
            height:60vh;
            background: linear-gradient(135deg, #79e5c6 0%, #9fe8d9 50%, #d6f7ee 100%);
            text-align:center;
            padding:40px 20px;
        }
        .logo { width:64px; height:64px; border-radius:12px; margin-bottom:16px; display:flex; align-items:center; justify-content:center; background:rgba(255,255,255,0.15); }
        .hero h1 { margin:0 0 12px; font-size:48px; color:#fff; font-weight:700; letter-spacing: -.5px; }
        .hero p { margin:0 0 20px; color:rgba(255,255,255,0.95); font-size:18px; max-width:800px; }
        .cta { display:flex; gap:12px; }
        .btn {
            padding:12px 22px; border-radius:8px; font-weight:600; text-decoration:none;
        }
        .btn-primary { background:#fff; color:#17a88b; }
        .btn-outline { background:transparent; color:#fff; border:1px solid rgba(255,255,255,0.8); }
        .section { padding:48px 16px; text-align:center; }
        .section h2 { margin-bottom:12px; font-size:28px; }
        .section p { color:#666; max-width:900px; margin:0 auto; }
    </style>
</head>
<body>
    <header class="hero">
        <div class="logo" aria-hidden="true">
            <!-- simple brain icon using SVG -->
            <svg width="36" height="36" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 3c1.5 0 2.2.4 3 1 .8.6 1.5 1.5 2 3 .5 1.5.5 3 .5 4.5S16 15 16 16.5 16.8 19 15 21c-1.8 2-3.5 0-3.5 0S11 19 9 17c-2-2-3 0-3 0S4 14 4 11.5 5 7 6.5 5.5 10.5 3 12 3z" fill="#fff" opacity="0.95"/>
            </svg>
        </div>

        <h1>MindWell Hub</h1>
        <p>Your trusted digital companion for mental health literacy and wellness support</p>

        <div class="cta">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/auth/register">Get Started Free</a>
            <a class="btn btn-outline" href="${pageContext.request.contextPath}/auth/login">Sign In</a>
        </div>
    </header>

    <section class="section">
        <h2>Everything You Need for Mental Wellness</h2>
        <p>A comprehensive platform designed for students, mental health professionals, and administrators.</p>
    </section>
</body>
</html>