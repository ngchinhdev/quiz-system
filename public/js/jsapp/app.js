import { loadExam } from "./ajax/exam.js";

const subNav = document.querySelector('.header__subnav');
const subNavBtn = document.querySelector('.toggle-nav');
const navLevelLinks = document.querySelectorAll('.nav__level--link');
const navTopicLinks = document.querySelector('.header__nav--topic');
const examContainer = document.querySelector('.exams__container');
const paginationContainer = document.querySelector('.exams__pagination');

loadExam(1, examContainer, paginationContainer);

subNavBtn.addEventListener('click', function (e) {
    e.preventDefault();
    
    subNavBtn.classList.toggle('active');
    subNav.classList.toggle('active');
});

const url = location.href.split('?')[0];

const linkTopics = {
    0: ['?page=list&type=test&topic=vocab&level=easy',
        '?page=list&type=test&topic=vocab&level=medium',
        '?page=list&type=test&topic=vocab&level=advance'],
    1: ['?page=list&type=test&topic=grammar&level=easy',
        '?page=list&type=test&topic=grammar&level=medium',
        '?page=list&type=test&topic=grammar&level=advance'],
    2: ['?page=list&type=test&topic=listening&level=easy',
        '?page=list&type=test&topic=listening&level=medium',
        '?page=list&type=test&topic=listening&level=advance'],
    3: ['?page=list&type=test&topic=reading&level=easy',
        '?page=list&type=test&topic=reading&level=medium',
        '?page=list&type=test&topic=reading&level=advance']
};

// Init link for topics nav
navLevelLinks.forEach((l, i) => {
    l.href = url.concat(linkTopics[0][i]);
});

// Add event mouseover for topics nav
navTopicLinks.addEventListener('mouseover', function(e) {
    const target = e.target.closest('.header__subnav--item');

    if(!target) return;

    const dataLink = +target.dataset.link; // 1, 2, 3, 4


    document.querySelectorAll('.header__subnav--item').forEach(el => el.classList.remove('active'));
    target.classList.add('active');

    navLevelLinks.forEach((l, i) => {
        l.href = url.concat(linkTopics[dataLink][i]);
    });
})

