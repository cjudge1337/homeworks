const Router = require('./router.js');

document.addEventListener("DOMContentLoaded", () => {

  document.querySelectorAll(".sidebar-nav li").forEach( (li) => {
    li.addEventListener("click", () => {
      const location = li.innerText;
      location.toLowerCase();
      window.location.hash = location;
    });
  });
  const node = document.querySelector(".content");
  const router = new Router(node);
  router.start();

});
