import { db } from "../database/database.js";

export function postProduct(name, category, description, photos, idSeller, idStatus) {
    const res = db.query(`INSERT INTO products (name, category, description, photos, idSeller, idStatus) VALUES ($1, $2, $3, $4, $5, $6);`, [name, category, description, photos, idSeller, idStatus]);
    return res;
}

export function getAllProducts() {
    const res = db.query(`SELECT * FROM products`);
    return res;
}

export function getUserProducts(id) {
    const res = db.query(`SELECT * FROM products WHERE "idSeller" = $1;`, [id]);
    return res;
}

export function getProductById(id) {
    const res = db.query(`SELECT * FROM products WHERE "id" = $1;`, [id]);
    return res;
}