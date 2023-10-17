import { userRowMarkup, feedbackRowMarkup, examRowMarkup, 
        testRowMarkup, historyRowMarkup, dashboardMarkup} from "./markup.js";

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

function generatePagination(totalPages, activePage) {
    const paginationContainer = document.querySelector('.exams__pagination');
    let pagination = '';
    paginationContainer.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        pagination += `
            <li class="pagination--item">
                <a class="pagi-link" data-active-page=${i}>${i}</a>
            </li>
        `;
    }

    paginationContainer.addEventListener('click', function(e) {
        const pagiBtn = e.target.closest('.pagi-link');

        if(!pagiBtn) return;

        loadContents(+pagiBtn.dataset.activePage, curLinkPage);
    })
    
    paginationContainer.insertAdjacentHTML('afterbegin', pagination);

    const active = document.querySelector(`.pagi-link[data-active-page="${activePage}"]`);
    active && active.classList.add('active');

    let nextBtn = `<li class="pagination--item">
                        <a class="next--pagi">
                            <i class="fa-sharp fa-solid fa-angle-right"></i>
                        </a>
                </li>`;

    if (totalPages > 1) {
        paginationContainer.insertAdjacentHTML('beforeend', nextBtn);
    }

    console.log(paginationContainer);

    document.querySelector('.next--pagi')?.addEventListener('click', 
            () => loadContents(activePage < totalPages ? activePage + 1 : activePage, curLinkPage));
}

const generateRows = function(data, type) {
    const linkAdd = type === 'lib_exam' ? '<a href="index.php?page=add-exam">+ Thêm mới</a>' 
                                        : '<a href="index.php?page=add-test">+ Thêm mới</a>';
    const notDashboard = type !== 'dashboard'; 

    const above = `<div class="nav">
                            <div class="add-new">
                                ${(type === 'user' || type === 'feedback' || type === 'history') ? '' : linkAdd}
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
                                ${notDashboard && navsTable[type === 'lib' ? 'lib_exam' : type].map(n => `<th>${n}</th>`).join('')}
                                <th>Thao tác</th>
                            </tr>
                        </table>
                        <ul class="exams__pagination">
                
                        </ul>
                        </div>
                    </main>`;

    mainContainer.innerHTML = '';
    notDashboard && mainContainer.insertAdjacentHTML('beforeend', above);

    let html = '';
    type === 'dashboard' && (html = dashboardMarkup(data));
    type === 'user' && (html = userRowMarkup(data));
    type === 'history' && (html = historyRowMarkup(data));
    type === 'feedback' && (html = feedbackRowMarkup(data));
    (type === 'lib_exam' || type === 'lib') && (html = examRowMarkup(data));
    type === 'lib_test' && (html = testRowMarkup(data));

    const tableContainer = document.querySelector('main table');
    notDashboard && tableContainer.insertAdjacentHTML("beforeend", html);
    !notDashboard && mainContainer.insertAdjacentHTML("beforeend", html);
}

const loadContents = function(page, curLinkPage) {
    const notDashboard = curLinkPage !== 'dashboard'; 
    const path = (curLinkPage === 'lib_test' || curLinkPage === 'lib_exam' || curLinkPage === 'lib') ? 'exam' : curLinkPage;
    console.log(path);
    console.log(curLinkPage);
    let url = `../controllers/${path}Controller.php?page=${curLinkPage == 'lib' ? 'lib_exam' : curLinkPage}&curpage=${page}`;

    fetch(url)
        .then(res => res.json())
        .then(data => {
            console.log(data);
            if(notDashboard) {
                generateRows(data.data, curLinkPage);
                generatePagination(data.totalPages, page);
            } else {
                generateRows(data, curLinkPage);

                const chartTest = document.querySelector('#chart-test');
                chartTest && new Chart(chartTest, {
                    type: 'doughnut',
                    data: {
                        datasets: [{
                            data: [data.percentTest, 100 - data.percentTest],
                            backgroundColor: [
                                '#4d5fff',
                                '#F1F1F1'
                            ],
                            hoverOffset: 4
                        }]
                    }
                })

                const chartExam = document.querySelector('#chart-exam');
                chartExam && new Chart(chartExam, {
                    type: 'doughnut',
                    data: {
                        datasets: [{
                            data: [data.percentExam, 100 - data.percentExam],
                            backgroundColor: [
                                '#FFC003',
                                '#F1F1F1'
                            ],
                            hoverOffset: 4
                        }]
                    }
                })
            }
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

