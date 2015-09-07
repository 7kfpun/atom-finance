finance = null

module.exports =
  config:
    display:
      type: 'string'
      default: 'right'
      enum: ['left', 'right']
    format:
      description: 'Please refer to the documantation on https://github.com/7kfpun/atom-finance. HTML elements are supported.'
      type: 'string'
      default: '<span style="color:white">{symbol}</span>: {LastTradePriceOnly} ({Change})'
    refresh:
      description: 'In seconds, if zero seconds only refreshes when open/close windows or trigger refresh'
      type: 'integer'
      default: 30
      minimum: 10
    scroll:
      type: 'string'
      default: 'left'
      enum: ['left', 'right', 'fixed']
    scrollDelay:
      description: 'This specifies the number of milliseconds between each successive draw of the marquee text.'
      type: 'integer'
      default: 85
      minimum: 60
      maximum: 1000
    separator:
      type: 'string'
      default: ' | '
    watchlist:
      type: 'string'
      default: 'GOOG,^HSI,0005.HK'

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
