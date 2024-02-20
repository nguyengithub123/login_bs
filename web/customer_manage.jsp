<%-- 
    Document   : customer_manage
    Author     : Thinh Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Management</title>
        <link rel="stylesheet" href="admin/css/customer_m.css">
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="admin/font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="admin/css/review_m.css"/>

        <script type="text/javascript">
            // Hàm hiển thị cửa sổ thông báo
            function showAlert(message) {
                alert(message);
            }
            // Gọi hàm hiển thị cửa sổ thông báo nếu có lỗi
            <% String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) { %>
            showAlert('<%= error %>');
            <% } %>
        </script>
    </head>

    <body>
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar"
                                                src="https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg" width="50px"
                                                alt="User Image">
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Dashboard</span></a></li>
                <li><a class="app-menu__item" href="customer_manage"><i
                            class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Customers</span></a>
                </li>
                <li><a class="app-menu__item" href="productmanager"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span
                            class="app-menu__label">Products</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Orders</span></a></li>
                <li><a class="app-menu__item" href="review_manage"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Reviews</span></a></li>
                <button class="admin_logout" onclick="showLogoutBox()">Logout</button>

                <div class="logout-box" id="logoutBox" style="display: none">
                    <h2>Log out</h2>
                    <p>Are you sure you want to log out?</p>
                    <button onclick="logout()">Log out</button>
                    <button onclick="cancelLogout()">Cancel</button>
                </div>
            </ul>
        </aside>

        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search customers ...">
            <button onclick="searchCustomers()"><i class="ti-search"></i></button>
        </div>

        <button class="add-customer-btn" onclick="openPopup()">Add a Customer</button>
        <div id="popup" class="popup">
            <div class="popup-content">

                <!-- Add your form fields for adding a customer here -->
                <form action="customer_manage" method="post">
                    <!-- Your form fields here -->
                    <input type="text" id="fullname" placeholder="Full Name" name="fullname" required><br>
                    <input type="text" id="username" placeholder="Username" name="username" required><br>
                    <input type="password" id="password" placeholder="Password" name="password" required><br>
                    <input type="email" id="email" name="email" placeholder="Email" required><br>
                    <div id="submit-type">
                        <button type="submit">Add</button>
                        <button type="button" onclick="closePopup()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${customersList}" var="customer" >
                        <tr>
                            <td>${customer.userID}</td>
                            <td>${customer.fullName}</td>
                            <td>${customer.username}</td>
                            <td>
                                <div class="password-toggle">
                                    <input type="password" value="${customer.userpassword}" disabled>
                                </div>
                            </td>
                            <td>${customer.userEmail}</td>
                            <td class="actions">
                                <a href="#" onclick="confirmDelete('${customer.userID}')"><i class="ti-trash"></i></a>
                            </td>

                    <div id="deleteConfirmationModal" class="modal">
                        <div class="modal-content">
                            <p>Do you want to delete ?</p>
                            <button onclick="deleteCustomer()">Confirm</button>
                            <button onclick="closeDeleteConfirmationModal()">Cancel</button>
                        </div>
                    </div>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
            function showLogoutBox() {
                document.getElementById('logoutBox').style.display = 'block';
            }
            function logout() {
                window.location.href = 'login.jsp';
            }
            function cancelLogout() {
                window.location.href = 'customer_manage.jsp';
            }
            // Function to open the popup
            function openPopup() {
                document.getElementById("popup").style.display = "block";
            }
            // Function to close the popup
            function closePopup() {
                document.getElementById("popup").style.display = "none";
            }

            function confirmDelete(userID) {
                var modal = document.getElementById("deleteConfirmationModal");
                modal.style.display = "block";
                // Lưu ID của khách hàng cần xóa vào một hidden input để sử dụng sau này
                document.getElementById("userIDToDelete").value = userID;
            }

            function closeDeleteConfirmationModal() {
                var modal = document.getElementById("deleteConfirmationModal");
                modal.style.display = "none";
            }

            function deleteCustomer() {
                var userID = document.getElementById("userIDToDelete").value;
                // Gửi yêu cầu xóa khách hàng với ID tương ứng
                window.location.href = "deleteCustomer?userID=" + userID;
            }

            function searchCustomers() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase();
                table = document.querySelector(".table-container table");
                tr = table.getElementsByTagName("tr");

                // Duyệt qua tất cả các hàng trong bảng và ẩn hoặc hiển thị các hàng tương ứng
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1]; // Cột thứ hai chứa tên đầy đủ

                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

        </script>
    </body>

</html>