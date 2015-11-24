koa = require 'koa'
app = koa!

countrank = require './modules/coutrank'

app
.use countrank.router.routes!
.use countrank.router.allowedMethods!

.listen 3000
