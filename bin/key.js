'use strict'

import pg from 'pg'

const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: '',
    port: 5432
})

// pool.on('connect', () => {
//     console.log('==> [-] BANCO DE DADOS "ON"');
// });

module.exports = {
    query: (text, params) => pool.query(text, params),
};
