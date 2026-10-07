<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Ghi Chú</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container my-5" style="max-width: 650px;">
    <div class="card shadow">
        <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Chi Tiết Ghi Chú</h4>
            <span class="badge bg-light text-dark">${note.typeName}</span>
        </div>
        <div class="card-body">
            <h5 class="card-title text-primary">${note.title}</h5>
            <hr>
            <p class="card-text style-content" style="white-space: pre-wrap;">${note.content}</p>
        </div>
        <div class="card-footer text-end">
            <a href="notes?action=edit&id=${note.id}" class="btn btn-warning">Chỉnh Sửa</a>
            <a href="notes" class="btn btn-secondary">Quay lại</a>
        </div>
    </div>
</div>
</body>
</html>
