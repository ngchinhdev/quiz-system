var container = document.querySelector(".container");
var toggleUl = document.querySelectorAll('.ctg-prod');
var arrowRotate = document.querySelectorAll('.fa-chevron-right');
var sidebarLinks = document.querySelectorAll('.sidebar_menu > li > a');
var ctgProdLinks = document.querySelectorAll("aside .ctg-prod > li a");

// Handle sidebar menu clicks
for (var i = 0; i < sidebarLinks.length; i++) {
    sidebarLinks[i].addEventListener("click", function (e) {
        e.preventDefault();
        var activeSidebarItem = document.querySelector('.sidebar_menu > li.active');
        activeSidebarItem.classList.remove('active');
        this.parentNode.classList.add('active');

        if (this.parentNode.classList.contains('toggle')) {
            for (var j = 0; j < toggleUl.length; j++) {
                toggleUl[j].classList.toggle('active');
                arrowRotate[j].classList.toggle('rotate');
            }
        } else {
            for (var k = 0; k < toggleUl.length; k++) {
                toggleUl[k].classList.remove('active');
            }
        }
    });
}

// Handle category product clicks
for (var l = 0; l < ctgProdLinks.length; l++) {
    ctgProdLinks[l].addEventListener("click", function (e) {
        e.preventDefault();
        var activeCtgProdItem = document.querySelector('aside .ctg-prod > li.active');
        activeCtgProdItem.classList.remove('active');
        this.parentNode.classList.add('active');

        var href = this.getAttribute("href");
        var cateId = href.split("?cate=")[1];
        document.cookie = "cateId=" + cateId + "; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        document.cookie = "cateId=" + cateId + "; expires=Thu, 31 Dec 2037 23:59:59 UTC; path=/;";
    });
}