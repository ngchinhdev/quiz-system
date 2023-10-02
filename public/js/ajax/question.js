const containerQuestion = document.querySelector('.dotest__container--boxquest');
// History anwser chose
const historyAnwsers = {};

let count = 1;

function generateAudio() {
    const btnAudio = document.querySelector('.audio--btn');

    btnAudio.addEventListener('click', function(e) {
        e.preventDefault();
        const audioLink = btnAudio.querySelector('a').href;
        
        const audio = new Audio();
    
        audio.src = audioLink;
    
        if(audio.paused) {
            audio.play();
        } else {
            audio.pause();
            audio.currentTime = 0;
        }
    })
}

function generateQuestion(dataQuestions, questionQuantity, audioLink) {
    const html = `
            <div class="number--ques">Câu
                <strong>${count}</strong> trên <strong>${questionQuantity}</strong>
            </div>
            <div class="ques" data-ques=${dataQuestions.ma_cau_hoi}>
                <span>${dataQuestions.noi_dung}</span>
                ${audioLink ? `<span class="audio--btn">
                    <a href="../../public/audios/${audioLink}"></a>
                </span>` : ''}
            </div>
        `;

    containerQuestion.insertAdjacentHTML('beforeend', html);

    audioLink && generateAudio();
}

function answerChoice() {
    const anwsersBox = document.querySelector('.anwsers--box');
    anwsersBox.addEventListener('click', function (e) {
        const curQuestion = containerQuestion.querySelector('.ques');
        const anwser = e.target.closest('.answer');

        if (!anwser || !curQuestion) return;

        const idQues = curQuestion.dataset.ques;

        historyAnwsers[idQues] = anwser.dataset.choose;

        const currActive = document.querySelector('.answer.active') ?? null;
        currActive && currActive.classList.remove('active');
        anwser.classList.add('active');
    })
}

function generateAnswers(dataAnswers, dataQuestions) {
    const answerContainer = document.createElement('ul');
    answerContainer.setAttribute('class', 'anwsers--box');
    
    containerQuestion.insertAdjacentElement('beforeend', answerContainer);

    let html = '';

    dataAnswers.forEach((answer, index) => {
        html += `
                <li class="anwser--item">
                    <label class="answer" for="anwser-${index}" data-choose="${answer.ma_phuong_an}">
                        <input type="radio" name="anws" id="anwser-${index}">
                        ${answer.noi_dung}
                    </label>
                </li>
            `;
    });
    
    answerContainer.innerHTML = html;

    const isFound = historyAnwsers[dataQuestions.ma_cau_hoi];
    const answered = isFound && document.querySelector(`[data-choose="${historyAnwsers[dataQuestions.ma_cau_hoi]}"]`);
    answered && answered.classList.add('active');
    answered && answered.click();

    answerChoice();
}

function generateButtonQuestion(questionQuantity) {
    const next = count > questionQuantity - 1 ? 1 : count + 1;
    const prev = count < 2 ? questionQuantity : count - 1;

    const html = `
            <button class="move--ques prev" onclick=loadQuestions(${prev})>Prev</button>
            <button class="move--ques next" onclick=loadQuestions(${next})>Next</button>
        `;

    containerQuestion.insertAdjacentHTML('beforeend', html);
}

function loadQuestions(question) {
    const url = new URL(window.location.href);
    const subUrl = window.location.href.slice(window.location.href.indexOf('?'));
    const idExam = url.searchParams.get('id');

    fetch(`../controllers/questionController.php${subUrl}&id=${idExam}&curpage=${question}`)
        .then(res => res.json())
        .then(data => {

            const { dataQuestions, dataAnswers, questionQuantity, audioLink } = data;

            containerQuestion.innerHTML = '';

            generateQuestion(dataQuestions, questionQuantity, audioLink);
            generateAnswers(dataAnswers, dataQuestions);
            generateButtonQuestion(questionQuantity);
        })
        .catch(error => {
            console.error(error);
        });

        count = question;
}

loadQuestions(1);
