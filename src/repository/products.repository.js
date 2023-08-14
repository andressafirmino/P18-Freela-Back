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
    const res = db.query(`SELECT * FROM products WHERE "idSeller" = $1;`, [id]);
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