import joi from "joi";

export const signUpSchema = joi.object({
    name: joi.string().min(1).required(),
    email: joi.string().email().required(),
    password: joi.string().pattern(new RegExp('^[\\w!@#$%^&*()\\-+=<>?/\\\\[\\]{}|;:\'",.]{3,}$')).required(),
    confirmPassword: joi.string().pattern(new RegExp('^[\\w!@#$%^&*()\\-+=<>?/\\\\[\\]{}|;:\'",.]{3,}$')).required(),
    cpf: joi.string().length(11).required(),
    phone: joi.string().length(11).required()
})

export const signInSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().pattern(new RegExp('^[\\w!@#$%^&*()\\-+=<>?/\\\\[\\]{}|;:\'",.]{3,}$')).required()
})