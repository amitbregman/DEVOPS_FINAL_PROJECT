<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    boolean isLoggedIn = false;
    boolean isError = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        if ("user123".equals(user) && "123456".equals(pass)) {
            isLoggedIn = true;
        } else {
            isError = true;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CyberVault</title>
    <!-- Confetti library for the success animation -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #0f172a;
            color: #f8fafc;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background: #1e293b;
            padding: 2.5rem;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            width: 320px;
            text-align: center;
            border: 1px solid #334155;
        }
        .shake {
            animation: shake 0.4s ease-in-out;
            border-color: #ef4444;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-10px); }
            40%, 80% { transform: translateX(10px); }
        }
        h1 { margin: 0; font-size: 1.8rem; color: #38bdf8; }
        p.sub { color: #94a3b8; margin: 0.5rem 0 1.5rem; font-size: 0.95rem; }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin: 8px 0;
            border: 1px solid #475569;
            border-radius: 6px;
            background: #0f172a;
            color: #ffffff;
            box-sizing: border-box;
            outline: none;
        }
        input:focus { border-color: #38bdf8; }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background: #0284c7;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            font-weight: 600;
        }
        button:hover { background: #0369a1; }
        .success-title { color: #4ade80; font-size: 1.8rem; margin: 0 0 10px 0; }
        .links-container {
            margin-top: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .btn-link {
            color: #38bdf8;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        .btn-link:hover {
            color: #7dd3fc;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<% if (isLoggedIn) { %>
    <!-- Success View -->
    <div class="card" style="border-color: #4ade80; box-shadow: 0 0 35px rgba(74, 222, 128, 0.2);">
        <h1 class="success-title">Logged In Successfully!</h1>
        <p class="sub">Welcome back, <strong>user123</strong>.</p>
        
        <div class="links-container">
            <a href="https://apod.nasa.gov/apod/astropix.html" target="_blank" class="btn-link">🚀 View NASA Astronomy Picture of the Day (;</a>
            <a href="index.jsp" class="btn-link" style="color: #94a3b8;">← Log Out</a>
        </div>
    </div>

    <script>
        // Trigger multi-angle confetti explosion
        const duration = 2500;
        const end = Date.now() + duration;

        (function frame() {
            confetti({ particleCount: 5, angle: 60, spread: 60, origin: { x: 0 } });
            confetti({ particleCount: 5, angle: 120, spread: 60, origin: { x: 1 } });
            if (Date.now() < end) {
                requestAnimationFrame(frame);
            }
        }());
    </script>

<% } else { %>
    <!-- Login Form View -->
    <div class="card <%= isError ? "shake" : "" %>">
        <h1>CyberVault</h1>
        <p class="sub">Welcome to CyberVault!</p>

        <form method="POST" action="index.jsp">
            <input type="text" name="username" placeholder="Username" required autofocus />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Login</button>
        </form>

        <div class="links-container">
            <a href="https://apod.nasa.gov/apod/astropix.html" target="_blank" class="btn-link">✨ Explore NASA Astronomy Picture of the Day</a>
        </div>
    </div>

    <% if (isError) { %>
    <script>
        alert("The username or password you entered is incorrect!");
    </script>
    <% } %>

<% } %>

</body>
</html>
