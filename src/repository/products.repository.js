import { db } from "../database/database.js";

export function postProducts(name, category, description, photos, idSeller, idStatus) {
    const res = db.query(`INSERT INTO products (name, category, description, photos, idSeller, idStatus) VALUES ($1, $2, $3, $4, $5, $6);`, [name, category, description, photos, idSeller, idStatus]);
    return res;
}

export function getProducts() {
    const res = db.query(`SELECT * FROM products`);
    return res;
}