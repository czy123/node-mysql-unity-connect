fs = require 'fs'
mysql = require 'mysql'
yaml = require 'js-yaml'
wrapper = require 'co-mysql'
mysql_conf = yaml.safeLoad fs.readFileSync 'etc/mysql.yaml','utf8'

console.log  mysql_conf
pool = mysql.createPool mysql_conf.mysql
p = wrapper pool

exports.mysql = mysql
exports.p = p
