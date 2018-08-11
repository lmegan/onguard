import "bootstrap";

// import "../components/video_home_page"


function offset(el) {
  let rect = el.getBoundingClientRect(),
  scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
  scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  return { top: rect.top + scrollTop, left: rect.left + scrollLeft }
}

const sectionOne = offset(document.getElementById("one"));
const sectionTwo = offset(document.getElementById("two"));
const sectionThree = offset(document.getElementById("three"));
console.log(Math.round(sectionTwo.top))

window.addEventListener('scroll', () => {


  if (window.scrollY == Math.round(sectionTwo.top)) {
    console.log("entering 2")
  }


});

import flatpickr from "flatpickr";

$('#my-modal').modal()

