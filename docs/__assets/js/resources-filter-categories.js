/*############################################################################*/

// Global variable to store current categories
var currentCategories = [];

function getCurrentCategories() {
    return currentCategories;
}

function manageCategorySelection(category) {
    if (category === 'CLEAR') {
        currentCategories = []; // Reset categories
    } else {
        const index = currentCategories.indexOf(category);
        if (index > -1) {
            currentCategories.splice(index, 1); // Remove category if already selected
        } else {
            currentCategories.push(category); // Add category if not already selected
        }
    }

    // Update UI based on the new state of currentCategories
    highlightCurrentCategories();
    filterItemsByCategories();
}

function highlightCurrentCategories() {
    document.querySelectorAll('.listing-category').forEach(div => {
        if (currentCategories.includes(div.innerText)) {
            div.classList.add('category-highlighted');
        } else {
            div.classList.remove('category-highlighted');
        }
    });
}

function filterItemsByCategories() {
    document.querySelectorAll('.listing-item').forEach(item => {
        const itemCategories = item.getAttribute('data-categories').split(',');
        var isMatch = true; // Assume it's a match initially
        if (currentCategories.length > 0) {
            for (var i = 0; i < currentCategories.length; i++) {
                if (!itemCategories.includes(currentCategories[i])) {
                    isMatch = false; // If any category is not included, it's not a match
                    break; // No need to check further
                }
            }
        }
        item.style.display = isMatch ? '' : 'none';
    });
}

// Initialize page state
document.addEventListener("DOMContentLoaded", () => {
    highlightCurrentCategories();
    filterItemsByCategories();
});

/*############################################################################*/