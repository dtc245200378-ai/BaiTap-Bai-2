<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Simple Calculator</title>
    <style>
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; margin-top: 80px; background-color: #f8fafc; }
        .calculator-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 350px; }
        fieldset { border: 1px solid #1b2a7a; border-radius: 6px; padding: 20px; }
        legend { color: #1b2a7a; font-weight: bold; font-size: 18px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #333; }
        input[type="number"], select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { background-color: #1b2a7a; color: white; padding: 12px; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-weight: bold; font-size: 16px; margin-top: 10px; }
        button:hover { background-color: #121c54; }
    </style>
</head>
<body>
    <div class="calculator-container">
        <form action="calculate" method="post">
            <fieldset>
                <legend>Simple Calculator</legend>
                <div class="form-group">
                    <label>First operand:</label>
                    <input type="number" step="any" name="first-operand" placeholder="0" required />
                </div>
                <div class="form-group">
                    <label>Operator:</label>
                    <select name="operator">
                        <option value="+">Addition (+)</option>
                        <option value="-">Subtraction (-)</option>
                        <option value="*">Multiplication (*)</option>
                        <option value="/">Division (/)</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Second operand:</label>
                    <input type="number" step="any" name="second-operand" placeholder="0" required />
                </div>
                <button type="submit">Calculate</button>
            </fieldset>
        </form>
    </div>
</body>
</html>
