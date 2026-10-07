<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .container { background-color: #ffffff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); width: 80%; max-width: 850px; }
        h2 { text-align: center; margin-bottom: 25px; color: #111; font-size: 24px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 14px 16px; text-align: left; border-bottom: 1px solid #e0e0e0; }
        th { font-weight: bold; color: #000; font-size: 16px; }
        td { font-size: 15px; color: #333; }
        .customer-img { width: 60px; height: 60px; object-fit: cover; border-radius: 4px; border: 1px solid #ccc; }
    </style>
</head>
<body>

<div class="container">
    <h2>Danh sách khách hàng</h2>

    <%
        List<Map<String, String>> customerList = new ArrayList<>();

        Map<String, String> c1 = new HashMap<>();
        c1.put("name", "Mai Văn Hoàn"); c1.put("dob", "1983-08-20"); c1.put("address", "Hà Nội"); c1.put("image", "https://picsum.photos/id/1005/80/80");
        customerList.add(c1);

        Map<String, String> c2 = new HashMap<>();
        c2.put("name", "Nguyễn Văn Nam"); c2.put("dob", "1983-08-21"); c2.put("address", "Bắc Giang"); c2.put("image", "https://picsum.photos/id/1011/80/80");
        customerList.add(c2);

        Map<String, String> c3 = new HashMap<>();
        c3.put("name", "Nguyễn Thái Hòa"); c3.put("dob", "1983-08-22"); c3.put("address", "Nam Định"); c3.put("image", "https://picsum.photos/id/1025/80/80");
        customerList.add(c3);

        Map<String, String> c4 = new HashMap<>();
        c4.put("name", "Trần Đăng Khoa"); c4.put("dob", "1983-08-17"); c4.put("address", "Hà Tây"); c4.put("image", "https://picsum.photos/id/1062/80/80");
        customerList.add(c4);

        Map<String, String> c5 = new HashMap<>();
        c5.put("name", "Nguyễn Đình Thi"); c5.put("dob", "1983-08-19"); c5.put("address", "Hà Nội"); c5.put("image", "https://picsum.photos/id/1027/80/80");
        customerList.add(c5);

        request.setAttribute("customerList", customerList);
    %>

    <table>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td><c:out value="${customer.name}"/></td>
                    <td><c:out value="${customer.dob}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td>
                        <img src="${customer.image}" alt="${customer.name}" class="customer-img" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
