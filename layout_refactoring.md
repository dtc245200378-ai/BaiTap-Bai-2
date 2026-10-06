# Báo Cáo Phân Tích Layout Refactoring - Creative Chronicle

## 1. Tác hại của position: absolute đối với Responsive Design
Kỹ thuật `position: absolute` đưa phần tử hoàn toàn ra khỏi luồng tài liệu thông thường (normal document flow). Khi áp dụng cho thư viện ảnh khảm (Mosaic Gallery) trên thiết bị di động, phần tử cha không thể tự động tính toán hay co giãn chiều cao theo các phần tử con bên trong. Kết quả là khung chứa bị xẹp chiều cao (height collapse = 0), khiến các bức ảnh chồng chéo lên nhau và đè bẹp phần văn bản bài viết phía dưới, gây vỡ giao diện nghiêm trọng trên màn hình nhỏ.

## 2. CSS Grid - Giải pháp cứu cánh cho Bố cục 2D
CSS Grid giải quyết triệt để vấn đề này nhờ cơ chế quản lý không gian hai chiều tự động:
- **Bảo toàn luồng văn bản:** Grid tự động tính toán tổng chiều cao của gallery và đẩy nội dung phía dưới xuống mượt mà mà không cần gán chiều cao cứng (`height: 400px`).
- **Dàn trang linh hoạt:** Thuộc tính `grid-template-areas` cho phép định dạng ảnh chính chiếm 2 hàng và 2 ảnh phụ xếp chồng bên phải một cách trực quan.
- **Responsive mượt mà:** Chỉ cần thay đổi `grid-template-columns` qua Media Query, gallery chuyển đổi từ 2 cột trên Desktop về 1 cột trên Mobile gọn gàng mà không bị đè lấn text.
