import { db } from "../database/database.js";

export function insertPhotos(id, photo, photo2, photo3) {
    const res = db.query(`INSERT INTO photos ("idProduct", "photoUrl") VALUES ($1, $2), ($1, $3), ($1, $4);`, [id, photo, photo2, photo3]);
    return res;
}

export function postProduct(name, category, description, idSeller, idStatus) {
    const res = db.query(`INSERT INTO products (name, category, description, "idSeller", "status") VALUES ($1, $2, $3, $4, $5) RETURNING "id";`, [name, category, description, idSeller, idStatus]);
    return res;
}

export function getAllProducts() {
    const res = db.query(`SELECT products.id AS "idProduct", products.name AS "nameProduct", products.category, products.description, products.status, 
    "idSeller", users.name AS "nameSeller", users.email, users.phone, json_agg(
        json_build_object('id', photos."idProduct", 'photo', photos."photoUrl")) AS photos
    FROM products
    JOIN users ON users.id = products."idSeller"
    JOIN photos ON products.id = photos."idProduct"
    GROUP BY products.id, users.id
    `);
    return res;
}

export function getUserProducts(id) {
    const res = db.query(`SELECT products.*, json_agg(
        json_build_object('id', photos."idProduct", 'photo', photos."photoUrl")) AS photos
    FROM  products
    JOIN photos ON products.id = photos."idProduct"
    WHERE "idSeller" = $1
    GROUP BY products.id;`, [id]);
    return res;
}

export function getProductById(id) {
    const res = db.query(`SELECT products.id AS "idProduct", products.name AS "nameProduct", products.category, products.description, products.status, 
    "idSeller", users.name AS "nameSeller", users.email, users.phone, json_agg(
        json_build_object('id', photos."idProduct", 'photo', photos."photoUrl")) AS photos
    FROM products
    JOIN users ON users.id = products."idSeller"
    JOIN photos ON products.id = photos."idProduct"
    WHERE products.id = $1
    GROUP BY products.id, users.id`, [id]);
    return res;
}

export function getProductsByCategory(category) {
    const res = db.query(`SELECT products.id AS "idProduct", products.name AS "nameProduct", products.category, products.description, products.status, 
    "idSeller", users.name AS "nameSeller", users.email, users.phone, json_agg(
        json_build_object('id', photos."idProduct", 'photo', photos."photoUrl")) AS photos
    FROM products
    JOIN users ON users.id = products."idSeller"
    JOIN photos ON products.id = photos."idProduct"
    WHERE products.category = $1
    GROUP BY products.id, users.id
    `, [category]);
    return res;
}

export function updateProduct(id) {
    const res = db.query(`UPDATE products SET status = $1 WHERE id = $2;`, [true, id]);
    return res;
}
export function delPhotos(id) {
    const res = db.query(`DELETE FROM photos WHERE "idProduct" = $1;`, [id]);
    return res;
}
export function delProduct(id) {
    const res = db.query(`DELETE FROM products WHERE id = $1;`, [id]);
    return res;
}