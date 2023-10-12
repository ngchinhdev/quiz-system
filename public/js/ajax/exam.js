const itemContainer = document.querySelector('.exam');
const paginationContainer = document.querySelector('.exams__pagination');

function generatePagination(totalPages, activePage, itemContainer, paginationContainer) {
    let pagination = '';
    paginationContainer.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        pagination += `
            <li class="pagination--item">
                <a class="pagi-link" data-active-page=${i}>${i}</a>
            </li>
        `;
    }

    paginationContainer.removeEventListener('click', function(e) {
        const pagiBtn = e.target.closest('.pagi-link');

        if(!pagiBtn) return;

        loadExam(+pagiBtn.dataset.activePage, itemContainer, paginationContainer);
    })

    paginationContainer.addEventListener('click', function(e) {
        const pagiBtn = e.target.closest('.pagi-link');

        if(!pagiBtn) return;

        loadExam(+pagiBtn.dataset.activePage, itemContainer, paginationContainer);
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

    console.log(totalPages);

    document.querySelector('.next--pagi')?.addEventListener('click', 
            () => loadExam(activePage < totalPages ? activePage + 1 : activePage, itemContainer, paginationContainer));
}

function generateExam(dataExams, totalPages, urlToStart, container) {
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
            <div class="exam--column">
                <a href="${urlToStart.includes('page=start') ? urlToStart : urlToStart.concat('?page=start&type=exam')}&examId=${exam.ma_de}" class="hidden"></a>
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
                        Lượt tham gia: ${exam.nguoi_tham_gia}
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

    container.innerHTML = '';
    container.insertAdjacentHTML('afterbegin', html);
}

export function loadExam(page, itemContainer, paginationContainer) {
    const curUrl = window.location.href;

    let url = '';
    if(curUrl.includes("type=test")) {
        const subUrl = curUrl.slice(curUrl.indexOf('?'));
        url = `../controllers/examController.php${subUrl}&curpage=${page}`;
    } 
    if(curUrl.includes("type=exam")) {
        url = `../controllers/examController.php?page=list&type=exam&curpage=${page}`;
    }
    if(curUrl.split('?')[1] === undefined) {
        url = `../controllers/examController.php?page=list&type=exam&isHome=true&curpage=${page}`;
    }

    const urlToStart = curUrl.replace('list', 'start');

    fetch(url)
        .then(res => res.json())
        .then(data => {
            const { data: dataExams, totalPages } = data;
            
            generateExam(dataExams, totalPages, urlToStart, itemContainer);
            generatePagination(totalPages, page, itemContainer, paginationContainer);
        })
        .catch(error => {
            console.error(error);
        });
}

loadExam(1, itemContainer, paginationContainer);
