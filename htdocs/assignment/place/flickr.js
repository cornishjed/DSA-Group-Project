const f_modal = document.querySelector('.f_modal');
const previews = document.querySelectorAll(".gallery img");
const original = document.querySelector(".full-img");
const caption = document.querySelector(".caption");

previews.forEach((preview) => {
    preview.addEventListener("click", () => {
        f_modal.classList.add("open");
        original.classList.add("open");
        //Dynamic aspect
        const originalSrc = preview.getAttribute("data-original");
        original.src = originalSrc;
        const altText = preview.alt;
        caption.textContent = altText;
    });
});
f_modal.addEventListener("click", (e) => {
    if (e.target.classList.contains("f_modal")) {
        f_modal.classList.remove("open");
        original.classList.remove("open");
    }
});