# Báo Cáo Phân Tích Layout Refactoring

**Tác hại của position: absolute đối với Responsive Design:**
Kỹ thuật `position: absolute` đưa phần tử thoát hoàn toàn khỏi luồng tài liệu thông thường. Khi áp dụng cho thư viện ảnh khảm (Mosaic Gallery) trên thiết bị di động, phần tử cha không thể tự động thay đổi chiều cao để bao bọc các ảnh bên trong. Kết quả là bố cục bị phá vỡ, các ảnh đè lấn lên phần văn bản bài viết bên dưới.

**Lý do CSS Grid là giải pháp cứu cánh:**
1. **Quản lý không gian tự động:** Grid tự động đẩy nội dung phía dưới xuống, không gây đè lấn.
2. **Dễ dàng vẽ bố cục:** Thuộc tính `grid-template-areas` giúp vẽ trực quan ảnh chính và ảnh phụ.
3. **Responsive linh hoạt:** Dễ dàng điều chỉnh số cột để gập từ nhiều cột về 1 cột trên Mobile.
