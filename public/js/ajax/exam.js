// import { convention } from "../convention.js";

const itemContainer = document.querySelector('.row__left');
const paginationContainer = document.querySelector('.exams__pagination');

function generatePagination(totalPages, activePage) {
    let pagination = '';

    for (let i = 1; i <= totalPages; i++) {
        pagination += `
            <li class="page--item">
                <a onclick=loadExam(${i}) class="pagi-link" data-active-page=${i}>${i}</a>
            </li>
        `;
        console.log(1);
    }

    paginationContainer.innerHTML = '';
    paginationContainer.insertAdjacentHTML('afterbegin', pagination);

    document.querySelector(`.pagi-link[data-active-page="${activePage}"]`).classList.add('active');

    let nextBtn = `<li class="page--item">
                        <a onclick=loadExam(${activePage < totalPages ? activePage + 1 : activePage})>
                            <i class="fa-sharp fa-solid fa-angle-right"></i>
                        </a>
                </li>`;

    if (totalPages > 1) {
        paginationContainer.insertAdjacentHTML('beforeend', nextBtn);
    }

}

function loadExam(page) {
    const url = window.location.href;
    const subUrl = url.slice(url.indexOf('?'));

    const urlToStart = url.replace('list', 'start');

    fetch(`../controllers/examController.php${subUrl}&curpage=${page}`)
        .then(res => res.json())
        .then(data => {

            let html = '';

            const { data: dataExams, totalPages } = data;

            dataExams.forEach(exam => {
                html += `
                    <div class="row__left--column">
                        <a href="${urlToStart}&id=${exam.ma_de}&question=0&order=1" class="hidden"></a>
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
                            <a href="index.php?page=start" class="do">Làm bài</a>
                        </div>
                    </div>
                `;
            });

            itemContainer.innerHTML = '';
            itemContainer.insertAdjacentHTML('afterbegin', html);

            generatePagination(totalPages, page);
        })
        .catch(err => {
            console.log(err.message);
        }) 
}

window.loadExam = loadExam;

loadExam(1);