'use strict'

import TestDAO from '../../models/test/TestDAO';
import ResponseClass from '../../models/ResponseClass';

exports.list = async (app, req, res, next) => {
    let resp = new ResponseClass();

    TestDAO.getAll(function(err, result) {
        if(err) {
            resp.error = true;
            resp.msg = 'Ocorreu um erro!';
        } else {
            resp.dados = result.rows;
        }

        res.json(resp);
    })
}