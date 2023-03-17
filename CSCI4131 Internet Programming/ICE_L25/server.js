const express = require("express");
const session = require('express-session');

var db = require("./db")

// setup the app object
const app = express();
const PORT = 3006


app.use(express.static("files"));
// Parse URL-encoded bodies requires express 4.16+
// (older versions of express had external libraries for this)
app.use(express.urlencoded({extended:true})); 
app.use(session({secret:"oauhsdlmfnaliustydfialjbkwegf"}))

app.set("views", "templates");
app.set("view engine", "pug");

// routes
app.get("/", function(req, res) {
    // send to template.
    res.redirect("/main")
});
 
// routes
app.get("/main", async function(req, res) {
    const colors = await db.getColors() 
    res.render("main.pug", {colors: colors})
});

app.post("/main", async function(req, res) {
    const name = req.body.name || "color"
    const code = req.body.color_code || "#808000"
    await db.addColor(name, code)
    const colors = await db.getColors() 
    res.render("main.pug", {colors: colors})
});

// Start the web server
app.listen(PORT, function() {
   console.log(`Listening on http://localhost:${PORT}`);
});