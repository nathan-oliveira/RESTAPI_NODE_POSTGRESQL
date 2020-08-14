'use strict'

import TestController from '../../controllers/test/testController';

module.exports = (app) => {
    app.get('/test', (req, res, next) => {
        TestController.list(app, req, res, next);
    })
}