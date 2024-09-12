const navitems = document.querySelectorAll(".nav-item");

const sections =document.querySelectorAll("section");

navitems.forEach((navitem, index) => {
    navitem.addEventListener("click", (e) => {
        e.preventDefault();

    });
});