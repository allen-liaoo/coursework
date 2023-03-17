let polling = false;

function clickButtonListener() {
    fetch("/api/click", {method:"POST"})
        .then((res) => {
            return res.json();
        })
        .then((res) => {
            let clickCount = document.getElementById('click');
            clickCount.value = res.clickCount;
        });

    if (!polling) { // first starts polling
        polling = true;

        setInterval(() => {
            fetch("/api/click", {method:"GET"})
                .then((res) => {
                    return res.json();
                })
                .then((res) => {
                    let clickCount = document.getElementById('click');
                    clickCount.value = res.clickCount;
                });
        }, 1000);   // 1000ms = 1s
    }
}

function addClickButtonListener() {
    let clickCount = document.getElementById('click');
    clickCount.addEventListener("click", clickButtonListener);
}

addClickButtonListener();