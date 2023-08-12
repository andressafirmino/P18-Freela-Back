import { getAllProducts, getUserProducts, postProduct } from "../repository/products.repository";
import { checkEmail, checkToken } from "../repository/users.repository";

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
        await postProduct(name, category, description, photos, idSeller, idStatus);
        res.statusSend(201);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProducts(req, res) {
    try {
        const products = await getAllProducts();
        res.send(products.rows);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProductsUser(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const {id} = req.params;
    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const user = await checkEmail(logged.rows[0].email);
        if (user.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const productsUser = await getUserProducts(user.rows[0].id);
        res.send(productsUser);
    } catch (e) {
        res.status(500).send(e.message);
    }
}