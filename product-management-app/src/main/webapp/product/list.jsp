<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Sản Phẩm - Final Exam</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>📦 Hệ Thống Quản Lý Sản Phẩm</h2>
        <a href="products?action=create" class="btn btn-success">+ Thêm Sản Phẩm Mới</a>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                <tr>
                    <th style="width: 10%">ID</th>
                    <th style="width: 40%">Tên sản phẩm</th>
                    <th style="width: 20%">Giá (VNĐ)</th>
                    <th style="width: 15%">Số lượng</th>
                    <th style="width: 15%">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${listProducts}">
                    <tr>
                        <td>${product.id}</td>
                        <td class="fw-bold">${product.name}</td>
                        <td class="text-danger fw-bold">
                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                        </td>
                        <td><span class="badge bg-secondary">${product.quantity}</span></td>
                        <td>
                            <a href="products?action=edit&id=${product.id}" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="products?action=delete&id=${product.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listProducts}">
                    <tr>
                        <td colspan="5" class="text-center text-muted py-4">Chưa có sản phẩm nào trong hệ thống!</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
