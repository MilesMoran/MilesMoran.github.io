/*############################################################################*/

const ALL_CATEGORIES = {
    "Model":    ["LMs", "LMMs", "GLMs", "GLMMs"], 
    "Length":   ["Quick-Read"], 
    "Language": ["R", "SAS", "Stata"],
    "Topic":    ["Autocorrelation", "Contrasts", "Data Viz", "DoE", "Heteroskedasticity", "Multiple Comparisons", "Power Analysis", "Spatial", "Simulation", "Multivariate", "Survival", "Bayesian", "Computation"],
    "Other":    []
};

var marginL = document.getElementById("quarto-sidebar");
var marginR = document.getElementById("quarto-margin-sidebar");

var htmlWIP = `
    <div class='sidebar-container'>
    <h4 class='sidebar-disp-filter'>Filter Your Results</h4>
    <span class="resource-categories listing-categories" style="float:right;">
        <button id="infoBtn" class="resource-category listing-category">
            INFO
        </button>
        <div class="resource-category listing-category clear-categories" onclick="manageCategorySelection('CLEAR');">
            CLEAR
        </div>
    </span>
    <br />
`

for (var [CLASS, CATEGORIES] of Object.entries(ALL_CATEGORIES)) {
    if(CLASS==="Topic") {
        CATEGORIES = CATEGORIES.sort();
    }
    htmlWIP += 
        "<h5 class='sidebar-disp-catclass'>" + CLASS + ": </h5>" + 
        "<span class='resource-categories listing-categories'>" + 
        CATEGORIES.map((CAT) => 
            "<div class='resource-category listing-category' onclick='manageCategorySelection(\"" + CAT + "\");'>" + 
                CAT + 
            "</div>"     
        ).join('\n') + 
        "</span>"
} 

marginR.innerHTML = htmlWIP + "</div>"

/*############################################################################*/
