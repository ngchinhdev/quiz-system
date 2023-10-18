const displayTimeToDo = function(time) {
    const min = `${Math.trunc(time % 3600 / 60)}`.padStart(2, 0);
    const sec = String(time % 60).padStart(2, 0);
  
    return `${min}:${sec}`;
}

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
        html += `<tr class="last-row" data-id="${d.ma_lich_su}">
                    <td>${i + 1}</td>
                    <td>${d.ten_nguoi_dung}</td>
                    <td>${d.ten_de}</td>
                    <td>${displayTimeToDo(d.thoi_gian_lam)}</td>
                    <td>${moment(d.thoi_diem).utcOffset(7).format("HH:mm:ss DD-MM-YYYY")}</td>
                    <td>${d.diem_so}</td>
                    <td>
                        <div class="last-td">
                            <a data-exam="${d.ma_de}" href="" class="see-btn">Xem</a>
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
                    <td>${moment(d.thoi_diem).utcOffset(7).format("HH:mm:ss DD-MM-YYYY")}</td>
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
                    <td>${moment(d.thoi_diem_tao).utcOffset(7).format("HH:mm:ss DD-MM-YYYY")}</td>
                    <td>${displayTimeToDo(d.thoi_gian_lam_bai)}</td>
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
                            <a href="index.php?page=edit-test&id=${d.ma_de}" class="change-btn">Sửa</a>
                            <a href="../controllers/examController.php?act=delete&id=${d.ma_de}" class="del-btn">Xóa</a>
                        </div>
                    </td>
                </tr>`
    });

    return html;
}

