const express = require("express");
const session = require("express-session");
const db = require("./db");

const server = express();
const PORT = 3006;

// initialize session
server.use(session({
    secret:"uiwnsfiyusbnwuysiw"
}));
session.logInfo = {
    loggedIn: false,
    username: null
};

let pugEnv = {
    login: session.logInfo
};
let clickCount = 0;

server.set("view engine", "pug");
server.set("views", "templates");

// handle routing
server.use("/resources", express.static("resources"));
server.use(express.urlencoded({extended:true}));

server.get("/", (req, res) => {
    res.redirect("/myAboutMe");
});

server.get("/myAboutMe", (req, res) => {
    res.render("myAboutMe", pugEnv);
});

server.get("/myContacts", (req, res) => {
    res.render("myContacts", pugEnv);
});

server.get("/myWidgets", (req, res) => {
    res.render("myWidgets", pugEnv);
});

// for click count widget
server.get("/api/click", (req, res) => {
    res.json({"clickCount": clickCount});
});

server.post("/api/click", (req, res) => {
    clickCount++;
    res.json({"clickCount": clickCount});
});

server.get("/contactMe", (req, res) => {
    res.render("contactMe", {
        login: session.logInfo,
        result: {
            sent: false,
            error: false
        }
    });
});

server.post("/contactMe", async function(req, res) {
    let env = {
        login: session.logInfo,
        result: {
            sent: true,
            error: true
        }
    };

    db.sendMessage(req.body).then(r => {
            env.result.error = false;
            res.render("contactMe", env);
        }, err => {
            console.log(err);
            res.render("contactMe", env);
        });
});

server.get("/contactLog", (req, res) => {
    let env = {
        login: session.logInfo,
        result: {
            category: req.query.category,
            error: true
        }
    };

    db.getContactLog(req.query.category).then(rows => {
        env.result.error = false;
        env.result.log = rows;
        res.render("contactLog", env)
    }, err => {
        env.result.log = err;
        res.render("contactLog", env);
    });
});

server.get("/login", (req, res) => {
    res.render("login", pugEnv);
});

server.post("/login", (req, res) => {
    session.logInfo.loggedIn = true;
    session.logInfo.username = req.body.username;
    res.render("login", pugEnv);
});

server.post("/logout", (req, res) => {
    session.logInfo.loggedIn = false;
    session.logInfo.username = null;
    res.render("myAboutMe", pugEnv);
});

server.listen(PORT, function() {
    console.log(`Listening on http://localhost:${PORT}`);
 });