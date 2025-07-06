FROM nginx:alpine

RUN rm /usr/share/nginx/html/index.html

RUN echo '<!DOCTYPE html>\
<html lang="en">\
<head>\
    <meta charset="UTF-8">\
    <meta name="viewport" content="width=device-width, initial-scale=1.0">\
    <title>Hello World</title>\
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">\
    <style>\
        * {\
            margin: 0;\
            padding: 0;\
            box-sizing: border-box;\
        }\
        \
        body {\
            font-family: "Inter", -apple-system, BlinkMacSystemFont, sans-serif;\
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #6b73ff 100%);\
            min-height: 100vh;\
            display: flex;\
            align-items: center;\
            justify-content: center;\
            overflow: hidden;\
            position: relative;\
        }\
        \
        .background-pattern {\
            position: absolute;\
            top: 0;\
            left: 0;\
            width: 100%;\
            height: 100%;\
            opacity: 0.1;\
            background-image: radial-gradient(circle at 1px 1px, rgba(255,255,255,0.3) 1px, transparent 0);\
            background-size: 50px 50px;\
            animation: drift 20s linear infinite;\
        }\
        \
        @keyframes drift {\
            0% { transform: translateX(0) translateY(0); }\
            100% { transform: translateX(50px) translateY(50px); }\
        }\
        \
        .container {\
            position: relative;\
            z-index: 2;\
            text-align: center;\
            background: rgba(255, 255, 255, 0.05);\
            backdrop-filter: blur(20px);\
            border-radius: 32px;\
            padding: 4rem 3rem;\
            border: 1px solid rgba(255, 255, 255, 0.1);\
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1), 0 15px 25px rgba(0, 0, 0, 0.15);\
            max-width: 600px;\
            width: 90%;\
            animation: fadeInUp 0.8s ease-out;\
        }\
        \
        @keyframes fadeInUp {\
            from {\
                opacity: 0;\
                transform: translateY(30px);\
            }\
            to {\
                opacity: 1;\
                transform: translateY(0);\
            }\
        }\
        \
        .logo {\
            font-size: 4rem;\
            margin-bottom: 1.5rem;\
            animation: pulse 3s ease-in-out infinite;\
        }\
        \
        @keyframes pulse {\
            0%, 100% { transform: scale(1); }\
            50% { transform: scale(1.05); }\
        }\
        \
        h1 {\
            font-size: 3.5rem;\
            font-weight: 700;\
            color: #ffffff;\
            margin-bottom: 1rem;\
            letter-spacing: -0.02em;\
            line-height: 1.1;\
        }\
        \
        .subtitle {\
            font-size: 1.25rem;\
            font-weight: 300;\
            color: rgba(255, 255, 255, 0.8);\
            margin-bottom: 2rem;\
            line-height: 1.6;\
        }\
        \
        .tech-stack {\
            display: flex;\
            justify-content: center;\
            gap: 1rem;\
            flex-wrap: wrap;\
            margin-top: 2rem;\
        }\
        \
                 .tech-badge {\
             display: inline-block;\
             padding: 0.5rem 1rem;\
             background: rgba(255, 255, 255, 0.1);\
             border: 1px solid rgba(255, 255, 255, 0.2);\
             border-radius: 20px;\
             color: rgba(255, 255, 255, 0.9);\
             font-size: 0.9rem;\
             font-weight: 500;\
             text-decoration: none;\
             transition: all 0.3s ease;\
         }\
         \
         .tech-badge:hover {\
             background: rgba(255, 255, 255, 0.2);\
             color: #ffffff;\
             transform: translateY(-2px);\
             box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);\
         }\
        \
                 .decorative-line {\
             width: 100px;\
             height: 2px;\
             background: linear-gradient(90deg, transparent, rgba(255,255,255,0.5), transparent);\
             margin: 2rem auto;\
             border-radius: 1px;\
         }\
         \
         .github-link {\
             margin-top: 2.5rem;\
             padding-top: 1.5rem;\
             border-top: 1px solid rgba(255, 255, 255, 0.1);\
         }\
         \
         .github-link a {\
             color: rgba(255, 255, 255, 0.7);\
             font-size: 0.9rem;\
             font-weight: 400;\
             text-decoration: none;\
             transition: all 0.3s ease;\
             position: relative;\
         }\
         \
         .github-link a:hover {\
             color: rgba(255, 255, 255, 0.95);\
             transform: translateX(3px);\
         }\
         \
         .github-link a::before {\
             content: "";\
             position: absolute;\
             bottom: -2px;\
             left: 0;\
             width: 0;\
             height: 1px;\
             background: rgba(255, 255, 255, 0.5);\
             transition: width 0.3s ease;\
         }\
         \
         .github-link a:hover::before {\
             width: 100%;\
         }\
        \
        .floating-elements {\
            position: absolute;\
            top: 0;\
            left: 0;\
            width: 100%;\
            height: 100%;\
            pointer-events: none;\
            z-index: 1;\
        }\
        \
        .floating-circle {\
            position: absolute;\
            border-radius: 50%;\
            background: rgba(255, 255, 255, 0.05);\
            animation: float 6s ease-in-out infinite;\
        }\
        \
        .floating-circle:nth-child(1) {\
            width: 80px;\
            height: 80px;\
            top: 20%;\
            left: 10%;\
            animation-delay: 0s;\
        }\
        \
        .floating-circle:nth-child(2) {\
            width: 120px;\
            height: 120px;\
            top: 60%;\
            right: 15%;\
            animation-delay: 2s;\
        }\
        \
        .floating-circle:nth-child(3) {\
            width: 60px;\
            height: 60px;\
            bottom: 20%;\
            left: 20%;\
            animation-delay: 4s;\
        }\
        \
        @keyframes float {\
            0%, 100% { transform: translateY(0px) rotate(0deg); }\
            50% { transform: translateY(-20px) rotate(180deg); }\
        }\
        \
        @media (max-width: 768px) {\
            .container {\
                padding: 3rem 2rem;\
                margin: 1rem;\
            }\
            \
            h1 {\
                font-size: 2.5rem;\
            }\
            \
            .logo {\
                font-size: 3rem;\
            }\
            \
            .subtitle {\
                font-size: 1.1rem;\
            }\
        }\
    </style>\
</head>\
<body>\
    <div class="background-pattern"></div>\
    \
    <div class="floating-elements">\
        <div class="floating-circle"></div>\
        <div class="floating-circle"></div>\
        <div class="floating-circle"></div>\
    </div>\
    \
    <div class="container">\
        <div class="logo">🚀</div>\
        <h1>Hello from Nginx on Docker!</h1>\
        <div class="decorative-line"></div>\
        <p class="subtitle">A single-page website crafted entirely in a Dockerfile<br>showcasing elegant containerised web development</p>\
        \
        <div class="tech-stack">\
            <a href="https://www.docker.com/" target="_blank" class="tech-badge">Docker</a>\
            <a href="https://nginx.org/" target="_blank" class="tech-badge">Nginx</a>\
            <a href="https://developer.mozilla.org/en-US/docs/Web/HTML" target="_blank" class="tech-badge">HTML5</a>\
            <a href="https://developer.mozilla.org/en-US/docs/Web/CSS" target="_blank" class="tech-badge">CSS3</a>\
        </div>\
        \
        <div class="github-link">\
            <a href="https://github.com/mavi0/hello-world-nginx" target="_blank">View source on GitHub →</a>\
        </div>\
    </div>\
</body>\
</html>' > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 