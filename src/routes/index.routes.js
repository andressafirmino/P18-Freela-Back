import { Router } from "express";
import usersRouter from "./users.routes.js";
import productsRouter from "./products.routes.js";

const router = Router();

router.use(usersRouter);
router.use(productsRouter);

export default router;