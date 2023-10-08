const containerQuestion = document.querySelector('.dotest__container--boxquest');
const rule = document.querySelector('.rule-1');
export const countdown = document.querySelector('.down');

// History anwser chose
export const state = {
    count: 1,
    questionQuantity: 0,
    timeToDo: 0,
    historyAnwsers: {},
    dataQuestions: [],
    dataAnswers: [],
    allQuestionsAnswers: [],
    correctAnswers: [],
    wrongAnswers: {},
    correctAnswersChose: {},
    transformedData: []
};

export function handleAudioControl() {
    document.querySelector('.dotest__container').addEventListener('click', (e) => {
        const btn = e.target.closest('.audio--btn');

        if (!btn) return;

        e.preventDefault();
        console.log(btn);
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


function generateQuestion(dataQuestions, questionQuantity, audioLink) {
    const html = `
            <div class="number--ques">Câu
                <strong>${state.count}</strong> trên <strong>${questionQuantity}</strong>
            </div>
            <div class="ques" data-ques=${dataQuestions.ma_cau_hoi}>
                <span>${dataQuestions.noi_dung}</span>
                ${audioLink ? `<span class="audio--btn">
                    <a href="../../public/audios/${audioLink}"></a>
                </span>` : ''}
            </div>
        `;

    containerQuestion.insertAdjacentHTML('beforeend', html);
}

function answerChoice(state) {
    const anwsersBox = document.querySelector('.anwsers--box');

    anwsersBox.addEventListener('click', function (e) {
        const curQuestion = containerQuestion.querySelector('.ques');
        const anwser = e.target.closest('.answer');

        if (!anwser || !curQuestion) return;

        const idQues = curQuestion.dataset.ques;

        state.historyAnwsers[idQues] = anwser.dataset.choose;

        const currActive = document.querySelector('.answer.active') ?? null;
        currActive && currActive.classList.remove('active');
        anwser.classList.add('active');

        // Check if anwser not true
        for (const question in state.historyAnwsers) {
            if (state.correctAnswers[question] !== state.historyAnwsers[question])
                state.wrongAnswers[question] = state.historyAnwsers[question];
        }
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
    const answered = isFound && 
            document.querySelector(`[data-choose="${state.historyAnwsers[dataQuestions.ma_cau_hoi]}"]`);
    answered && answered.classList.add('active');
    answered && answered.click();

    answerChoice(state);
}

function generateButtonsControl(questionQuantity) {
    const html = `
            <button class="move--ques prev">Prev</button>
            <button class="move--ques next">Next</button>
        `;

    containerQuestion.insertAdjacentHTML('beforeend', html);

    document.querySelector('.move--ques.next')
            .addEventListener('click', () => {
                state.count = state.count > questionQuantity - 1 ? 1 : state.count + 1;
                loadQuestions(state.count);
            });
    document.querySelector('.move--ques.prev')
            .addEventListener('click', () => {
                state.count = state.count < 2 ? questionQuantity : state.count - 1;
                loadQuestions(state.count);
            });
}

const loadQuestions = async function(question) {
    try {
        const url = new URL(window.location.href);
        const subUrl = window.location.href.slice(window.location.href.indexOf('?'));
        const idExam = url.searchParams.get('examId');

        const res = await fetch(`../controllers/questionController.php${subUrl}&examId=${idExam}&curpage=${question}`);
        const data = await res.json();

        const { dataQuestions, dataAnswers, questionQuantity, timeToDo,
            correctAnswers, audioLink, allQuestionsAnswers } = data;

        state.questionQuantity = questionQuantity;
        state.dataAnswers = dataAnswers;
        state.dataQuestions = dataQuestions;
        state.allQuestionsAnswers = allQuestionsAnswers;
        state.timeToDo = timeToDo;

        const newCorrectAnswer = correctAnswers.reduce((acc, cur) => {
            const key = String(cur.ma_cau_hoi);
            const value = String(cur.ma_phuong_an);

            acc[key] = value;

            return acc;
        }, {});

        state.correctAnswers = newCorrectAnswer;

        const correctAnswersChose = {};
        for (const question in state.historyAnwsers) {
            if (newCorrectAnswer[question] == state.historyAnwsers[question])
                correctAnswersChose[question] = state.historyAnwsers[question];
        }

        state.correctAnswersChose = correctAnswersChose;

        containerQuestion.innerHTML = '';

        rule.textContent = questionQuantity;
        countdown.textContent = timeToDo;

        generateQuestion(dataQuestions, questionQuantity, audioLink);
        generateAnswers(dataAnswers, dataQuestions);
        generateButtonsControl(questionQuantity);
    } catch (error) {
        console.error(error);
    }
}

export default loadQuestions;
