import joi from "joi";

export const postProductSchema = joi.object({
    name: joi.string().min(1).required(),
    description: joi.string().min(1). max(30).required(),
    photo: joi.string().uri().required(),
    photo2: joi.string().uri(),
    photo3: joi.string().uri(),
    category: joi.string().required()
})