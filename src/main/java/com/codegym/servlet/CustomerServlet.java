package com.codegym.servlet;

import com.codegym.model.Customer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customers", ""})
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://picsum.photos/id/1005/80/80"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://picsum.photos/id/1011/80/80"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://picsum.photos/id/1025/80/80"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://picsum.photos/id/1062/80/80"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://picsum.photos/id/1027/80/80"));

        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
