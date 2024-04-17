/*############################################################################*/

var content = document.getElementById("quarto-content");
var glossary = document.getElementById("glossary-container");

content.innerHTML = `
    <div id="popupContainer" class="hidden">
        <div id="popupBackground"></div>
        <div id="popupContent">
    ` + glossary.innerHTML + `
        </div>
    </div>
    ` + content.innerHTML;

document.getElementById("glossary-container").remove();

document.addEventListener('DOMContentLoaded', function() {
    const infoBtn = document.getElementById('infoBtn');
    const popupContainer = document.getElementById('popupContainer');
    const popupBackground = document.getElementById('popupBackground');

    infoBtn.addEventListener('click', function() {
        popupContainer.classList.remove('hidden');
    });

    popupBackground.addEventListener('click', function() {
        popupContainer.classList.add('hidden');
    });
});

/*############################################################################*/
