const subNav = document.querySelector('.header__subnav');
const subNavBtn = document.querySelector('.toggle-nav');
const navLevelLinks = document.querySelectorAll('.nav__level--link');

subNavBtn.addEventListener('click', function (e) {
    e.preventDefault();
    
    subNavBtn.classList.toggle('active');
    subNav.classList.toggle('active');
})

subNav.addEventListener('mouseover', function (e) {
    const target = e.target.closest('.header__subnav--item');

    if (!target) return;
    const link = ['https://www.youtube.com', 'https://www.facebook.com/', 'https://www.instagram.com/'];

    const dataLink = +target.dataset.link;

    navLevelLinks.forEach((l, i) => {
        l.href = link[i];
    });
})