export const dashboardMarkup = function(data) {
    let html = '';

    html = `<div class="nav">
                <div class="above_table">
                    <div class="ctg_name">
                        <strong>Trang Thống Kê</strong>
                    </div>
                </div>
            </div>
            <div class="statistical">
                <div class="members-box above fl">
                    <div class="left">
                        <div class="number">
                            ${data.quantityUser}
                        </div>
                        <h3>Thành viên</h3>
                        <p><span class="status">+ 0.5%</span> so voi thang truoc</p>
                    </div>
                    <div class="right">
                        <svg xmlns="http://www.w3.org/2000/svg" width="78" height="78" viewBox="0 0 78 78" fill="none">
                            <path d="M11.7 35.1C16.0022 35.1 19.5 31.6022 19.5 27.3C19.5 22.9978 16.0022 19.5 11.7 19.5C7.39781 19.5 3.9 22.9978 3.9 27.3C3.9 31.6022 7.39781 35.1 11.7 35.1ZM66.3 35.1C70.6022 35.1 74.1 31.6022 74.1 27.3C74.1 22.9978 70.6022 19.5 66.3 19.5C61.9978 19.5 58.5 22.9978 58.5 27.3C58.5 31.6022 61.9978 35.1 66.3 35.1ZM70.2 39H62.4C60.255 39 58.3172 39.8653 56.9034 41.2669C61.815 43.9603 65.3006 48.8231 66.0563 54.6H74.1C76.2572 54.6 78 52.8572 78 50.7V46.8C78 42.4978 74.5022 39 70.2 39ZM39 39C46.5441 39 52.65 32.8941 52.65 25.35C52.65 17.8059 46.5441 11.7 39 11.7C31.4559 11.7 25.35 17.8059 25.35 25.35C25.35 32.8941 31.4559 39 39 39ZM48.36 42.9H47.3484C44.8134 44.1187 41.9981 44.85 39 44.85C36.0019 44.85 33.1988 44.1187 30.6516 42.9H29.64C21.8888 42.9 15.6 49.1887 15.6 56.94V60.45C15.6 63.6797 18.2203 66.3 21.45 66.3H56.55C59.7797 66.3 62.4 63.6797 62.4 60.45V56.94C62.4 49.1887 56.1112 42.9 48.36 42.9ZM21.0966 41.2669C19.6828 39.8653 17.745 39 15.6 39H7.8C3.49781 39 0 42.4978 0 46.8V50.7C0 52.8572 1.74281 54.6 3.9 54.6H11.9316C12.6994 48.8231 16.185 43.9603 21.0966 41.2669Z" fill="#4D5FFF" />
                        </svg>
                    </div>
                </div>
                <div class="history-box above fl">
                    <div class="left">
                        <div class="number">
                        ${data.quantityHistory}
                        </div>
                        <h3>Lịch sử làm bài</h3>
                        <p><span class="status">+ 0.5%</span> so voi thang truoc</p>
                    </div>
                    <div class="right">
                        <svg xmlns="http://www.w3.org/2000/svg" width="78" height="78" viewBox="0 0 78 78" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M63.375 21.125C62.0821 21.125 60.8421 21.6386 59.9279 22.5529C59.0136 23.4671 58.5 24.7071 58.5 26V29.25H68.25V26C68.25 24.7071 67.7364 23.4671 66.8221 22.5529C65.9079 21.6386 64.6679 21.125 63.375 21.125ZM68.25 32.5H58.5V59.3125L63.375 66.625L68.25 59.3125V32.5ZM9.75 14.625V63.375C9.75 64.6679 10.2636 65.9079 11.1779 66.8221C12.0921 67.7364 13.3321 68.25 14.625 68.25H50.375C51.6679 68.25 52.9079 67.7364 53.8221 66.8221C54.7364 65.9079 55.25 64.6679 55.25 63.375V14.625C55.25 13.3321 54.7364 12.0921 53.8221 11.1779C52.9079 10.2636 51.6679 9.75 50.375 9.75H14.625C13.3321 9.75 12.0921 10.2636 11.1779 11.1779C10.2636 12.0921 9.75 13.3321 9.75 14.625ZM32.5 24.375C32.5 23.944 32.6712 23.5307 32.976 23.226C33.2807 22.9212 33.694 22.75 34.125 22.75H47.125C47.556 22.75 47.9693 22.9212 48.274 23.226C48.5788 23.5307 48.75 23.944 48.75 24.375C48.75 24.806 48.5788 25.2193 48.274 25.524C47.9693 25.8288 47.556 26 47.125 26H34.125C33.694 26 33.2807 25.8288 32.976 25.524C32.6712 25.2193 32.5 24.806 32.5 24.375ZM34.125 29.25C33.694 29.25 33.2807 29.4212 32.976 29.726C32.6712 30.0307 32.5 30.444 32.5 30.875C32.5 31.306 32.6712 31.7193 32.976 32.024C33.2807 32.3288 33.694 32.5 34.125 32.5H47.125C47.556 32.5 47.9693 32.3288 48.274 32.024C48.5788 31.7193 48.75 31.306 48.75 30.875C48.75 30.444 48.5788 30.0307 48.274 29.726C47.9693 29.4212 47.556 29.25 47.125 29.25H34.125ZM32.5 45.5C32.5 45.069 32.6712 44.6557 32.976 44.351C33.2807 44.0462 33.694 43.875 34.125 43.875H47.125C47.556 43.875 47.9693 44.0462 48.274 44.351C48.5788 44.6557 48.75 45.069 48.75 45.5C48.75 45.931 48.5788 46.3443 48.274 46.649C47.9693 46.9538 47.556 47.125 47.125 47.125H34.125C33.694 47.125 33.2807 46.9538 32.976 46.649C32.6712 46.3443 32.5 45.931 32.5 45.5ZM34.125 50.375C33.694 50.375 33.2807 50.5462 32.976 50.851C32.6712 51.1557 32.5 51.569 32.5 52C32.5 52.431 32.6712 52.8443 32.976 53.149C33.2807 53.4538 33.694 53.625 34.125 53.625H47.125C47.556 53.625 47.9693 53.4538 48.274 53.149C48.5788 52.8443 48.75 52.431 48.75 52C48.75 51.569 48.5788 51.1557 48.274 50.851C47.9693 50.5462 47.556 50.375 47.125 50.375H34.125ZM19.5 45.5V50.375H24.375V45.5H19.5ZM17.875 42.25H26C26.431 42.25 26.8443 42.4212 27.149 42.726C27.4538 43.0307 27.625 43.444 27.625 43.875V52C27.625 52.431 27.4538 52.8443 27.149 53.149C26.8443 53.4538 26.431 53.625 26 53.625H17.875C17.444 53.625 17.0307 53.4538 16.726 53.149C16.4212 52.8443 16.25 52.431 16.25 52V43.875C16.25 43.444 16.4212 43.0307 16.726 42.726C17.0307 42.4212 17.444 42.25 17.875 42.25ZM28.7739 25.5239C29.0699 25.2174 29.2337 24.8069 29.23 24.3808C29.2263 23.9548 29.0554 23.5472 28.7541 23.2459C28.4528 22.9446 28.0452 22.7737 27.6192 22.77C27.1931 22.7663 26.7826 22.9301 26.4761 23.2261L21.125 28.5773L19.0239 26.4761C18.7174 26.1801 18.3069 26.0163 17.8808 26.02C17.4548 26.0237 17.0472 26.1946 16.7459 26.4959C16.4446 26.7972 16.2737 27.2048 16.27 27.6308C16.2663 28.0569 16.4301 28.4674 16.7261 28.7739L21.125 33.1727L28.7739 25.5239Z" fill="#4D5FFF" />
                        </svg>
                    </div>
                </div>
                <div class="test-box under fl">
                    <div class="left chart">
                        <canvas id="chart-test" width="130" height="130"></canvas>
                        <div class="percent">${data.percentTest}%</div>
                    </div>
                    <div class="right">
                        <div class="number">${data.quantityTest}</div>
                        <h3>Bài test</h3>
                    </div>
                </div>
                <div class="exam-box under fl">
                    <div class="left chart">
                        <canvas id="chart-exam" width="130" height="130"></canvas>
                        <div class="percent">${data.percentExam}%</div>
                    </div>
                    <div class="right">
                        <div class="number">${data.quantityExam}</div>
                        <h3>Đề thi</h3>
                    </div>
                </div>
                <div class="feedback-box under fl">
                    <div class="left">
                        <svg xmlns="http://www.w3.org/2000/svg" width="81" height="81" viewBox="0 0 81 81" fill="none">
                            <path d="M45.3252 33.3018C43.4979 33.3018 42.082 34.7177 42.082 36.4658C42.082 38.214 43.4979 39.6299 45.3252 39.6299C46.9942 39.6299 48.4102 38.214 48.4102 36.4658C48.4102 34.7177 46.9942 33.3018 45.3252 33.3018ZM23.1768 33.3018C21.3495 33.3018 19.9336 34.7177 19.9336 36.4658C19.9336 38.214 21.3495 39.6299 23.1768 39.6299C24.8458 39.6299 26.2617 38.214 26.2617 36.4658C26.2617 34.7177 24.8458 33.3018 23.1768 33.3018Z" fill="#FFC003" />
                            <path d="M70.7167 27.29C66.9119 22.0693 61.5963 18.581 55.7665 17.0068V17.0147C54.4139 15.5118 52.8872 14.1275 51.1786 12.8936C38.2297 3.48047 20.0522 6.35186 10.5995 19.3008C2.98205 29.8213 3.30637 43.9726 11.0741 54.0264L11.1374 64.5152C11.1374 64.7684 11.177 65.0215 11.2561 65.2588C11.6753 66.5956 13.0991 67.3313 14.428 66.912L24.4423 63.7559C27.0922 64.6972 29.8291 65.2351 32.5502 65.3853L32.5107 65.417C39.5586 70.5507 48.7977 72.0932 57.2695 69.293L67.3233 72.5678C67.5764 72.6469 67.8374 72.6943 68.1064 72.6943C69.5065 72.6943 70.6376 71.5632 70.6376 70.1631V59.5635C77.6065 50.1029 77.7884 37.0274 70.7167 27.29ZM25.5497 58.1396L24.6005 57.7441L16.7695 60.1963L16.6904 51.9697L16.0575 51.2578C9.36555 43.0945 8.92258 31.3321 15.1874 22.7021C22.8128 12.2449 37.4308 9.93516 47.8564 17.4814C58.3136 25.0831 60.6313 39.6773 53.0771 50.0713C46.741 58.7646 35.3979 61.9761 25.5497 58.1396ZM65.496 56.7949L64.8632 57.5859L64.9423 65.8125L57.1904 63.2021L56.2411 63.5977C51.8114 65.243 47.0891 65.3774 42.7148 64.1514L42.6989 64.1435C48.5446 62.3479 53.8444 58.7092 57.665 53.4727C63.7083 45.1433 64.6892 34.6781 61.1771 25.7555L61.2245 25.7871C63.0439 27.0923 64.7129 28.7218 66.1288 30.6914C71.8716 38.5699 71.5473 49.2961 65.496 56.7949Z" fill="#4D5FFF" />
                            <path d="M34.251 33.3018C32.4237 33.3018 31.0078 34.7177 31.0078 36.4658C31.0078 38.214 32.4237 39.6299 34.251 39.6299C35.92 39.6299 37.3359 38.214 37.3359 36.4658C37.3359 34.7177 35.92 33.3018 34.251 33.3018Z" fill="#FFC003" />
                        </svg>
                    </div>
                    <div class="right">
                        <div class="number">${data.quantityFeedback}</div>
                        <h3>Phản hồi</h3>
                    </div>
                </div>
            </div>`;
    return html;
}