<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cập nhật sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        .form-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width: 500px; margin: auto; }
        h2 { color: #1b2a7a; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #333; }
        input[type="text"], input[type="number"], textarea { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn-submit { background-color: #2980b9; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; width: 100%; margin-top: 10px; }
        .btn-submit:hover { background-color: #2471a3; }
        .link-back { display: block; text-align: center; margin-top: 15px; color: #1b2a7a; text-decoration: none; }
        .message { background-color: #e8f5e9; color: #27ae60; padding: 10px; border-radius: 4px; text-align: center; margin-bottom: 15px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Cập Nhật Sản Phẩm</h2>
        
        <c:if test="${not empty requestScope.message}">
            <div class="message">${requestScope.message}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/products?action=edit" method="POST">
            <input type="hidden" name="id" value="${requestScope.product.id}" />
            <div class="form-group">
                <label for="name">Tên sản phẩm:</label>
                <input type="text" id="name" name="name" value="${requestScope.product.name}" required />
            </div>
            <div class="form-group">
                <label for="price">Giá sản phẩm (VNĐ):</label>
                <input type="number" id="price" name="price" step="0.01" value="${requestScope.product.price}" required />
            </div>
            <div class="form-group">
                <label for="description">Mô tả sản phẩm:</label>
                <textarea id="description" name="description" rows="3" required>${requestScope.product.description}</textarea>
            </div>
            <div class="form-group">
                <label for="manufacturer">Nhà sản xuất:</label>
                <input type="text" id="manufacturer" name="manufacturer" value="${requestScope.product.manufacturer}" required />
            </div>
            <button type="submit" class="btn-submit">Cập Nhật</button>
        </form>
        <a href="${pageContext.request.contextPath}/products" class="link-back">Quay lại danh sách</a>
    </div>
</body>
</html>
