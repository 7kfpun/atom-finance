finance = null

module.exports =
  config:
    watchlist:
      type: 'string'
      default: 'GOOG,^HSI,0005.HK'
    format:
      description: 'Please refer to the documantation on https://github.com/7kfpun/atom-finance.'
      type: 'string'
      default: '{symbol}: {LastTradePriceOnly} ({Change})'
    separator:
      type: 'string'
      default: ' | '
    display:
      type: 'string'
      default: 'right'
      enum: ['left', 'right']
    scroll:
      type: 'string'
      default: 'left'
      enum: ['left', 'right', 'fixed']
    refresh:
      description: 'In seconds, if zero seconds only refreshes when open/close windows or trigger refresh'
      type: 'integer'
      default: 15
      minimum: 1

  activate: ->
    console.log 'finance', 'activate'

  deactivate: ->
    finance?.destroy()
    finance = null

  consumeStatusBar: (statusBar) ->
    console.log 'consumeStatusBar'
    FinanceView = require './finance-view'
    finance = new FinanceView()
    finance.initialize(statusBar)
    finance.attach()
