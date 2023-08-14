import { Router } from "express";
import { getProductId, getProducts, getProductsCategory, getProductsUser, postProducts, updateStatus } from "../controllers/products.controllers.js";

const productsRouter = Router();

productsRouter.post("/me", postProducts);
productsRouter.get("/", getProducts);
productsRouter.get("/me", getProductsUser);
productsRouter.get("/produto/:id", getProductId);
productsRouter.get("/:category", getProductsCategory);
productsRouter.put("/me", updateStatus);

export default productsRouter;