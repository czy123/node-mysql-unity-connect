mysql_pool = require '../lib/mysql_pool'
mysql = mysql_pool.mysql
p = mysql_pool.p

/*对json进行解析*/
parse = require 'co-body'
router = (require 'koa-router')!

selectalluserinfo = '''
  SELECT * FROM rank
'''

getuserrank = (body)->*
  try
    sql = mysql.format selectalluserinfo
    data = yield p.query sql
    console.log data
    rows = [];
    rows.push data
    return {result:rows}
  catch error
    console.log error
    return { message: 'error' }


getallinfo = (body)->*
  console.log body.method
  switch body.method

  case 'getrank' then
    result = yield  getuserrank body

  else
    result = {message : 'method not allowed'}

  return result


router
.post '/czy', ->*
  body = yield parse.json @
  @body = yield getallinfo body

exports.router = router
