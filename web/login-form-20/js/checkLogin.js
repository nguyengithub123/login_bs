$(document).ready(function () {
    $('.signin-form').on('submit', function (e) {
        e.preventDefault(); // Ngăn chặn việc gửi form mặc định

        // Lấy giá trị của trường username và password
        var username = $(this).find('input[type="text"]').val();
        var password = $(this).find('input[type="password"]').val();

        // Kiểm tra xem username và password có phải là admin hay không (Đây là một ví dụ đơn giản)
        var isAdmin = (username === "admin" && password === "admin");

        // Nếu là admin, chuyển hướng tới trang admin.jsp, ngược lại chuyển hướng tới user.jsp
        if (isAdmin) {
            window.location.href = "admin.jsp";
        } else {
            window.location.href = "user.jsp";
        }
    });
});