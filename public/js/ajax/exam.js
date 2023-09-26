const itemContainer = document.querySelector('.row__left');
const paginationContainer = document.querySelector('.exams__pagination');

function generatePagination(totalPages, activePage) {
    let pagination = '';
    let i = 1;

    // let nextBtn = `<li class="page--item">
    //                     <a onclick=loadExam(${i + 1})><i class="fa-sharp fa-solid fa-angle-right"></i></a>
    //                 </li>`;
    for(i; i <= totalPages; i++) {
        pagination += `
                <li class="page--item">
                    <a onclick=loadExam(${i}) class="pagi-link" data-active-page=${i}>${i}</a>
                </li>

            `
    }

    console.log(pagination);

    paginationContainer.insertAdjacentHTML('afterbegin', pagination);

    document.querySelector(`[data-active-page="${activePage}"]`).classList.add('active')

    // if(totalPages > 1) {
    //     paginationContainer.insertAdjacentHTML('beforeend', nextBtn);
    // }
}

function loadExam(page) {
    const url = window.location.href;
    const subUrl = url.slice(url.indexOf('?'));


    fetch(`../controllers/examController.php${subUrl}&curpage=${page}`)
        .then(res => res.json())
        .then(data => {
            
            const {data : dataItem, totalRecords, totalPages} = data;

            console.log(data, dataItem, totalRecords, totalPages);

            itemContainer.innerHTML = '';
            paginationContainer.innerHTML = '';

            let html = '';
            dataItem.forEach(exam => {
                html += `
                    <div class="row__left--column">
                        <a href="#" class="hidden"></a>
                        <div class="above">
                            <h3>${exam.ten_de}</h3>
                            <span>Bộ đề test: ${exam.bo_de}</span>
                            <br>
                            <span>
                                <i class="fa-sharp fa-regular fa-clock"></i> 
                                Thời gian: ${exam.thoi_gian_lam_bai}
                            </span>
                            <br>
                            <span><i class="fa-solid fa-user-pen"></i>Người tham gia: ${exam.nguoi_tham_gia}</span>
                            <br>
                            <span><i class="fa-sharp fa-solid fa-circle-question"></i> Số câu hỏi: ${exam.so_cau_hoi}</span>
                            <br>
                            <span class="tag">${exam.loai === 0 ? '#DETEST' : ''}</span>
                        </div>
                        <br>
                        <div class="bottom">
                            <a href="#" class="do">Làm bài</a>
                        </div>
                    </div>
                `
            });

            itemContainer.insertAdjacentHTML('afterbegin', html);

            generatePagination(totalPages, page);
        });
}


loadExam(1);