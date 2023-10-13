import { userRowMarkup, feedbackRowMarkup, examRowMarkup, testRowMarkup, historyRowMarkup} from "./markup.js";

const navAside = document.querySelector('.sidebar_menu');
const mainContainer = document.querySelector('main .container');


let curLinkPage = '';

const titles = {
    'dashboard': 'Trang Thống Kê',
    'user': 'Trang Người Dùng',
    'lib_exam': 'Thư viện đề thi',
    'lib_test': 'Thư viện đề test',
    'feedback': 'Trang Phản Hồi',
    'history': 'Trang Lịch Sử Làm Bài'
}

const navsTable = {
    'user': ['Tên người dùng', 'Hình ảnh', 'Email', 'Cấp bậc'],
    'lib_exam': ['Tên đề', 'Bộ đề', 'Ngày tạo', 'Thời gian', 'Người tham gia'],
    'lib_test': ['Tên đề', 'Bộ đề', 'Cấp độ', 'Ngày tạo', 'Người tham gia'],
    'feedback': ['Tên người dùng', 'Nội dung', 'Thời điểm', 'Trạng thái'],
    'history': ['Tên người dùng', 'Tên đề', 'Thời gian làm', 'Thời điểm', 'Điểm số'],
}

const generateRows = function(data, type) {
    const above = `<div class="nav">
                            <div class="add-new">
                                <a href="views/add_user.php">+ Thêm mới</a>
                            </div>
                            <div class="above_table">
                                <div class="ctg_name">
                                    <strong>${titles[type === 'lib' ? 'lib_exam' : type]}</strong>
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
                                ${navsTable[type === 'lib' ? 'lib_exam' : type].map(n => `<th>${n}</th>`).join('')}
                                <th>Thao tác</th>
                            </tr>
                        </table>
                        </div>
                    </main>`;

    mainContainer.innerHTML = '';
    mainContainer.insertAdjacentHTML('beforeend', above);

    let html = '';
    type === 'user' && (html = userRowMarkup(data));
    type === 'history' && (html = historyRowMarkup(data));
    type === 'feedback' && (html = feedbackRowMarkup(data));
    (type === 'lib_exam' || type === 'lib') && (html = examRowMarkup(data));
    type === 'lib_test' && (html = testRowMarkup(data));

    const tableContainer = document.querySelector('main table');
    tableContainer.insertAdjacentHTML("beforeend", html);
}

const loadContents = function(page, curLinkPage) {
    const path = (curLinkPage === 'lib_test' || curLinkPage === 'lib_exam' || curLinkPage === 'lib') ? 'exam' : curLinkPage;
    console.log(path);
    console.log(curLinkPage);
    let url = `../controllers/${path}Controller.php?page=${curLinkPage == 'lib' ? 'lib_exam' : curLinkPage}&curpage=${page}`;

    fetch(url)
        .then(res => res.json())
        .then(data => {
            console.log(data);
            generateRows(data, curLinkPage);
        })
        .catch(err => console.error(err));
}

const handleClick = () => {
    navAside.addEventListener('click', function(e) {
        const linkEl = e.target.closest('.link');
    
        if(!linkEl) return;
    
        curLinkPage = linkEl.getAttribute('href');
        loadContents(1, curLinkPage);
    });
}

handleClick();

