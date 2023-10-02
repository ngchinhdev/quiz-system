window.addEventListener('load', function() {
    const target = document.querySelector('.timer');
    const targetScrollPosition = target.getBoundingClientRect();

    window.scrollTo(0, targetScrollPosition.top - 60);
})

const anwsersBox = document.querySelector('.anwsers--box');
anwsersBox.addEventListener('click', function(e) {
    const anwser = e.target.closest('.answer');

    if(!anwser) return;

    const currActive = document.querySelector('.answer.active') ?? null;
    currActive && currActive.classList.remove('active');
    anwser.classList.add('active');
})