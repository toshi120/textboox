function commentDisplay() {
// console.log("イベント発火")
const pullDownName = document.getElementsByClassName("student_name");
const pullDownNames = Array.from(pullDownName);

const pullDownComment = document.getElementsByClassName("progresses-list");
const pullDownComments = Array.from(pullDownComment);
console.log(pullDownComments);

// let x = 0
// pullDownNames[x].addEventListener("click", function() {
//   pullDownComments[x].setAttribute("style", "display:block");
// })

// pullDownNames[1].addEventListener("click", function() {
//   pullDownComments[1].setAttribute("style", "display:block");
// })

for (let indexNum = 0; indexNum < pullDownNames.length; indexNum++) {
  pullDownNames[indexNum].addEventListener("click", function() {
    pullDownComments[indexNum].setAttribute("style", "display:block");
  });
}


}

window.addEventListener('load', commentDisplay)