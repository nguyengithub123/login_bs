
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg" width="50px"
                                                alt="User Image">

            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Dashboard</span></a></li>
                <li><a class="app-menu__item" href="customer_manage"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Customers</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Products</span></a>
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

        <main class="app-content">
            <div class="row">
                <div class="col-md-12 col-lg-12">
                    <div class="row">

                        <div class="col-md-3">
                            <div class="widget-small primary coloured-icon"><i class='icon bx bx-user'></i>
                                <div class="info">
                                    <h4>Customers : ${requestScope.user} 1</h4>


                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="widget-small info coloured-icon"><i class='icon bx bx-book'></i>
                                <div class="info">
                                    <h4>Products : ${requestScope.product} 3</h4>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bx-shopping-bag'></i>
                                <div class="info">
                                    <h4>Bills : ${requestScope.bill} 2</h4>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bx-error-circle'></i>
                                <div class="info">
                                    <h4>Run Out Of Stock : ${requestScope.low}1</h4>

                                </div>
                            </div>
                        </div>
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">All Orders</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Customer</th>
                                                <th>Address</th>
                                                <th>Phone</th>
                                                <th>Date</th>
                                                <th>Total</th>
                                                <th>Activity</th>
                                                <th>Details</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${billbyday}" var="b">
                                            <tr>
                                                <td>${b.bill_id}</td>
                                                <td>${b.user.user_name}</td>
                                                <td>${b.address}</td>
                                                <td>${b.phone}</td>
                                                <td>${b.date}</td>
                                                <td>${b.total}</td>
                                                <td></td>
                                                <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="ordermanager?action=showdetail&bill_id=${b.bill_id}"><i class="fa"></i>More details...</a></td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- / div trống-->
                            </div>
                        </div>
                        <!-- / col-12 -->
                    </div>
                </div>
            </div>


            <div id="clock"></div>
        </main>

        <script type="text/javascript">
            var data = {
                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                datasets: [{
                        label: "Dữ liệu đầu tiên",
                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                        strokeColor: "rgb(255, 212, 59)",
                        pointColor: "rgb(255, 212, 59)",
                        pointStrokeColor: "rgb(255, 212, 59)",
                        pointHighlightFill: "rgb(255, 212, 59)",
                        pointHighlightStroke: "rgb(255, 212, 59)",
                        data: [20, 59, 90, 51, 56, 100]
                    },
                    {
                        label: "Dữ liệu kế tiếp",
                        fillColor: "rgba(9, 109, 239, 0.651)",
                        pointColor: "rgb(9, 109, 239)",
                        strokeColor: "rgb(9, 109, 239)",
                        pointStrokeColor: "rgb(9, 109, 239)",
                        pointHighlightFill: "rgb(9, 109, 239)",
                        pointHighlightStroke: "rgb(9, 109, 239)",
                        data: [48, 48, 49, 39, 86, 10]
                    }
                ]
            };
            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
            var lineChart = new Chart(ctxl).Line(data);

            var ctxb = $("#barChartDemo").get(0).getContext("2d");
            var barChart = new Chart(ctxb).Bar(data);
        </script>
        <script type="text/javascript">
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Sunday";
                weekday[1] = "Monday";
                weekday[2] = "Tuesday";
                weekday[3] = "Wednesday";
                weekday[4] = "Thursday";
                weekday[5] = "Friday";
                weekday[6] = "Saturday";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                m = checkTime(m);
                nowTime = h + ":" + m + "";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' , ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
        </script>
        <script>
            function showLogoutBox() {
                document.getElementById('logoutBox').style.display = 'block';
            }
            function logout() {
                window.location.href = 'login.jsp';
            }
            function cancelLogout() {
                window.location.href = 'admin.jsp';
            }
            
        </script>
    </body>

</html>