const startBtn = document.querySelector('.start--btn button');
const containerBoxquest = document.querySelector('.dotest__container--boxquest');

let timer;

const handleTimer = function() {
    let time = 10;
  
    const tick = function () {
      const min = `${Math.trunc(time / 60)}`.padStart(2, 0);
      const sec = String(time % 60).padStart(2, 0);
  
      if (time === 0) {
        containerBoxquest.classList.remove('active');
        startBtn.textContent = 'Kết thúc bài làm';
        clearInterval(timer);
      }
  
      time--;
  
      countdown.textContent = `${min}:${sec}`;
    }
  
    tick();
    timer = setInterval(tick, 1000);
  
    return timer;
  }

startBtn.addEventListener('click', function() {
    containerBoxquest.classList.add('active');
    console.log('ji');
    if(timer) clearInterval(timer);
    timer = handleTimer();
})