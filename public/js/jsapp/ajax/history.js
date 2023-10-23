import { transformDataAllQuestions, handleResult } from "../result.js";
import { displayTimeToDo } from "./exam.js";

const historyContainer = document.querySelector('.profile__container--rows');
const paginationContainer = document.querySelector('.profile__container--pagination');
const listHistories = document.querySelector('.profile__list--results');

const generatePagination = function (totalPagi, activePage) {
    let pagination = '';

    for (let i = 1; i <= totalPagi; i++) {
        pagination += `
            <li class="pagination--item">
                <a class="pagi-link" data-active="${i}">${i}</a>       
            </li>
        `;
    }

    paginationContainer.addEventListener('click', function(e) {
        const pagiBtn = e.target.classList.contains('pagi-link');

        if(!pagiBtn) return;

        loadHistory(+e.target.dataset.active);
    })

    paginationContainer.innerHTML = '';
    paginationContainer.insertAdjacentHTML('afterbegin', pagination);

    const active = document.querySelector(`.pagi-link[data-active="${activePage}"]`);
    active && active.classList.add('active');

    let nextBtnHmtl = `<li class="pagination--item">
                        <a class="next--pagi">
                            <i class="fa-sharp fa-solid fa-angle-right"></i>
                        </a>
                </li>`;

    if (totalPagi > 1) {
        paginationContainer.insertAdjacentHTML('beforeend', nextBtnHmtl);
    }

    const btnNext = document.querySelector('.next--pagi')
    btnNext && btnNext.addEventListener('click', 
            () => loadHistory(activePage < totalPagi ? activePage + 1 : activePage));
}

const generateHistories = function(data) {
    let html = '';

    if(data.length === 0) {
        html = `
            <div class="empty-exam">
                Chưa có lịch sử nào.
            </div>
        `;
    }

    data.forEach(history => {
        html += `<div class="col">
                    <div class="history--item" data-id="${history.ma_lich_su}">
                        <h3 class="title" data-exam="${history.ma_de}">
                            ${history.ten_de}
                        </h3>
                        <div class="kit txt">
                            Bộ đề test: <span>${history.bo_de}</span><span> (${(history.cap_do !== null) ? (history.cap_do).toUpperCase() : '~'})</span>
                        </div>
                        <div class="time--did fl txt">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22" fill="none">
                                <path d="M12.3748 7.33333H10.9998V11.9167L14.9232 14.245L15.5832 13.1358L12.3748 11.2292V7.33333ZM11.9165 2.75C9.72847 2.75 7.63005 3.61919 6.08287 5.16637C4.5357 6.71354 3.6665 8.81196 3.6665 11H0.916504L4.5465 14.6942L8.24984 11H5.49984C5.49984 9.29819 6.17588 7.66609 7.37924 6.46273C8.58259 5.25937 10.2147 4.58333 11.9165 4.58333C13.6183 4.58333 15.2504 5.25937 16.4538 6.46273C17.6571 7.66609 18.3332 9.29819 18.3332 11C18.3332 12.7018 17.6571 14.3339 16.4538 15.5373C15.2504 16.7406 13.6183 17.4167 11.9165 17.4167C10.1473 17.4167 8.54317 16.6925 7.38817 15.5283L6.0865 16.83C6.84869 17.6006 7.75683 18.2115 8.75785 18.627C9.75887 19.0425 10.8327 19.2543 11.9165 19.25C14.1045 19.25 16.203 18.3808 17.7501 16.8336C19.2973 15.2865 20.1665 13.188 20.1665 11C20.1665 8.81196 19.2973 6.71354 17.7501 5.16637C16.203 3.61919 14.1045 2.75 11.9165 2.75Z" fill="black" fill-opacity="0.73" />
                            </svg>Thời gian đã làm: <span> ${displayTimeToDo(history.thoi_gian_lam)}</span>
                        </div>
                        <div class="points fl txt">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22" fill="none">
                                <path opacity="0.2" d="M17.1875 3.4375V16.5L14.4375 14.5363V6.1875C14.4375 6.00516 14.3651 5.8303 14.2361 5.70136C14.1072 5.57243 13.9323 5.5 13.75 5.5H7.5625V3.4375C7.5625 3.25516 7.63493 3.0803 7.76386 2.95136C7.8928 2.82243 8.06766 2.75 8.25 2.75H16.5C16.6823 2.75 16.8572 2.82243 16.9861 2.95136C17.1151 3.0803 17.1875 3.25516 17.1875 3.4375Z" fill="black" />
                                <path d="M16.5 2.0625H8.25C7.88533 2.0625 7.53559 2.20737 7.27773 2.46523C7.01987 2.72309 6.875 3.07283 6.875 3.4375V4.8125H5.5C5.13533 4.8125 4.78559 4.95737 4.52773 5.21523C4.26987 5.47309 4.125 5.82283 4.125 6.1875V19.25C4.125 19.3763 4.1598 19.5002 4.22558 19.608C4.29136 19.7159 4.38559 19.8035 4.49791 19.8613C4.61023 19.9191 4.73631 19.9449 4.8623 19.9357C4.98828 19.9266 5.10932 19.8829 5.21211 19.8095L9.625 16.6573L14.0387 19.8095C14.1415 19.8826 14.2625 19.9261 14.3883 19.9351C14.5142 19.9442 14.6401 19.9184 14.7523 19.8606C14.8645 19.8028 14.9586 19.7153 15.0243 19.6076C15.0901 19.4999 15.1249 19.3762 15.125 19.25V15.8718L16.7879 17.0595C16.8907 17.1329 17.0117 17.1766 17.1377 17.1857C17.2637 17.1949 17.3898 17.1691 17.5021 17.1113C17.6144 17.0535 17.7086 16.9659 17.7744 16.858C17.8402 16.7502 17.875 16.6263 17.875 16.5V3.4375C17.875 3.07283 17.7301 2.72309 17.4723 2.46523C17.2144 2.20737 16.8647 2.0625 16.5 2.0625ZM13.75 17.9145L10.0237 15.2505C9.90715 15.1672 9.76743 15.1224 9.62414 15.1224C9.48085 15.1224 9.34113 15.1672 9.22453 15.2505L5.5 17.9137V6.1875H13.75V17.9145ZM16.5 15.1645L15.125 14.1797V6.1875C15.125 5.82283 14.9801 5.47309 14.7223 5.21523C14.4644 4.95737 14.1147 4.8125 13.75 4.8125H8.25V3.4375H16.5V15.1645Z" fill="black" />
                            </svg>Điểm số: ${history.diem_so} trên ${history.so_cau_hoi} (${(history.diem_so / history.so_cau_hoi) * 100}%)
                        </div>
                        <div class="timeline fl">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <g clip-path="url(#clip0_73_2)">
                                    <path d="M11.9574 0.820312L5.54258 9.27773L1.75 5.48789L0 7.23789L5.83242 13.0703L14 2.57031L11.9574 0.820312Z" fill="#2BC155" />
                                </g>
                                <defs>
                                    <clipPath id="clip0_73_2">
                                        <rect width="14" height="14" fill="white" />
                                    </clipPath>
                                </defs>
                            </svg>
                            Đã làm vào: <span> ${moment(history.thoi_diem).utcOffset(7).format("HH:mm:ss DD/MM/YYYY")}</span>
                        </div>
                    </div>
                </div>`;
    });

    historyContainer.innerHTML = '';
    historyContainer.insertAdjacentHTML('beforeend', html);
}

