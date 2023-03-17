function usernameAutoSuggest() {
    let email = this.value;
    console.log("Email:" + email);
    // empty email
    let username = document.getElementById("username");
    if(username.value.length !== 0) return; 
    let index = email.indexOf("@");    // get index of @
    console.log(index);
    if (index === -1) return;   // invalid email
    email = email.substr(0, index);
    console.log("Username:" +email);
    username.value = email;
}

function radioListener() {
    let ms = document.getElementById("concernMsg").classList;
    if (this.id == "concern") {
        ms.remove("hide");
    } else {
        ms.add("hide");
    }
}

function load() {
    document.getElementById("email").addEventListener("change", usernameAutoSuggest);
    // add radio button listeners
    let radios = document.getElementById("flex").getElementsByTagName("fieldset")[0].getElementsByTagName("input");
    for(n of radios) {
        n.addEventListener("change", radioListener);
    }
}

window.addEventListener("load", load);