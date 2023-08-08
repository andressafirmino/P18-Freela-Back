import { Router } from "express";
import { validateSchema } from "../middleware/validateSchema.js";
import { signUpSchema } from "../schemas/user.schemas.js";
import { signUp } from "../controllers/users.controllers.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(signUpSchema), signUp);
//usersRouter.post("/signin", validateSchema(signInSchema), signIn);
//usersRouter.get("/users/me", getUser);

export default usersRouter;