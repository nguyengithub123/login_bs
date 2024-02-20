
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách sản phẩm</title>
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
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg" width="50px"
                                                alt="User Image">

            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="index.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Dashboard</span></a></li>
                <li><a class="app-menu__item" href="customermanager"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Customers</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Products</span></a>
                </li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Orders</span></a></li>
                <li><a class="app-menu__item" href="https://docs.google.com/spreadsheets/d/1elWy0LYj9ngbmywMGwy8Noe_K7WmyisQ6aHOK6RnXZI" target="_blank"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Reviews</span></a></li>
                <button class="admin_logout" onclick="showLogoutBox()">Logout</button>
                <div class="logout-box" id="logoutBox" style="display: none">
                    <h2>Logout</h2>
                    <p>Are you sure you want to logout?</p>
                    <button onclick="logout()">Logout</button>
                    <button onclick="cancelLogout()">Cancel</button>
                </div>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>All Products</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="productinsert.jsp" title="Thêm"><i class="fas fa-plus"></i>
                                        Add Products</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> Print data</a>
                                </div>
                            </div>
                            <form action="productmanager?action=updateproduct" method="POST">
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Genre</th>
                                            <th>Author</th>
                                            <th>Publisher</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Reviews</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${bookData}" var="p">
                                            <tr>
                                                <td>${p.bookID}</td>                                      
                                                <td>${p.bookName}</td>
                                                <td> <c:forEach items="${genData}" var="t">
                                                        <c:if test="${p.bookID==s.bookID}">
                                                            ${t.genreName}   
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>${p.authorName}</td>
                                                <td>${p.publisherName}</td>
                                                <td>${p.price}</td>
                                                <td>${p.Quantity}</td>
                                                <td>
                                                    <c:forEach items="${revData}" var="s">
                                                        <c:if test="${p.bookID==s.bookID}">
                                                            ${s.rating}   
                                                        </c:if>
                                                    </c:forEach>
                                                </td>

                                                <td>
                                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" value="${p.bookID}"><i
                                                            class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                                            data-toggle="modal" data-target="#ModalUP${p.bookID}"><i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>

                                            <!--
                                            MODAL
                                            -->

                                        <!--
                                      MODAL
                                        -->
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div id="clock"></div>

        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
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
                                    fillColor: "rgba(9, 109, 239, 0.651)  ",
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
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
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

            $(document).ready(jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    window.location = "ProductManager?action=deleteproduct&product_id=" + $(this).attr("value");
                                    swal("Đã xóa thành công.!", {
                                    });
                                }
                            });
                });
            }));
        </script>'
        <script>
            function showLogoutBox() {
                document.getElementById('logoutBox').style.display = 'block';
            }
            function logout() {
                window.location.href = 'login.jsp';
            }
            function cancelLogout() {
                window.location.href = 'index.jsp';
            }
        </script>

        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>
    </body>

</html>