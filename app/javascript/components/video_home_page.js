console.log("start");

// # track event listener on scroll
// # each time event is on scroll run function to track the position
// #when position match interested area then replace the vid
function offset(el) {
  let rect = el.getBoundingClientRect(),
  scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
  scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  return { top: rect.top + scrollTop, left: rect.left + scrollLeft }
}

const sectionOne = offset(document.getElementById("one"));
const sectionTwo = offset(document.getElementById("two"));
const sectionThree = offset(document.getElementById("three"));

window.addEventListener('scroll', function(e) {

  let position = window.scrollY;
  console.log(position, sectionThree.top)

  if (window.scrollY == Math.round(sectionTwo.top)) {
    alert("entering 2")
  }

  if (window.scrollY == Math.round(sectionThree.top)) {
    alert("entering 3")
  }

  if (window.scrollY == Math.round(sectionOne.bottom)) {
    alert("entering 1")
  }
});