const loadHistory = function(page) {
    fetch(`../controllers/historyController.php?curpage=${page}`)
        .then(res => res.json())
        .then(data => {
            generateHistories(data.data);
            generatePagination(data.totalPagi, page);
        })
        .catch(err => console.error(err))
}

loadHistory(1);

//////////////////////////////////////////////////////////////////////
function handleAudioControl() {
    document.querySelector('.profile__list--results').addEventListener('click', (e) => {
        const btn = e.target.closest('.audio--btn');

        if (!btn) return;

        e.preventDefault();
        const audio = new Audio();
        audio.src = btn.querySelector('a').href;

        if (audio.paused) {
            audio.play();
        } else {
            audio.pause();
            audio.currentTime = 0;
        }
    })
};
    
const handleHistoryDetail = function() {
    historyContainer.addEventListener('click', function(e) {
        
        const historyItem = e.target.closest('.history--item');
        
        if(!historyItem) return;

        listHistories.classList.remove('show');

        document.querySelector('.history--item.choose')?.classList.remove('choose');
        historyItem.classList.add('choose');

        const examId = historyItem.querySelector('.title').dataset.exam;
        const historyId = historyItem.dataset.id;

        fetch(`../controllers/historyDetailController.php?historyId=${historyId}&examId=${examId}`)
            .then(res => res.json())
            .then(data => {
                let transformedData = [], correctAnswers = [], historyAnswers = {};

                transformDataAllQuestions(data.originData, transformedData);

                historyAnswers = data.detailData.reduce((acc, cur) => {
                    acc[String(cur['ma_cau_hoi'])] = cur['dap_an_chon'];

                    return acc;
                }, {});

                correctAnswers = data.correctAnswers.reduce((acc, cur) => {
                    acc[String(cur['ma_cau_hoi'])] = cur['ma_phuong_an'];

                    return acc;
                }, {});

                listHistories.classList.add('show');
                handleResult(historyAnswers, correctAnswers, transformedData, listHistories);
                
            })
            .catch(err => console.error(err))
    })
}

handleHistoryDetail();
handleAudioControl();