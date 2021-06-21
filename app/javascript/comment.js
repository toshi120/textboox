function commentDisplay() {
// console.log("イベント発火")
const pullDownName = document.getElementsByClassName("student_name");
const pullDownNames = Array.from(pullDownComment);

pullDownNames.forEach(function(student_name) {
  student_name.addEventListener("click", function() {
    console.log("イベント発火")
  })
});

// PullDownComment.addEventListener("click", function() {
//   console.log("イベント発火")
// });

}

window.addEventListener('load', commentDisplay)