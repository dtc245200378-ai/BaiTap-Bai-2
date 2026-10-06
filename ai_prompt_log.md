# Nhật Ký Tương Tác AI (AI Prompt Log)

## Prompt 1: Tìm hiểu CSS Grid cho Mosaic Gallery
- **Câu hỏi:** "Làm thế nào để sử dụng thuộc tính grid-template-areas trong CSS Grid để tạo thư viện ảnh gồm 1 ảnh lớn bên trái chiếm 2 hàng và 2 ảnh nhỏ xếp chồng bên phải?"
- **Kết quả:** AI gợi ý cách chia `grid-template-columns: 2fr 1fr` và định nghĩa `grid-template-areas` cho desktop, đồng thời hạ về `grid-template-columns: 1fr` trên mobile.

## Prompt 2: Tối ưu Flexbox bằng Utility Classes của Bootstrap 5
- **Câu hỏi:** "Trong Bootstrap 5, có những Utility Class nào giúp thay thế float để căn giữa dọc avatar, tên tác giả và nút share trên cùng một hàng ngang mà không cần viết CSS tùy chỉnh?"
- **Kết quả:** AI hướng dẫn dùng `d-flex`, `align-items-center`, `justify-content-between`, và `gap-3` để tạo giao diện linh hoạt, tự động co giãn.

## Prompt 3: Cấu trúc Grid Responsive cho Bài viết đề xuất
- **Câu hỏi:** "Làm sao để cấu trúc 4 thẻ bài viết tự động hiển thị 4 cột trên Desktop, 2 cột trên Tablet và 1 cột trên Mobile bằng Bootstrap Grid System?"
- **Kết quả:** AI cung cấp cú pháp thẻ `<div class="row">` chứa các thẻ con `<div class="col-12 col-md-6 col-lg-3">` kết hợp với Bootstrap Card component.
