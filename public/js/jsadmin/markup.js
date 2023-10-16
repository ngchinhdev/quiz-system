export const userRowMarkup = function(data) {
    let html = '';

    data.forEach((d, i) => {
        html += `<tr>
                    <td data-id="${d.ma_nguoi_dung}">${i + 1}</td>
                    <td>${d.ten_nguoi_dung}</td>
                    <td><img class="avt-img" src="${d.hinh_anh}" alt=""></td>
                    <td>${d.email}</td>
                    <td>${d.ma_vai_tro === 1 ? "Admin" : "User"}</td>
                    <td>
                        <div class="last-td">
                            <a href="../controllers/userController.php?act=delete&user-id=${d.ma_nguoi_dung}" class="del-btn">Xóa</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}

export const historyRowMarkup = function(data) {
    let html = '';

    data.forEach((d, i) => {
        html += `<tr>
                    <td data-id="${d.ma_lich_su}">${i + 1}</td>
                    <td>${d.ten_nguoi_dung}</td>
                    <td>${d.ten_de}</td>
                    <td>${d.thoi_gian_lam}</td>
                    <td>${d.thoi_diem}</td>
                    <td>${d.diem_so}</td>
                    <td>
                        <div class="last-td">
                            <a href="views/edit_user.php?id=<?= $user['user_id'] ?>" class="change-btn">Xem</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}

export const feedbackRowMarkup = function(data) {
    let html = '';

    data.forEach((d, i) => {
        html += `<tr>
                    <td data-id="${d.ma_phan_hoi}">${i + 1}</td>
                    <td>${d.ten_nguoi_dung}</td>
                    <td>${d.noi_dung}</td>
                    <td>${d.thoi_diem}</td>
                    <td>${d.trang_thai === 0 ? 'Ẩn' : 'Hiện'}</td>
                    <td>
                        <div class="last-td">
                            <a href="index.php?page=edit-feedback&id=${d.ma_phan_hoi}" class="change-btn">Sửa</a>
                            <a href="../controllers/feedbackController.php?act=delete&id=${d.ma_phan_hoi}" class="del-btn">Xóa</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}

export const examRowMarkup = function(data) {
    let html = '';

    data.forEach((d, i) => {
        html += `<tr>
                    <td data-id="${d.ma_de}">${i + 1}</td>
                    <td>${d.ten_de}</td>
                    <td>${d.bo_de}</td>
                    <td>${d.thoi_diem_tao}</td>
                    <td>${d.thoi_gian_lam_bai}</td>
                    <td>${d.nguoi_tham_gia}</td>
                    <td>
                        <div class="last-td">
                            <a href="index.php?page=edit-exam&id=${d.ma_de}" class="change-btn">Sửa</a>
                            <a href="../controllers/examController.php?act=delete&id=${d.ma_de}" class="del-btn">Xóa</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}

export const testRowMarkup = function(data) {
    let html = '';

    data.forEach((d, i) => {
        html += `<tr>
                    <td data-id="${d.ma_de}">${i + 1}</td>
                    <td>${d.ten_de}</td>
                    <td>${d.bo_de}</td>
                    <td>${d.cap_do}</td>
                    <td>${d.thoi_diem_tao}</td>
                    <td>${d.nguoi_tham_gia}</td>
                    <td>
                        <div class="last-td">
                            <a href="../controllers/examController.php?page=edit-exam&examId=${d.ma_de}" class="change-btn">Sửa</a>
                            <a href="../controllers/examController.php?act=delete&id=${d.ma_de}" class="del-btn">Xóa</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}