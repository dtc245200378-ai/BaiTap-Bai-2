<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Result</title>
    <style>
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; margin-top: 80px; background-color: #f8fafc; }
        .result-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 380px; text-align: center; }
        fieldset { border: 1px solid #1b2a7a; border-radius: 6px; padding: 20px; }
        legend { color: #1b2a7a; font-weight: bold; font-size: 18px; }
        .back-btn { text-decoration: none; padding: 10px 20px; background-color: #1b2a7a; color: white; border-radius: 4px; display: inline-block; margin-top: 20px; font-weight: bold;}
        .error { color: #c0392b; background-color: #ffebee; padding: 15px; border-radius: 6px; font-weight: bold; }
        .success { color: #27ae60; background-color: #e8f5e9; padding: 15px; border-radius: 6px; font-weight: bold; font-size: 20px; }
    </style>
</head>
<body>
    <div class="result-container">
        <fieldset>
            <legend>Result</legend>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error">
                    At : <%= request.getAttribute("error") %>
                </div>
            <% } else { %>
                <p style="font-size: 16px; color: #555;">Result:</p>
                <div class="success">
                    <%= request.getAttribute("firstOperand") %> 
                    <%= request.getAttribute("operator") %> 
                    <%= request.getAttribute("secondOperand") %> 
                    = <%= request.getAttribute("result") %>
                </div>
            <% } %>
            <a href="index.jsp" class="back-btn">Go back</a>
        </fieldset>
    </div>
</body>
</html>
