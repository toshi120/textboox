function commentDisplay() {
// console.log("イベント発火")
const pullDownComment = document.getElementsByClassName("student_name");
const pullDownComments = Array.from(pullDownComment);

pullDownComments.forEach(function(student_name) {
  student_name.addEventListener("click", function() {
    console.log("イベント発火")
  })
});

// PullDownComment.addEventListener("click", function() {
//   console.log("イベント発火")
// });

}

window.addEventListener('load', commentDisplay)