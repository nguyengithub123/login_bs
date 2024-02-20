
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Insert Product</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            })
        </script>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>
        <!-- Navbar-->
     
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
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">All Products</li>
                    <li class="breadcrumb-item"><a href="#">Add products</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Add products</h3>
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i
                                            class="fas fa-folder-plus"></i> Add genres..</a>
                                </div>
                            </div>

                            <form class="row" action="productmanager?action=insertproduct" method="POST" enctype="multipart/form-data">
                                <div class="form-group col-md-3">
                                    <label class="control-label">ID </label>
                                    <input class="form-control" name="product_id" type="text" placeholder="">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Genres</label>
                                    <select name="category_id" class="form-control" id="exampleSelect1">
                                        <option>-- Choose all genres --</option>
                                        <c:forEach items="${CategoryData}" var="cat">
                                            <option value="${cat.category_id}">${cat.category_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Name</label>
                                    <input class="form-control" name="product_name" type="text">
                                </div>
                                <div class="form-group  col-md-3">
                                    <label class="control-label">Price</label>
                                    <input class="form-control" name="price" type="number">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Author</label>
                                    <input class="form-control" name="size" type="text">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Producer</label>
                                    <input class="form-control" name="color" type="text">
                                </div>
                                <div class="form-group  col-md-3">
                                    <label class="control-label">Quantity</label>
                                    <input class="form-control" name="quantity" type="number" placeholder="1,2,3...">
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Images</label>
                                    <div id="myfileupload">
                                        <input type="file" id="uploadfile" name="product_img" onchange="readURL(this);" />
                                    </div>
                                    <div id="thumbbox">
                                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                        <a class="removeimg" href="javascript:"></a>
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                        <p style="clear:both"></p>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Detail</label>
                                    <textarea class="form-control" name="describe" id="describe"></textarea>
                                </div>
                                <button class="btn btn-save" type="submit">Save</button>
                                &nbsp;
                                <a class="btn btn-cancel" href="productmanager">Cancel</a>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Add Genres </h5>
                                </span>
                            </div>

                            <div class="form-group col-md-12" >

                                <h2 style="color: red; padding-left: 10px">
                                    ${error}</h2>
                                <label class="control-label">Enter genre name:</label>
                                <form action="productmanager?action=insertcategory" method="post"> 
                                    <input class="form-control" type="text" name="name" required>
                                    <br>
                                    <button class="btn btn-save" type="submit">Save</button>
                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Cancel</a>
                                </form>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Current genres:</label>
                                <ul style="padding-left: 20px;">
                                    <c:forEach items="${CategoryData}" var="cat">
                                        <li>${cat.category_name}</li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                        <div id="clock"></div>

        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="admin/js/main.js"></script>
        <script src="admin/js/plugins/pace.min.js"></script>
        <script>
                                        const inpFile = document.getElementById("inpFile");
                                        const loadFile = document.getElementById("loadFile");
                                        const previewContainer = document.getElementById("imagePreview");
                                        const previewContainer = document.getElementById("imagePreview");
                                        const previewImage = previewContainer.querySelector(".image-preview__image");
                                        const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
                                        const object = new ActiveXObject("Scripting.FileSystemObject");
                                        inpFile.addEventListener("change", function () {
                                            const file = this.files[0];
                                            if (file) {
                                                const reader = new FileReader();
                                                previewDefaultText.style.display = "none";
                                                previewImage.style.display = "block";
                                                reader.addEventListener("load", function () {
                                                    previewImage.setAttribute("src", this.result);
                                                });
                                                reader.readAsDataURL(file);
                                            }
                                        });


        </script>
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

    </body>

</html>
