function commentDisplay() {
// console.log("イベント発火")
const pullDownName = document.getElementsByClassName("student_name");
const pullDownNames = Array.from(pullDownName);

const pullDownComment = document.getElementsByClassName("progresses-list");
const pullDownComments = Array.from(pullDownComment);
console.log(pullDownComments);

for (let indexNum = 0; indexNum < pullDownNames.length; indexNum++) {
  pullDownNames[indexNum].addEventListener("click", function() {
    if (pullDownComments[indexNum].getAttribute("style") == "display:block;") {
      pullDownComments[indexNum].removeAttribute("style", "display:block;")      
    } else {
      debugger
    pullDownComments[indexNum].setAttribute("style", "display:block;")
    }
  });
}


}

window.addEventListener('load', commentDisplay)