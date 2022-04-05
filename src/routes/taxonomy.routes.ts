import { Router } from "express";
import multer from "multer";

const taxonomyRoutes = Router();
const upload = multer({ 
    dest: "./tmp",
    limits: {
        fileSize: 1000000
    }
 });

 taxonomyRoutes.get("/", (req, res) => {
    res.send("Hello taxonomy");
});


 export { taxonomyRoutes }