import { delLogin, delPhotos, delProduct, getAllProducts, getProductById, getProductsByCategory, getUserProdId, getUserProducts, insertPhotos, postProduct, updateProduct } from "../repository/products.repository.js";
import { checkEmail, checkToken } from "../repository/users.repository.js";

export async function postProducts(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const {name, category, description, photo, photo2, photo3} = req.body;
    

    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const user = await checkEmail(logged.rows[0].email);
        if (user.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const response = await postProduct(name, category, description, user.rows[0].id, false); 
        await insertPhotos(response.rows[0].id, photo, photo2, photo3);
        res.sendStatus(201);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProducts(req, res) {
    try {
        const products = await getAllProducts();
        res.send({products: products.rows});
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProductsUser(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");

    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const user = await checkEmail(logged.rows[0].email);
        if (user.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        console.log(user.rows[0].id)
        const productsUser = await getUserProducts(user.rows[0].id);
        res.send(productsUser.rows);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProductId (req, res) {
    const {id} = req.params;
    try {
        const getProduct = await getProductById(id);
        res.send({product: getProduct.rows});
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function getProductsCategory (req, res) {
    const {category} = req.params;
    try {
        const products = await getProductsByCategory(category);
        res.send({products: products.rows});
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function updateStatus(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");
    const {id} = req.params;
    let status = false;

    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        const user = await checkEmail(logged.rows[0].email);
        if (user.rows.length === 0) {
            return res.status(401).send({ message: "Email não autorizado!" });
        }
        const idProduct = await getUserProdId(id, user.rows[0].id);
        if (idProduct.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        if(idProduct.rows[0].status) {
            status = false;
        } else {
            status = true;
        }
        await updateProduct(status, id);
        res.send();
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function deleteProduct(req, res) {
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
        const idProduct = await getUserProdId(id, user.rows[0].id);
        if (idProduct.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        await delPhotos(id);
        const product = await delProduct(id);
        res.send(product.rows);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export async function deleteLogin(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");

    try {
        const logged = await checkToken(token);
        if (logged.rows.length === 0) {
            return res.status(401).send({ message: "Usuário não autorizado!" });
        }
        await delLogin(token);
        res.send();
} catch (e) {
    res.status(500).send(e.message);
} 
}