<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h1 { color: #1b2a7a; }
        .header-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .search-box { display: flex; gap: 10px; }
        .search-box input[type="text"] { padding: 8px 12px; border: 1px solid #ccc; border-radius: 4px; width: 250px; }
        .search-box button { padding: 8px 16px; background-color: #1b2a7a; color: white; border: none; border-radius: 4px; cursor: pointer; }
        table { border-collapse: collapse; width: 100%; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 14px; }
        .btn-create { background-color: #27ae60; color: white; }
        .btn-edit { color: #2980b9; text-decoration: none; margin-right: 10px; }
        .btn-delete { color: #c0392b; text-decoration: none; }
        .btn-view { color: #1b2a7a; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Quản Lý Sản Phẩm</h1>

    <div class="header-bar">
        <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-create">+ Thêm sản phẩm mới</a>
        <form action="${pageContext.request.contextPath}/products" method="GET" class="search-box">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="search" placeholder="Nhập tên sản phẩm..." value="${requestScope.searchQuery}" />
            <button type="submit">Tìm kiếm</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Giá (VNĐ)</th>
                <th>Mô Tả</th>
                <th>Nhà Sản Xuất</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.products}" var="product">
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/products?action=view&id=${product.id}" class="btn-view">${product.name}</a>
                    </td>
                    <td><fmt:formatNumber value="${product.price}" type="number"/></td>
                    <td>${product.description}</td>
                    <td>${product.manufacturer}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn-delete">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty requestScope.products}">
                <tr>
                    <td colspan="5" style="text-align:center; color:#888;">Không tìm thấy sản phẩm nào!</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>
