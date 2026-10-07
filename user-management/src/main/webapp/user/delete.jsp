<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận Xóa User</title>
</head>
<body>
    <h2>Xác Nhận Xóa User!</h2>
    <p>Bạn có chắc chắn muốn xóa User này khỏi hệ thống cơ sở dữ liệu vĩnh viễn không?</p>
    <p><strong>Tên:</strong> ${requestScope.user.name}</p>
    <p><strong>Email:</strong> ${requestScope.user.email}</p>
    <p><strong>Quốc gia:</strong> ${requestScope.user.country}</p>
    <form action="${pageContext.request.contextPath}/users?action=delete" method="post">
        <input type="hidden" name="id" value="${requestScope.user.id}" />
        <button type="submit">Đồng ý Xóa</button>
        <a href="${pageContext.request.contextPath}/users">Hủy bỏ</a>
    </form>
</body>
</html>
