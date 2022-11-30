function valider() {
        const answers = document.querySelectorAll('.answer');
        var results = new Array();

        for (let i = 0; i <= 9; i++) {
                if (answers[i].checked) {
                        newResults = results.push(1);
                } else {
                        newResults = results.push(2);
                }
        }
        console.log(results);
        let correct = 0;
        let incorrect = 0;

        results.forEach(e => {
                if (e === 1)
                        correct += 1;
                else if (e === 2)
                        incorrect += 1;
        })
    const json = {
        "0": "Quel est le nom du Titan de Bertholdt ?",
        "1": "Quel était le nom du Caporal du Bataillon d'exploration ?",
        "2": "Le titan Bestial a un lien familial avec qui ?",
        "3": "Dans quel enceinte se trouve la maison d'Eren ?",
        "4": "Qui est de lignée royale ?",
 
    };
    document.write(`<link rel="stylesheet" type="text/css" href="index.css">`);
        document.write(`Correction<br><br>`);
        for (let i = 0; i <= results.length - 1; i++) {
                document.write(` ${json[i]} <li>La réponse est ${results[i] == 1 ? 'correct' : 'incorrect'}</li>` + "<br>");
        }
        document.write(`${correct} bonnes réponses <br>${incorrect} mauvaises réponses <br>Score final : ${correct}/${answers.length} => ${correct/10*100}% de bonnes réponses`);
   }
