# Nhật Ký Tương Tác AI (AI Prompt Log)

## Prompt 1: Phân tích nguyên nhân lỗi Layout Legacy
- **Nội dung:** "Tại sao việc thiết lập Navbar bằng `grid-template-columns: 200px 600px 200px` lại làm giao diện bị vỡ khi đổi sang từ tiếng Đức dài hơn? Phương án thay thế bằng Flexbox là gì?"
- **Kết quả thu được:** AI giải thích nguyên nhân cột cố định `600px` gây tràn viền và hướng dẫn chuyển sang Flexbox với `justify-content: space-between; gap: 20px; flex-wrap: wrap`.

## Prompt 2: Tối ưu Bento Box với CSS Grid
- **Nội dung:** "Hãy cung cấp mã CSS Grid tạo layout Bento Box phẳng (không có thẻ .column lồng nhau) cho 5 widget, trong đó Widget A chiếm 2 hàng và 2 cột."
- **Kết quả thu được:** Sử dụng `grid-template-columns: repeat(3, 1fr)` kết hợp `grid-column: span 2` và `grid-row: span 2`.

## Prompt 3: Tìm hiểu thuộc tính `gap` và Bootstrap Grid
- **Nội dung:** "Thuộc tính `gap` có điểm gì vượt trội so với việc dùng `margin` thủ công trong Flexbox/Grid? Khi nào nên chọn Bootstrap Grid 12 cột cho Pricing Card?"
- **Kết quả thu được:** Giúp loại bỏ khoảng cách thừa ở phần tử đầu/cuối và tận dụng lớp `row g-4 col-12 col-md-4` để triển khai nhanh khu vực Bảng giá mà không cần viết media query thủ công.
