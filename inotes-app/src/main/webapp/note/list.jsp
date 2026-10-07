<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>iNotes Dashboard - Quản lý ghi chú</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>📌 iNotes Dashboard</h2>
        <div>
            <span class="me-2 fw-bold">Tầng lưu trữ hiện tại:</span>
            <c:choose>
                <c:when test="${sessionScope.storageType == 'file'}">
                    <span class="badge bg-warning text-dark me-2">FILE TEXT (notes_storage.txt)</span>
                    <a href="notes?action=switchStorage&type=db" class="btn btn-outline-primary btn-sm">Chuyển sang CSDL MySQL</a>
                </c:when>
                <c:otherwise>
                    <span class="badge bg-success me-2">CƠ SỞ DỮ LIỆU (MySQL)</span>
                    <a href="notes?action=switchStorage&type=file" class="btn btn-outline-warning btn-sm">Chuyển sang File Text</a>
                </c:otherwise>
            </choose>
        </div>
    </div>

    <!-- Thanh tìm kiếm & Thêm mới -->
    <div class="row mb-3">
        <div class="col-md-8">
            <form action="notes" method="get" class="d-flex gap-2">
                <input type="text" name="search" class="form-control" placeholder="Tìm kiếm ghi chú theo tiêu đề hoặc nội dung..." value="${searchKeyword}">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                <c:if test="${not empty searchKeyword}">
                    <a href="notes" class="btn btn-secondary">Đặt lại</a>
                </c:if>
            </form>
        </div>
        <div class="col-md-4 text-end">
            <a href="notes?action=create" class="btn btn-success">+ Thêm Mới Ghi Chú</a>
        </div>
    </div>

    <!-- Bảng danh sách ghi chú -->
    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                <tr>
                    <th style="width: 5%">#</th>
                    <th style="width: 35%">Tiêu đề</th>
                    <th style="width: 20%">Phân loại</th>
                    <th style="width: 40%">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="note" items="${listNotes}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td class="fw-bold">${note.title}</td>
                        <td>
                            <span class="badge bg-info text-dark">${note.typeName}</span>
                        </td>
                        <td>
                            <a href="notes?action=view&id=${note.id}" class="btn btn-info btn-sm">Xem</a>
                            <a href="notes?action=edit&id=${note.id}" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="notes?action=delete&id=${note.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa ghi chú này?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listNotes}">
                    <tr>
                        <td colspan="4" class="text-center text-muted py-4">Chưa có ghi chú nào trong hệ thống!</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
