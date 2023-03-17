function setupSorting() {
    function cellClickListener() {
        let colIndex = this.cellIndex;
        sortRows(colIndex);
    }

    let firstRow = document.getElementById("contactsTable").getElementsByTagName("thead")[0].getElementsByTagName("tr")[0];
    let cells = firstRow.getElementsByTagName("th");
    for(let i = 0; i < cells.length; i++) {
        cells[i].addEventListener("click", cellClickListener);
    }
}

function sortRows(colNum) { // sorts contacts table rows by column number
    let table = document.getElementById("contactsTable").getElementsByTagName("tbody")[0];
    let rows = table.getElementsByTagName("tr");
    let newRows = [];
    for(let i = 0; i < rows.length; i++) { // start on the second row
        newRows.push(rows[i]);
    }
    newRows.sort((a,b) => {return a.children[colNum].innerText.localeCompare(b.children[colNum].innerText)});
    for(let i = 0; i < newRows.length; i++) {
        table.appendChild(newRows[i]);
    }
}

function setupHoverImages() {
    function enterRowListener() {
        img = this.getElementsByClassName("locimage")[0];
        if (img != undefined) {
            // hide default image
            let def = document.getElementById("defaultLocImg");
            def.classList.add("hide");

            img.classList.remove("hide");
            let side = document.getElementById("sideimage");
            // add this row's image to the side
            node = img.cloneNode();
            side.appendChild(node);
        }
    }

    function leaveRowListener() {
        img = this.getElementsByClassName("locimage")[0];
        // if there is an image in this row, remove it
        if (img != undefined) {
            img.classList.add("hide");
        }
        let side = document.getElementById("sideimage");
        // clear side image child nodes
        let children = side.childNodes;
        for (let i = 0; i < children.length; i++) {
            side.removeChild(children[i]);
        }
        // show default image
        let def = document.getElementById("defaultLocImg");
        def.classList.remove("hide");
    }
    
    let table = document.getElementById("contactsTable");
    let array = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
    for (let i = 0; i < array.length; i++) {
        array[i].addEventListener("mouseenter", enterRowListener);
        array[i].addEventListener("mouseleave", leaveRowListener);
    }
    
}
window.addEventListener("load", setupHoverImages);
window.addEventListener("load", setupSorting);