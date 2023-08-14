export function validateSchema(schema) {
    return (req, res, next) => {
        const validate = schema.validate(req.body, { abortEarly: false });
        if (validate.error) {
            const errors = validate.error.details.map(detail => detail.message);
            return res.status(422).send({message: errors});
        }
        next();
    }
}