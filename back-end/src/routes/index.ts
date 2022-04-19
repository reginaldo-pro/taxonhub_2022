import { Router } from "express";
import { taxonomyRoutes } from "./taxonomy.routes";
import { ocurrencyRoutes } from "./ocurrency.routes";

const router = Router();

router.use("/taxonomy",taxonomyRoutes)
router.use("/ocurrency",ocurrencyRoutes)

export { router }