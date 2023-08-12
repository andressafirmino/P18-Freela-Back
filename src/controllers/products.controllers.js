import { checkEmail } from "../repository/users.repository";

export async function postProducts(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const {name, category, description, photos, idSeller, idStatus} = req.body;

    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const user = await checkEmail(logged.rows[0].email);
        if (user.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        await postProducts(name, category, description, photos, idSeller, idStatus);
        res.statusSend(201);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProducts(req, res) {
    try {
        const products = await getProducts();
        res.send(products.rows);
    } catch (e) {
        res.status(500).send(e.message);
    }
}