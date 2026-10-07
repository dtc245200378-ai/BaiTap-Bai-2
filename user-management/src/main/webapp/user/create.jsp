<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm mới User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        .form-card { width: 450px; margin: 0 auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #1b2a7a; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input[type="text"], input[type="email"] { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .checkbox-group { display: flex; gap: 15px; margin-top: 8px; flex-wrap: wrap; }
        .btn-submit { width: 100%; padding: 10px; background-color: #27ae60; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; margin-top: 10px; }
        .btn-back { display: block; text-align: center; margin-top: 15px; color: #7f8c8d; text-decoration: none; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2>Thêm Mới Người Dùng</h2>
        <form action="${pageContext.request.contextPath}/users?action=create" method="post">
            <div class="form-group">
                <label>Tên người dùng:</label>
                <input type="text" name="name" required />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>
            <div class="form-group">
                <label>Quốc gia:</label>
                <input type="text" name="country" required />
            </div>
            <div class="form-group">
                <label>Quyền hạn (Permissions):</label>
                <div class="checkbox-group">
                    <label><input type="checkbox" name="permissions" value="1"> Thêm (Add)</label>
                    <label><input type="checkbox" name="permissions" value="2"> Sửa (Edit)</label>
                    <label><input type="checkbox" name="permissions" value="3"> Xoá (Delete)</label>
                    <label><input type="checkbox" name="permissions" value="4"> Xem (View)</label>
                </div>
            </div>
            <button type="submit" class="btn-submit">Lưu thông tin</button>
            <a href="${pageContext.request.contextPath}/users" class="btn-back">Quay lại danh sách</a>
        </form>
    </div>
</body>
</html>
