const endOfSem = new Date (2022, 12, 22);

function timeUntil(date) {
    let elapse = endOfSem.getTime() - date;
    let day = Math.floor(elapse / (1000*60*60*24));
    let hour = Math.floor(elapse / (1000*60*60)) - day*24;
    let minute = Math.floor(elapse / (1000*60)) - hour*60 - day*24*60;
    let second = Math.floor(elapse / 1000) - hour*60*60 - day*24*60*60 - minute*60;;

    return {
        days: day,
        hours: hour,
        minutes: minute,
        seconds: second
    };
}

function displayTimeUntil() {
    let time = timeUntil(Date.now());
    const resultElement = document.getElementById("timeuntil");
    resultElement.classList.color = "black";
    resultElement.innerText = time.days + " days " + time.hours + " hours " + time.minutes + " minutes " + time.seconds + " seconds";
}

setInterval(displayTimeUntil, 1000);