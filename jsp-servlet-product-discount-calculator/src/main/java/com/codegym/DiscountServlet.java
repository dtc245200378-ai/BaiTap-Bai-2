package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DiscountServlet", urlPatterns = {"/display-discount"})
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String discountStr = request.getParameter("discount");
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Discount Calculation Result</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 80px; background-color: #f8fafc; }");
            out.println(".result-container { background: white; padding: 35px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 400px; text-align: left; }");
            out.println("h2 { color: #1b2a7a; text-align: center; margin-bottom: 20px; }");
            out.println(".item { font-size: 16px; margin-bottom: 12px; color: #333; }");
            out.println(".highlight { color: #27ae60; font-weight: bold; }");
            out.println(".btn-back { display: block; text-align: center; margin-top: 25px; padding: 10px; background-color: #1b2a7a; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; }");
            out.println(".btn-back:hover { background-color: #121c54; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='result-container'>");
            out.println("<h2>Kết Quả Tính Chiết Khấu</h2>");
            
            if (description != null && priceStr != null && discountStr != null) {
                try {
                    double price = Double.parseDouble(priceStr);
                    double discountPercent = Double.parseDouble(discountStr);
                    
                    double discountAmount = price * discountPercent * 0.01;
                    double discountPrice = price - discountAmount;
                    
                    out.println("<div class='item'><strong>Product Description:</strong> " + description + "</div>");
                    out.println("<div class='item'><strong>List Price:</strong> $" + String.format("%.2f", price) + "</div>");
                    out.println("<div class='item'><strong>Discount Percent:</strong> " + discountPercent + "%</div>");
                    out.println("<hr style='border: 0.5px solid #eee; margin: 15px 0;'>");
                    out.println("<div class='item'><strong>Discount Amount:</strong> $" + String.format("%.2f", discountAmount) + "</div>");
                    out.println("<div class='item'><strong>Discount Price:</strong> <span class='highlight'>$" + String.format("%.2f", discountPrice) + "</span></div>");
                } catch (NumberFormatException e) {
                    out.println("<p style='color: red; text-align: center;'>Lỗi: Vui lòng nhập số hợp lệ!</p>");
                }
            } else {
                out.println("<p style='color: red; text-align: center;'>Thiếu dữ liệu gửi lên!</p>");
            }
            
            out.println("<a href='index.jsp' class='btn-back'>Tính Sản Phẩm Khác</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
