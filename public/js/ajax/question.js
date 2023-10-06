const containerQuestion = document.querySelector('.dotest__container--boxquest');
const rule = document.querySelector('.rule-1');
export const countdown = document.querySelector('.down');

// History anwser chose
export const state = {
    questionQuantity: 0,
    timeToDo: 0,
    historyAnwsers: {},
    dataQuestions: [],
    dataAnswers: [],
    allQuestionsAnswers: [],
    correctAnswers: [],
    wrongAnswers: {},
    correctAnswersChose: {}
};

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

        state.historyAnwsers[idQues] = anwser.dataset.choose;
        console.log("History answer: ", state.historyAnwsers);

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

    const isFound = state.historyAnwsers[dataQuestions.ma_cau_hoi];
    const answered = isFound && document.querySelector(`[data-choose="${state.historyAnwsers[dataQuestions.ma_cau_hoi]}"]`);
    answered && answered.classList.add('active');
    answered && answered.click();

    answerChoice();
}

function generateButtonQuestion(questionQuantity) {
    const next = count > questionQuantity - 1 ? 1 : count + 1;
    const prev = count < 2 ? questionQuantity : count - 1;

    const html = `
            <button class="move--ques prev">Prev</button>
            <button class="move--ques next">Next</button>
        `;

    containerQuestion.insertAdjacentHTML('beforeend', html);

    const nextQues = document.querySelector('.move--ques.next');
    const prevQues = document.querySelector('.move--ques.prev');

    nextQues.addEventListener('click', () => loadQuestions(next));
    prevQues.addEventListener('click', () => loadQuestions(prev));
}

function loadQuestions(question) {
    const url = new URL(window.location.href);
    const subUrl = window.location.href.slice(window.location.href.indexOf('?'));
    const idExam = url.searchParams.get('id');

    fetch(`../controllers/questionController.php${subUrl}&id=${idExam}&curpage=${question}`)
        .then(res => res.json())
        .then(data => {

            console.log(data);
            
            const { dataQuestions, dataAnswers, questionQuantity, timeToDo, 
                        correctAnswers, audioLink, allQuestionsAnswers } = data;

            state.questionQuantity = questionQuantity;
            state.dataAnswers = dataAnswers;
            state.dataQuestions = dataQuestions;
            state.allQuestionsAnswers = allQuestionsAnswers;
            
            console.log(state.allQuestionsAnswers);

            const newCorrectAnswer = correctAnswers.reduce((acc, cur) => {
                const key = String(cur.ma_cau_hoi);
                const value = String(cur.ma_phuong_an);

                acc[key] = value;

                return acc;
            }, {});
            
            console.log("Correct answer: ", newCorrectAnswer);
            state.correctAnswers = newCorrectAnswer;

            // Check if anwser not true
            const wrongAnswers = {};
            for(const question in state.historyAnwsers) {
                if(newCorrectAnswer[question] !== state.historyAnwsers[question])
                    wrongAnswers[question] = state.historyAnwsers[question];
            }

            const correctAnswersChose = {};
            for(const question in state.historyAnwsers) {
                if(newCorrectAnswer[question] == state.historyAnwsers[question])
                    correctAnswersChose[question] = state.historyAnwsers[question];
            }

            console.log("Wrong answer: ", wrongAnswers);
            console.log("correctAnswersChose: ", correctAnswersChose);
            state.wrongAnswers = wrongAnswers;
            state.correctAnswersChose = correctAnswersChose;
            
            containerQuestion.innerHTML = '';

            rule.textContent = questionQuantity;
            countdown.textContent = timeToDo;

            generateQuestion(dataQuestions, questionQuantity, audioLink);
            generateAnswers(dataAnswers, dataQuestions);
            generateButtonQuestion(questionQuantity);
        })
        .catch(error => {
            console.error(error);
        });

        count = question;
}

export default loadQuestions;
