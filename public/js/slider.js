const slides = document.querySelectorAll('.slide')
const btnNextSLide = document.querySelector('.slider__btn--right')
const btnPrevSLide = document.querySelector('.slider__btn--left')

const slider = function() {
    let curSlide = 0;
    const maxSLide = slides.length - 1;
    
    const moveSLide = function(slide) {
      slides.forEach((s, i) => s.style.transform = `translateX(${(i - slide) * 100}%)`);
    }
    
    const handleNextSLide = function() {
      curSlide === maxSLide ? curSlide = 0 : curSlide++;
    
      moveSLide(curSlide);
    }
    
    const handlePrevSLide = function() {
      curSlide === 0 ? curSlide = maxSLide : curSlide--;
    
      moveSLide(curSlide);
    }

    btnNextSLide.addEventListener('click', handleNextSLide);
    btnPrevSLide.addEventListener('click', handlePrevSLide);

    moveSLide(0);
}

slider();