import { Router } from "express";
import { deleteLogin, deleteProduct, getProductId, getProducts, getProductsCategory, getProductsUser, postProducts, updateStatus } from "../controllers/products.controllers.js";
import { validateSchema } from "../middleware/validateSchema.js";
import { postProductSchema } from "../schemas/products.schemas.js";

const productsRouter = Router();

productsRouter.post("/adicionar", validateSchema(postProductSchema), postProducts);
productsRouter.get("/", getProducts);
productsRouter.get("/me", getProductsUser);
productsRouter.get("/produto/:id", getProductId);
productsRouter.get("/:category", getProductsCategory);
productsRouter.put("/me/:id", updateStatus);
productsRouter.delete("/me/:id", deleteProduct);
productsRouter.delete("/deslogar/:token", deleteLogin);

export default productsRouter;