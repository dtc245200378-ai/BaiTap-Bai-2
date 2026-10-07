<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${note == null ? 'Thêm Mới Ghi Chú' : 'Chỉnh Sửa Ghi Chú'}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container my-5" style="max-width: 650px;">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">${note == null ? 'Thêm Mới Ghi Chú' : 'Chỉnh Sửa Ghi Chú'}</h4>
        </div>
        <div class="card-body">
            <form action="notes" method="post">
                <input type="hidden" name="action" value="${note == null ? 'create' : 'edit'}">
                <c:if test="${note != null}">
                    <input type="hidden" name="id" value="${note.id}">
                </c:if>

                <div class="mb-3">
                    <label class="form-label fw-bold">Tiêu đề:</label>
                    <input type="text" name="title" class="form-control" required value="${note.title}" placeholder="Nhập tiêu đề ghi chú">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Phân loại:</label>
                    <select name="typeId" class="form-select" required>
                        <c:forEach var="type" items="${listTypes}">
                            <option value="${type.id}" ${note != null && note.typeId == type.id ? 'selected' : ''}>${type.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Nội dung:</label>
                    <textarea name="content" class="form-control" rows="6" placeholder="Nhập nội dung chi tiết...">${note.content}</textarea>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">Lưu Ghi Chú</button>
                    <a href="notes" class="btn btn-secondary">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
