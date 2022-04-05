import express from 'express'


const app = express();



app.get("/", (req,res) => {
    res.send("Hello mundo")
})

app.listen("3333")