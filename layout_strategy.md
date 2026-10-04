# Chiến Lược Dàn Trang: CSS Grid vs Flexbox

**CSS Grid** được thiết kế để quản lý **Layout tổng thể 2 chiều (2D)**. Nó điều khiển đồng thời cả hàng (Rows) và cột (Columns), cho phép đặt phần tử chính xác vào các ô trên lưới (ví dụ: `span 2 rows, 2 columns` trong Bento Dashboard) mà không cần tạo các thẻ bao bọc lồng nhau (`Div Soup`).

**Flexbox** sinh ra để quản lý **Component chi tiết 1 chiều (1D)**. Nó hoạt động theo cơ chế linh hoạt dựa trên nội dung (Content-first), lý tưởng cho Navbar hoặc sắp xếp các thẻ con nằm ngang/dọc trong cùng một khối.

**Kết luận:** Dùng CSS Grid xây dựng khung sườn tổng thể của trang web (Macro-layout) và dùng Flexbox cho việc căn chỉnh các chi tiết bên trong từng thành phần (Micro-layout).
