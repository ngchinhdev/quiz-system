import loadQuestions, { state, historySendData, countdown, handleAudioControl } from "./ajax/question.js";
import { transformDataAllQuestions, handleResult } from "./result.js";

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

historySendData.historyAnswers = state.historyAnswers;

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

const handleFinish = function (historyAnswers, questionQuantity, correctAnswersChose, correctAnswers) {
  if (Object.keys(historyAnswers).length < questionQuantity && onTime) {
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

  console.log(historySendData);

  startBtn.classList.add('hide');
  finishBtn.classList.remove('active');
  containerBoxquest.classList.add('active');
  containerBoxquest.classList.add('hide');
  resultInfomations.classList.add('active');

  displayInforResultsDid(questionQuantity, correctAnswersChose, correctAnswers);

  // SEND DATA TO SERVER
  fetch('../controllers/historyController.php', {
    method: 'POST',
    body: JSON.stringify(historySendData),
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then(res => res.json())
  .then(data => {
    console.log(data);
  })
  .catch(err => {
    console.error(err);
  })
}

const handleRestart = function () {
  location.reload();
}

const displayInforResultsDid = function(questionQuantity, correctAnswersChose, correctAnswers) {
  const correctPoints = Object.keys(correctAnswersChose).length;
  const percent = (correctPoints / Object.keys(correctAnswers).length) * 100;
  const hour = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 3600)}`.padStart(2, 0);
  const min = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 60)}`.padStart(2, 0);
  const sec = String(Math.floor((endTime - startTime) / 1000) % 60).padStart(2, 0);

  historySendData.correctPoints = correctPoints;
  historySendData.timeDid = Math.floor((endTime - startTime) / 1000);

  totalPointLabels.forEach(el => el.textContent = questionQuantity);
  correctAnswersLabel.forEach(el => el.textContent = correctPoints);
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
    transformDataAllQuestions(state.allQuestionsAnswers, state.transformedData);

    state.timeToDo === 0 ? handleStartTimer(state.timeToDo) 
                         : startBtn.addEventListener('click', () => handleStartTimer(state.timeToDo));
    finishBtn.addEventListener('click', () => handleFinish(state.historyAnswers, state.questionQuantity, 
                                                            state.correctAnswersChose, state.correctAnswers));
    showResultBtn.addEventListener('click', () => handleResult(state.historyAnswers, state.correctAnswers,
                                                                state.transformedData, listResults));   
    restartBtn.addEventListener('click', () => handleRestart());
    handleAudioControl();
  } catch (error) {
    console.error(error);
  }
}

start(state);