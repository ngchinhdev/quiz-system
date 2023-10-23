export const transformDataAllQuestions = function (data, transformedData) {
    data.forEach(qa => {
        const existingQa = transformedData.find(q => q.question === qa.cau_hoi && q.explain === qa.giai_thich);

        if (existingQa) {
            existingQa.answers[qa.ma_phuong_an] = qa.phuong_an;
        } else {
            transformedData.push({
                question: qa.cau_hoi,
                audioLink: qa.duong_dan,
                explain: qa.giai_thich,
                answers: {
                    [qa.ma_phuong_an]: qa.phuong_an
                }
            })
        }
    })
}

const handleStyleCorrectAnswers = function (list) {
    const idsCorrect = Object.values(list);

    idsCorrect.forEach(id => {
        document.querySelector(`[data-id-anwser="${id}"]`).classList.add('correct');
    });
}

const handleStyleInCorrectAnswers = function (list) {
    const idsInCorrect = Object.values(list);

    idsInCorrect.forEach(id => {
        document.querySelector(`[data-id-anwser="${id}"]`).classList.add('incorrect');
    });
}

const handleCheckAnswered = function (list) {
    const idsChose = Object.values(list);

    idsChose.forEach(id => {
        document.querySelector(`label[data-id-anwser="${id}"] > input`).checked = true;
    });
}

export const handleResult = function (historyAnswers, correctAnswers, transformedData, listResults) {
    listResults.innerHTML = '';
    let html = '';

    transformedData.forEach(item => {
        let answers = '';

        const entriesAnswer = Object.entries(item.answers);

        for (const [id, answer] of entriesAnswer) {
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
                    <span>${item.question}</span>
                    ${item.audioLink ? `<span class="audio--btn">
                        <a href="../../public/audios/${item.audioLink}"></a>
                    </span>` : ''}
                 </div>
                 <ul class="anwsers--box">
                    ${answers}
                 </ul>
                 <div class="explaination">
                     <img src="../../public/imgs/lightbulb.png" alt="">
                     ${item.explain}
                 </div>
             </li>
           `;
    })
    listResults.insertAdjacentHTML('beforeend', html);

    handleStyleInCorrectAnswers(historyAnswers);
    handleStyleCorrectAnswers(correctAnswers);
    handleCheckAnswered(historyAnswers);
}
