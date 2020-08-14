'use strict'

import ResponseClass from '../models/ResponseClass';

exports.listar = async (app, req, res, next) => {
    let resp = new ResponseClass();

    try {
        resp.msg = 'API ON';

        res.json(resp);
    } catch (error) {
        resp.error = true;
        resp.msg = 'Ocorreu um erro!'

        res.json(resp);
    }
}