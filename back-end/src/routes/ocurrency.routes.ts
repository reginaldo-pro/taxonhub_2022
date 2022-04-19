import { Router } from "express";
import multer from "multer";

const ocurrencyRoutes = Router();
const upload = multer({ 
    dest: "./tmp",
    limits: {
        fileSize: 1000000
    }
 });

 ocurrencyRoutes.get("/", (req, res) => {
    res.send("Hello ocurrency");
});


 export { ocurrencyRoutes }