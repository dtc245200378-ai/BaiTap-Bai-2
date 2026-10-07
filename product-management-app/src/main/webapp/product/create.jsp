<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Sản Phẩm Mới</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container my-5" style="max-width: 600px;">
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Thêm Sản Phẩm Mới</h4>
        </div>
        <div class="card-body">
            <form action="products" method="post">
                <input type="hidden" name="action" value="create">

                <div class="mb-3">
                    <label class="form-label fw-bold">Tên sản phẩm:</label>
                    <input type="text" name="name" class="form-control" required placeholder="Nhập tên sản phẩm">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Giá sản phẩm (VNĐ):</label>
                    <input type="number" step="1000" name="price" class="form-control" required placeholder="Nhập giá sản phẩm">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Số lượng:</label>
                    <input type="number" name="quantity" class="form-control" required min="0" placeholder="Nhập số lượng trong kho">
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success">Lưu Sản Phẩm</button>
                    <a href="products" class="btn btn-secondary">Hủy bỏ</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
