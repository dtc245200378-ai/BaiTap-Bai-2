package com.codegym.calculator.servlet;

import com.codegym.calculator.model.Calculator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);

        try {
            float result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("result", result);
        } catch (Exception ex) {
            request.setAttribute("error", ex.getMessage());
        }

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
