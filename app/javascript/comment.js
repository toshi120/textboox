function commentDisplay() {

const pullDownName = document.getElementsByClassName("student_name");
const pullDownNames = Array.from(pullDownName);

const pullDownComment = document.getElementsByClassName("progresses-list");
const pullDownComments = Array.from(pullDownComment);

const pullDownProgress = document.getElementsByClassName("progress-list");
const pullDownProgresses = Array.from(pullDownProgress);

for (let indexNum = 0; indexNum < pullDownNames.length; indexNum++) {
  pullDownNames[indexNum].addEventListener("click", function() {
    if (pullDownComments[indexNum].getAttribute("style") == "display:block;") {
      pullDownComments[indexNum].removeAttribute("style", "display:block;")      
    } else if (pullDownProgresses.length != 0) {
      pullDownComments[indexNum].setAttribute("style", "display:block;")
    }
  });
}

//チェックボックス（既読）
// const checkBox = document.getElementsByClassName("fa-square");

// checkBox.addEventListener("click", function() {
  
// })



}

window.addEventListener('load', commentDisplay)