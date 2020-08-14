'use strict'

import IndexController from '../controllers/indexController';

module.exports = (app) => {
    app.get('/', (req, res, next) => {
        IndexController.listar(app, req, res, next);
    })
}