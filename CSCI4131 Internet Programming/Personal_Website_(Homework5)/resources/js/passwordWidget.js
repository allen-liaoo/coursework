// TODO: Based on the rules here, return an object with a properties `className` and `message`
//
// - A password with length less than 6 has `message` 'Short' and `className` 'short'
//
// Otherwise, we assign the password a score representing its strength. The
// score starts at 0 and will be incremented by one for each of the following
// conditions the password satisfies:
//
// - The password has length longer than 7
// - The password has at least one capital and lowercase letter
// - The password has at least one letter and at least one number
// - The password contains at two or more symbols
//
// We define symbols to be the following characters:
//    '!', '%', '&', '@', '#', '$', '^', '*', '?', '_', '~'
//
// Based on the value from the rules above, return the object with the correct
// values from the corresponding table:
//
// | Score | Class Name | Message         |
// |-------+------------+-----------------|
// | s < 2 | weak       | Weak Password   |
// | s = 2 | good       | Good Password   |
// | s > 2 | strong     | Strong Password |
function checkStrength(password) {
  // TODO: Change this.
  let message = 'Not done';
  let className = 'none';
  let score = 0;
  if (password.length < 6) {
    message = 'Short';
    className = 'short';
  } else {
    if (password.length > 7) score ++;

    // The password has at least one capital and lowercase letter
    if (password.search(/[A-Z]/) != -1 &&
        password.search(/[a-z]/) != -1) score++;

    // The password has at least one letter and at least one number
    if (password.search(/[A-Za-z]/) != -1 &&
        password.search(/\d/) != -1) score++;

    // The password contains at two or more symbols
    let array = password.match(/[!%&@#$^*?_~]/g);
    if (array != null && array.length >=2) {
        score++;
    }

    // console.log(score);

    if (score < 2) {
        message = "Weak Password";
        className = "weak";
    } else if (score == 2) {
        message = "Good Password";
        className = "good";
    } else {
        message = "Strong Password";
        className = "strong";
    }
  }

  return {
    message,
    className
  };
}

// You do not need to change this function. You may want to read it -- as you will find parts of it helpful with
// the countdown widget.
function showResult(password) {

  const { message, className } = checkStrength(password);

  if(!message || !className) {
    console.error("Found undefined message or className");
    console.log("message is", message);
    console.log("className is", className);
  }

  // This gets a javascript object that represents the <span id="pwdresult"></span> element
  // Using this javascript object we can manipulate the HTML span by
  // changing it's class and text content
  const resultElement = document.getElementById("pwdresult");

  // This sets the class to one specific element (since you can have multiple classes it's a list)
  resultElement.classList = [className];
  // This sets the text inside the span
  resultElement.innerText = message;
}

// Add a listener for the strength checking widget
function addPasswordListener() {
  let passwordEntry = document.getElementById('password');
  passwordEntry.addEventListener("keyup", () => {
    const password = passwordEntry.value;
    showResult(password);
  });
}

addPasswordListener();
