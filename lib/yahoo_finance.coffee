'use strict'
https = require('https')

yahooFinance = (codes, cb) ->
  codes = codes.replace /[\s@#$%&*()\\，。]/g, ''
  codes = codes.replace ',', '%27,%27'

  get = (r) ->
    bd = ''
    r.on('data', (d) ->
      bd += d
      return
    ).on 'end', ->
      try
        b = JSON.parse(bd)
        cb b
      catch error
        console.log 'Yahoo finance call', error
      return
    return

  https.get {
    host: 'query.yahooapis.com'
    path: '/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%27' + codes + '%27)&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json'
  }, get

  console.log 'Yahoo finance call'

module.exports = yahooFinance
