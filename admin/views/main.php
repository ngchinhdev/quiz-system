<main>
    <div class="container">
        <div class="nav">
            <div class="add-new">
                <a href="views/add_user.php">+ Thêm mới</a>
            </div>
            <div class="above_table">
                <div class="ctg_name">
                    <strong>Trang Người Dùng</strong>
                    <!-- <?php
                            if (isset($_SESSION['add-user-success'])) {
                                echo '<span class="success">' . $_SESSION['add-user-success'] . '</span>';
                                unset($_SESSION['add-user-success']);
                            } else if (isset($_SESSION['delete-user-success'])) {
                                echo '<span class="success">' . $_SESSION['delete-user-success'] . '</span>';
                                unset($_SESSION['delete-user-success']);
                            } else if (isset($_SESSION['edit-user-success'])) {
                                echo '<span class="success">' . $_SESSION['edit-user-success'] . '</span>';
                                unset($_SESSION['edit-user-success']);
                            }
                            ?> -->
                </div>
                <div class="search_box">
                    <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Tìm kiếm ...">
                </div>
            </div>
        </div>
        <table border="1">
            <tr>
                <th>#</th>
                <th>Tên người dùng</th>
                <th>Avatar</th>
                <th>Email</th>
                <th>Cấp bậc</th>
                <th>Thao tác</th>
            </tr>
            <!-- <?php foreach ($dataUser as $key => $user) { ?> -->
            <tr>
                <td><?= $key + 1 ?></td>
                <td><?= $user['name'] ?></td>
                <td><img class="avt-img" src="../public/assets/imgs/<?= $user['picture'] ?>" alt=""></td>
                <td><?= $user['email'] ?></td>
                <td><?= ($user['role_id'] === 1) ? 'admin' : 'user' ?></td>
                <td>
                    <div class="last-td">
                        <a href="views/edit_user.php?id=<?= $user['user_id'] ?>" class="change-btn">Sửa</a>
                        <a href="controllers/delete_user.php?id=<?= $user['user_id'] ?>" class="del-btn">Xóa</a>
                    </div>
                </td>
            </tr>
            <!-- <?php } ?> -->
        </table>
    </div>
</main>