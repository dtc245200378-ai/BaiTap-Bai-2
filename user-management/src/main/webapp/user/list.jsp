<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
</head>
<body>
    <h2>Danh Sách Người Dùng (Users)</h2>
    <a href="${pageContext.request.contextPath}/users?action=create">Thêm mới User</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên User</th>
            <th>Email</th>
            <th>Quốc gia</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="user" items="${requestScope.listUser}">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.email}" /></td>
                <td><c:out value="${user.country}" /></td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Sửa</a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
