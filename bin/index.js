'use strict'

import dotenv from 'dotenv'
dotenv.config()
import express from 'express'
import bp from 'body-parser'
import cors from 'cors'
import consign from 'consign'

const app = express()

app.use(cors())

app.use(bp.urlencoded({ extended: true }))
app.use(bp.json({ limit: '20mb', extended: true }))

app.use(express.static('public'))

consign()
    .include('src/routes')
    .into(app)

module.exports = app