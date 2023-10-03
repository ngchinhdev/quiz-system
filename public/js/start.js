const startBtn = document.querySelector('.start--btn button');

let timer;

const handleTimer = function() {
    let time = 10;
  
    const tick = function () {
      const min = `${Math.trunc(time / 60)}`.padStart(2, 0);
      const sec = String(time % 60).padStart(2, 0);
  
      if (time === 0) {
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
    console.log('ji');
    if(timer) clearInterval(timer);
    timer = handleTimer();
})