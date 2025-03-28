/* Création de compte */

const modalNew = document.getElementById("modalNew");
const openModalNew = document.getElementById("openModalNew");
const closeModalNew = document.getElementById("closeModalNew");

openModalNew.addEventListener("click", () => {
    modalNew.style.display = "flex";
});

closeModalNew.addEventListener("click", () => {
    modalNew.style.display = "none";
});

window.addEventListener("click", (event) => {
    if (event.target === modal) {
        modalNew.style.display = "none";
    }
});

/* Pour la maquette, on va lister les exemples de modification et suppression*/
/* Alex */

const modalEditA = document.getElementById("modalEditA");
const openModalEditA = document.getElementById("openModalEditA");
const closeModalEditA = document.getElementById("closeModalEditA");
const modalDeleteA = document.getElementById("modalDeleteA");
const openModalDeleteA = document.getElementById("openModalDeleteA");
const closeModalDeleteA = document.getElementById("closeModalDeleteA");

openModalEditA.addEventListener("click", () => {
    modalEditA.style.display = "flex";
});

closeModalEditA.addEventListener("click", () => {
    modalEditA.style.display = "none";
});

openModalDeleteA.addEventListener("click", () => {
    modalDeleteA.style.display = "flex";
});

closeModalDeleteA.addEventListener("click", () => {
    modalDeleteA.style.display = "none";
});

/* Sarah */

const modalEditS = document.getElementById("modalEditS");
const openModalEditS = document.getElementById("openModalEditS");
const closeModalEditS = document.getElementById("closeModalEditS");
const modalDeleteS = document.getElementById("modalDeleteS");
const openModalDeleteS = document.getElementById("openModalDeleteS");
const closeModalDeleteS = document.getElementById("closeModalDeleteS");

openModalEditS.addEventListener("click", () => {
    modalEditS.style.display = "flex";
});

closeModalEditS.addEventListener("click", () => {
    modalEditS.style.display = "none";
});

openModalDeleteS.addEventListener("click", () => {
    modalDeleteS.style.display = "flex";
});

closeModalDeleteS.addEventListener("click", () => {
    modalDeleteS.style.display = "none";
});

/* Julien */

const modalEditJ = document.getElementById("modalEditJ");
const openModalEditJ = document.getElementById("openModalEditJ");
const closeModalEditJ = document.getElementById("closeModalEditJ");
const modalDeleteJ = document.getElementById("modalDeleteJ");
const openModalDeleteJ = document.getElementById("openModalDeleteJ");
const closeModalDeleteJ = document.getElementById("closeModalDeleteJ");

openModalEditJ.addEventListener("click", () => {
    modalEditJ.style.display = "flex";
});

closeModalEditJ.addEventListener("click", () => {
    modalEditJ.style.display = "none";
});

openModalDeleteJ.addEventListener("click", () => {
    modalDeleteJ.style.display = "flex";
});

closeModalDeleteJ.addEventListener("click", () => {
    modalDeleteJ.style.display = "none";
});