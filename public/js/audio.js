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