const scrollTopBtn = document.getElementById("scrollTopBtn");

window.onscroll = function () {
    if (document.documentElement.scrollTop > 200) {
        scrollTopBtn.classList.add("show");
    } else {
        scrollTopBtn.classList.remove("show");
    }
};

scrollTopBtn.onclick = function () {
    window.scrollTo({ top: 0, behavior: "smooth" });
};

