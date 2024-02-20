<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="register-form/register.css"/>
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
    <body class="img" style="background-image: url('register-form/img/book_register_2.png');">

        <form action="register" method="post">
            <label for="fullname">Full Name:</label><br>
            <input type="text" id="fullname" name="fullname" required><br>

            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username" required><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br>

            <label for="confirm_password">Confirm Password:</label><br>
            <input type="password" id="confirm_password" name="confirm_password" required><br>
            <span id="password_error" style="color: red;"></span><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br>

            <input type="submit" value="Sign up">
        </form>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirm_password = document.getElementById("confirm_password").value;

                if (password != confirm_password) {
                    document.getElementById("password_error").innerHTML = "Passwords do not match";
                    return false;
                }
                return true;
            }
        </script>
    </body>

</html>
