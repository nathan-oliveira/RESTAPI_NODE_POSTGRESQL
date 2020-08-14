'use strict'

import app from './bin/index'

app.listen(process.env.portServer || 4000, (err) => {
    err ? console.log('==> Server OFF!') : console.log('🚀 Server started on http://localhost:4000')
})