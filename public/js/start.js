import loadQuestions, { state, countdown, handleAudioControl } from "./ajax/question.js";

const startBtn = document.querySelector('.start--btn button[name="start"]');
const finishBtn = document.querySelector('.start--btn button[name="finish"]');
const containerBoxquest = document.querySelector('.dotest__container--boxquest');
const resultInfomations = document.querySelector('.result--infomations');
const listResults = document.querySelector('.list--results');
const showResultBtn = document.querySelector('.show--result');
const totalPointLabels = document.querySelectorAll('.total--point');
const correctAnswersLabel = document.querySelectorAll('.correct--answer');
const percentLabel = document.querySelector('.percent');
const timeDidLabel = document.querySelector('.time--did');
const countTimeLabel = document.querySelector('.time--test .timer');
const restartBtn = document.querySelector('.restart--quiz');

let timer, startTime, endTime, onTime = true;

const transformDataAllQuestions = function(data, state) {
  data.forEach(qa => {
    const existingQa = state.transformedData.find(q => q.question === qa.cau_hoi && q.explain === qa.giai_thich);

    if (existingQa) {
      existingQa.answers[qa.ma_phuong_an] = qa.phuong_an;
    } else {
      state.transformedData.push({
        question: qa.cau_hoi,
        audioLink: qa.duong_dan,
        explain: qa.giai_thich,
        answers: {
          [qa.ma_phuong_an]: qa.phuong_an
        }
      })
    }
  })
}

const handleStyleCorrectAnswers = function (list) {
  const idsCorrect = Object.values(list);

  idsCorrect.forEach(id => {
    document.querySelector(`[data-id-anwser="${id}"]`).classList.add('correct');
  });
}

const handleStyleInCorrectAnswers = function (list) {
  const idsCorrect = Object.values(list);

  idsCorrect.forEach(id => {
    document.querySelector(`[data-id-anwser="${id}"]`).classList.add('incorrect');
  });
}

const handleCheckAnswered = function (list) {
  const idsCorrect = Object.values(list);

  idsCorrect.forEach(id => {
    document.querySelector(`label[data-id-anwser="${id}"] > input`).checked = true;
  });
}

const handleResult = function (state) {
  listResults.innerHTML = '';
  let html = '';

  state.transformedData.forEach(item => {
    let answers = '';

    const entriesAnswer = Object.entries(item.answers);

    for (const [id, answer] of entriesAnswer) {
      answers += `
          <li class="anwser--item">
            <label class="answer" for="anwser-${id}" data-id-anwser="${id}">
                <input type="radio" name="anws-${id}" id="anwser-${id}">
                ${answer}
            </label>
          </li>
      `;
    }

    html += `
           <li class="result--detail">
               <div class="ques">
                  <span>${item.question}</span>
                  ${item.audioLink ? `<span class="audio--btn">
                      <a href="../../public/audios/${item.audioLink}"></a>
                  </span>` : ''}
               </div>
               <ul class="anwsers--box">
                  ${answers}
               </ul>
               <div class="explaination">
                   <img src="../../public/imgs/lightbulb.png" alt="">
                   ${item.explain}
               </div>
           </li>
         `;
  })

  listResults.insertAdjacentHTML('beforeend', html);

  handleStyleCorrectAnswers(state.correctAnswers);
  handleStyleInCorrectAnswers(state.wrongAnswers);
  handleCheckAnswered(state.historyAnwsers);
}

const handleTimer = function (timeToDo) {
  let time = timeToDo;

  const tick = function () {
    displayTimeToDo(time);

    if (time === 0) {
      onTime = false;
      endTime = new Date().getTime();

      containerBoxquest.classList.remove('active');
      startBtn.classList.add('hide');
      finishBtn.classList.add('active');
      clearInterval(timer);
    }
    time--;
  }

  tick();
  timer = setInterval(tick, 1000);

  return timer;
}

const handleStartTimer = function(timeToDo) {
  startTime = new Date().getTime();

  containerBoxquest.classList.add('active');
  finishBtn.classList.add('active');
  if(timeToDo === 0) {
    countTimeLabel.classList.add('hide'); 
    return;
  }
  startBtn.classList.add('hide');

  if (timer) clearInterval(timer);
  timer = handleTimer(timeToDo);
}

const handleFinish = function (historyAnwsers, questionQuantity, correctAnswersChose, correctAnswers) {
  if (Object.keys(historyAnwsers).length < questionQuantity && onTime) {
    Swal.fire({
      title: 'Thông báo',
      text: 'Bạn chưa làm hết các câu hỏi!!',
      icon: 'warning',
      confirmButtonColor: '#4d5fff',
      iconColor: '#ffc003'
    });
    return;
  }

  if (!endTime) endTime = new Date().getTime();

  clearInterval(timer);

  startBtn.classList.add('hide');
  finishBtn.classList.remove('active');
  containerBoxquest.classList.add('active');
  containerBoxquest.classList.add('hide');
  resultInfomations.classList.add('active');

  displayInforResultsDid(questionQuantity, correctAnswersChose, correctAnswers)
}

const handleRestart = function () {
  location.reload();
}

const displayInforResultsDid = function(questionQuantity, correctAnswersChose, correctAnswers) {
  const correctChose = Object.keys(correctAnswersChose).length;
  const percent = (correctChose / Object.keys(correctAnswers).length) * 100;
  const hour = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 3600)}`.padStart(2, 0);
  const min = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 60)}`.padStart(2, 0);
  const sec = String(Math.floor((endTime - startTime) / 1000) % 60).padStart(2, 0);

  totalPointLabels.forEach(el => el.textContent = questionQuantity);
  correctAnswersLabel.forEach(el => el.textContent = correctChose);
  timeDidLabel.textContent = `${hour}:${min}:${sec}`;
  percentLabel.textContent = percent;
}

const displayTimeToDo = function(time) {
  const hour = `${Math.trunc(time / 3600)}`.padStart(2, 0);
  const min = `${Math.trunc(time % 3600 / 60)}`.padStart(2, 0);
  const sec = String(time % 60).padStart(2, 0);

  countdown.textContent = `${hour}:${min}:${sec}`;
}

const start = async function (state) {
  try {
    await loadQuestions(state.count);
    
    displayTimeToDo(state.timeToDo);
    transformDataAllQuestions(state.allQuestionsAnswers, state);

    state.timeToDo === 0 ? handleStartTimer(state.timeToDo) 
                         : startBtn.addEventListener('click', () => handleStartTimer(state.timeToDo));
    finishBtn.addEventListener('click', () => handleFinish(state.historyAnwsers, state.questionQuantity, 
                                                            state.correctAnswersChose, state.correctAnswers));
    showResultBtn.addEventListener('click', () => handleResult(state));   
    restartBtn.addEventListener('click', () => handleRestart());
    handleAudioControl();
  } catch (error) {
    console.error(error);
  }
}

start(state);