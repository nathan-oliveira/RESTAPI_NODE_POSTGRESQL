'use strict'

import conn from '../../../bin/key';

module.exports = class TestDAO {
    static getAll(callback) {
        let sql = 'select * from drugstore.nivel_usuario';
        return conn.query(sql, callback);
    }
}