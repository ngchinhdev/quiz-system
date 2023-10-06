import loadQuestions, { state, countdown } from "./ajax/question.js";

const startBtn = document.querySelector('.start--btn button[name="start"]');
const finishBtn = document.querySelector('.start--btn button[name="finish"]');
const containerBoxquest = document.querySelector('.dotest__container--boxquest');
const resultInfomations = document.querySelector('.result--infomations');
const listResults = document.querySelector('.list--results');
const showResultBtn = document.querySelector('.show--result');
const totalPoints = document.querySelectorAll('.total--point');
const correctAnswersLabel = document.querySelectorAll('.correct--answer');
const percentLabel = document.querySelector('.percent');
const timeDidLabel = document.querySelector('.time--did');
const restartBtn = document.querySelector('.restart--quiz');

let timer, startTime = 0, endTime = 0, onTime = true;

loadQuestions(1);

const transformedData = [];

setTimeout(() => {

  state.allQuestionsAnswers.forEach(qa => {
    const existingQa = transformedData.find(q => q.question === qa.cau_hoi && q.explain === qa.giai_thich);

    if(existingQa) {
      existingQa.answers[qa.ma_phuong_an] = (qa.phuong_an);
    } else {
      transformedData.push({
        question: qa.cau_hoi,
        explain: qa.giai_thich,
        answers: {
          [qa.ma_phuong_an] : qa.phuong_an
        }
      })
    }
  })

  console.log(transformedData);

}, 3000)



const handleFinish = function() {
  if(Object.keys(state.historyAnwsers).length < state.questionQuantity && onTime) {
    Swal.fire({
      title: 'Thông báo',
      text: 'Bạn chưa làm hết các câu hỏi!!',
      icon: 'warning',
      confirmButtonColor: '#4d5fff',
      iconColor: '#ffc003'
    });
    return;
  }

  endTime = new Date().getTime();

  finishBtn.classList.remove('active');

  clearInterval(timer);
  containerBoxquest.classList.add('active');
  containerBoxquest.classList.add('hide');
  resultInfomations.classList.add('active');

  const correctChose = Object.keys(state.correctAnswersChose).length;
  const percent = (correctChose / Object.keys(state.correctAnswers).length) * 100;
  const hour = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 3600)}`.padStart(2, 0);
  const min = `${Math.trunc(Math.floor((endTime - startTime) / 1000) / 60)}`.padStart(2, 0);
  const sec = String(Math.floor((endTime - startTime) / 1000) % 60).padStart(2, 0);
  
  totalPoints.forEach(el => el.textContent = state.questionQuantity);
  correctAnswersLabel.forEach(el => el.textContent = correctChose);
  timeDidLabel.textContent = `${hour}:${min}:${sec}`;
  percentLabel.textContent = percent;

  console.log(Object.keys(state.wrongAnswers).length === 0 ? 10 : Object.keys(state.wrongAnswers).length);
}

finishBtn.addEventListener('click', () => handleFinish());


// const restartQuiz = function() {
//   startBtn.classList.remove('hide');
//   containerBoxquest.classList.remove('active');
//   containerBoxquest.classList.remove('hide');
//   resultInfomations.classList.remove('active');
//   loadQuestions(1);
// }
// restartBtn.addEventListener('click', () => restartQuiz());

const handleStyleCorrectAnswers = function(list) {
  const idsCorrect = Object.values(list);

  console.log(idsCorrect);
  
  idsCorrect.forEach(id => {
    document.querySelector(`[data-id-anwser="${id}"]`).classList.add('correct');
  });
}

const handleStyleInCorrectAnswers = function(list) {
  const idsCorrect = Object.values(list);

  console.log(idsCorrect);
  
  idsCorrect.forEach(id => {
    document.querySelector(`[data-id-anwser="${id}"]`).classList.add('incorrect');
  });
}

const handleCheckAnswered = function(list) {
  const idsCorrect = Object.values(list);

  console.log(idsCorrect);
  
  idsCorrect.forEach(id => {
    document.querySelector(`label[data-id-anwser="${id}"] > input`).checked =  true;
  });
}


const handleResult = function() {
  listResults.innerHTML = '';
  let html = '';

  console.log(transformedData);

  transformedData.forEach(item => {
    let answers = '';

    const entriesAnswer = Object.entries(item.answers);

    for(const [id, answer] of entriesAnswer) {
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
                   ${item.question}
               </div>
               <ul class="anwsers--box">
                  ${ answers }
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

showResultBtn.addEventListener('click', () => handleResult());

const handleTimer = function() {
    let time = 10;
  
    const tick = function () {
      const hour = `${Math.trunc(time / 3600)}`.padStart(2, 0);
      const min = `${Math.trunc(time % 3600 / 60)}`.padStart(2, 0);
      const sec = String(time % 60).padStart(2, 0);
  
      if (time === 0) {
        onTime = false;

        containerBoxquest.classList.remove('active');
        startBtn.classList.add('hide');
        finishBtn.classList.add('active');
        clearInterval(timer);
      }
  
      time--;
  
      countdown.textContent = `${hour}:${min}:${sec}`;
    }
  
    tick();
    timer = setInterval(tick, 1000);
  
    return timer;
  }

startBtn.addEventListener('click', function() {
    startTime = new Date().getTime();

    containerBoxquest.classList.add('active');
    startBtn.classList.add('hide');
    finishBtn.classList.add('active');

    if(timer) clearInterval(timer);
    timer = handleTimer();
})