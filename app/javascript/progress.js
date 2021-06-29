const { $ } = require("@rails/ujs");

function progressDisplay() {

const progressBtn = document.querySelector('.progress-btn');
const progressForm = document.querySelector('.progress-form-box');

progressBtn.addEventListener('click', function() {
  if (progressForm.getAttribute("style") == "display:block;") {
    progressForm.removeAttribute("style", "display:block;")      
  } else {
    progressForm.setAttribute("style", "display:block;")
  };
})






}

window.addEventListener('load', progressDisplay)