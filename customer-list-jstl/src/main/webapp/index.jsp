<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="c_legacy" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            width: 80%;
            max-width: 850px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #111;
            font-size: 24px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            font-weight: bold;
            color: #000;
            font-size: 16px;
        }
        td {
            font-size: 15px;
            color: #333;
        }
        .customer-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Danh sách khách hàng</h2>
    
    <c:if test="${empty customerList}">
        <%
            java.util.List<com.codegym.model.Customer> defaultList = new java.util.ArrayList<>();
            defaultList.add(new com.codegym.model.Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://picsum.photos/id/1005/80/80"));
            defaultList.add(new com.codegym.model.Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://picsum.photos/id/1011/80/80"));
            defaultList.add(new com.codegym.model.Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://picsum.photos/id/1025/80/80"));
            defaultList.add(new com.codegym.model.Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://picsum.photos/id/1062/80/80"));
            defaultList.add(new com.codegym.model.Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://picsum.photos/id/1027/80/80"));
            request.setAttribute("customerList", defaultList);
        %>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td><c:out value="${customer.name}"/></td>
                    <td><c:out value="${customer.dob}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td>
                        <img src="${customer.image}" alt="${customer.name}" class="customer-img" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
