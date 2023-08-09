import { Router } from "express";
import { validateSchema } from "../middleware/validateSchema.js";
import { signIn, signUp } from "../controllers/users.controllers.js";
import { signInSchema, signUpSchema } from "../schemas/user.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(signUpSchema), signUp);
usersRouter.post("/signin", validateSchema(signInSchema), signIn);
//usersRouter.get("/users/me", getUser);

export default usersRouter;