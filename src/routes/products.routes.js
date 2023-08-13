import { Router } from "express";
import { getProductId, getProducts, getProductsUser, postProducts } from "../controllers/products.controllers.js";

const productsRouter = Router();

productsRouter.post("/me", postProducts);
productsRouter.get("/", getProducts);
productsRouter.get("/me", getProductsUser);
productsRouter.get("/:id", getProductId);

export default productsRouter;