const itemContainer = document.querySelector('.row__left');
const paginationContainer = document.querySelector('.exams__pagination');

function generatePagination(totalPages, activePage) {
    let pagination = '';

    for (let i = 1; i <= totalPages; i++) {
        pagination += `
            <li class="pagination--item">
                <a onclick=loadExam(${i}) class="pagi-link" data-active-page=${i}>${i}</a>
            </li>
        `;
    }

    paginationContainer.innerHTML = '';
    paginationContainer.insertAdjacentHTML('afterbegin', pagination);

    const active = document.querySelector(`.pagi-link[data-active-page="${activePage}"]`);
    active && active.classList.add('active');

    let nextBtn = `<li class="pagination--item">
                        <a onclick=loadExam(${activePage < totalPages ? activePage + 1 : activePage})>
                            <i class="fa-sharp fa-solid fa-angle-right"></i>
                        </a>
                </li>`;

    if (totalPages > 1) {
        paginationContainer.insertAdjacentHTML('beforeend', nextBtn);
    }
}

function generateExam(dataExams, totalPages, urlToStart) {
    let html = '';

    if(!totalPages) {
        html = `
            <div class="empty-exam">
                Không có bài kiểm tra nào.
            </div>
        `;
    }

    dataExams.forEach(exam => {
        html += `
            <div class="row__left--column">
                <a href="${urlToStart}&examId=${exam.ma_de}" class="hidden"></a>
                <div class="above">
                    <h3>${exam.ten_de}</h3>
                    <span>Bộ đề test: ${exam.bo_de}</span>
                    <br>
                    <span>
                        <i class="fa-sharp fa-regular fa-clock"></i> 
                        Thời gian: ${exam.thoi_gian_lam_bai}
                    </span>
                    <br>
                    <span>
                        <i class="fa-solid fa-user-pen"></i>
                        Người tham gia: ${exam.nguoi_tham_gia}
                    </span>
                    <br>
                    <span>
                        <i class="fa-sharp fa-solid fa-circle-question"></i> 
                        Số câu hỏi: ${exam.so_cau_hoi}
                    </span>
                    <br>
                    <span class="tag">${exam.loai === 0 ? '#DETEST' : ''}</span>
                </div>
                <br>
                <div class="bottom">
                    <a href="${urlToStart}&id=${exam.ma_de}" class="do">Làm bài</a>
                </div>
            </div>
        `;
    });

    itemContainer.innerHTML = '';
    itemContainer.insertAdjacentHTML('afterbegin', html);
}

function loadExam(page) {
    const url = window.location.href;
    const subUrl = url.slice(url.indexOf('?'));

    const urlToStart = url.replace('list', 'start');

    fetch(`../controllers/examController.php${subUrl}&curpage=${page}`)
        .then(res => res.json())
        .then(data => {
            const { data: dataExams, totalPages } = data;
            
            generateExam(dataExams, totalPages, urlToStart);
            generatePagination(totalPages, page);
        })
        .catch(error => {
            console.error(error);
        });
}

loadExam(1);