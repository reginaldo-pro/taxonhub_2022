import { Router } from "express";
import multer from "multer";
import { importCSVController } from "../modules/taxonomy/useCases/importCSV";

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


taxonomyRoutes.post("/import", upload.single("file"), (req,res) => {return importCSVController.handle(req,res)})


export { taxonomyRoutes }