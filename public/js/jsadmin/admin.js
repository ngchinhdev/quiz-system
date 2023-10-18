const container = document.querySelector(".container");
const toggleUl = document.querySelectorAll('.ctg-prod');
const arrowRotate = document.querySelectorAll('.fa-chevron-right');
const sidebarLinks = document.querySelectorAll('.sidebar_menu > li > a');
const ctgProdLinks = document.querySelectorAll("aside .ctg-prod > li a");

// Handle sidebar menu clicks
for (let i = 0; i < sidebarLinks.length; i++) {
    sidebarLinks[i].addEventListener("click", function (e) {
        e.preventDefault();
        const activeSidebarItem = document.querySelector('.sidebar_menu > li.active');
        activeSidebarItem.classList.remove('active');
        this.parentNode.classList.add('active');

        if (this.parentNode.classList.contains('toggle')) {
            for (let j = 0; j < toggleUl.length; j++) {
                toggleUl[j].classList.toggle('active');
                arrowRotate[j].classList.toggle('rotate');
            }
        } else {
            for (let k = 0; k < toggleUl.length; k++) {
                toggleUl[k].classList.remove('active');
            }
        }
    });
}

// Handle category product clicks
for (let l = 0; l < ctgProdLinks.length; l++) {
    ctgProdLinks[l].addEventListener("click", function (e) {
        e.preventDefault();
        const activeCtgProdItem = document.querySelector('aside .ctg-prod > li.active');
        activeCtgProdItem.classList.remove('active');
        this.parentNode.classList.add('active');
    });
}

////////////////////////////////////////////////
// Admin add exam
const inputChecks = document.querySelectorAll('.inp');
const errLabel = document.querySelector('.err');
const form = document.querySelector('form');

function validateRadioButtons() {
    const questions = document.querySelectorAll('.questions__row .col');
    const timeInput = document.querySelector('.time-add');

    for (let i = 0; i < questions.length; i++) {
        const radioButtons = questions[i].querySelectorAll('input[type="radio"]');
        let isRadioChecked = false;

        for (let j = 0; j < radioButtons.length; j++) {
            if (radioButtons[j].checked) {
                isRadioChecked = true;
                break;
            }
        }

        if (!isRadioChecked) return false;
    }

    if(isNaN(Number(timeInput.value))) {
        return false;
    } 

    return true;
}

form && inputChecks && errLabel && form.addEventListener('submit', (e) => {
    inputChecks.forEach(inp => {
        if(inp.value === '' || !validateRadioButtons()) {
            e.preventDefault();
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
            errLabel.textContent = 'Vui lòng nhập đầy đủ và chính xác các trường!';
            errLabel.classList.add('active');
            return;
        }
    })
})

///////////////////////////////////////////////
// Confirm delete action


