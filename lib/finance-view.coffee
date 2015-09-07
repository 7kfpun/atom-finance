yahoo = require './yahoo_finance'
properties = require './properties'
{CompositeDisposable} = require 'atom'
subscriptions = new CompositeDisposable


class FinanceView extends HTMLDivElement
  initialize: (@statusBar) ->

    subscriptions.add atom.commands.add 'atom-workspace', 'finance:toggle': =>
      @toggle()
    subscriptions.add atom.commands.add 'atom-workspace', 'finance:refresh': =>
      @build()

    @observeWatchlist = atom.config.observe 'finance.watchlist', (newValue, previous) =>
      @build()
    @observeFormat = atom.config.observe 'finance.format', (newValue, previous) =>
      setTimeout (->
        format = atom.config.get('finance.format')
        for exp in format.match(/{[^}]*}/g)
          exp = exp.replace /[{}]/g, ''
          if exp not in properties
            atom.notifications.addWarning exp + ' is a supported quote property provided by Yahoo Finance.',
              dismissable: false
              detail: 'Please refer to the documantation on https://github.com/7kfpun/atom-finance.'
      ), 2000
      @build()
    @observeSeparator = atom.config.observe 'finance.separator', (newValue, previous) =>
      @build()
    @observeDisplay = atom.config.observe 'finance.display', (newValue, previous) =>
      @build()
    @observeRefresh = atom.config.observe 'finance.refresh', (newValue, previous) =>
      @build()

    @initElements()

    @observeScroll = atom.config.observe 'finance.scroll', (newValue, previous) =>
      if newValue == 'fixed'
        if @finance.nodeName != 'SPAN'
          @removeChild(@finance)
          @finance = document.createElement 'span'
          @finance.appendChild @price
          @appendChild(@finance)
      else
        if @finance.nodeName != 'MARQUEE'
          @removeChild(@finance)
          @finance = document.createElement 'marquee'
          @finance.appendChild @price
          @appendChild(@finance)

        @finance.setAttribute 'direction', newValue

      @build()


  initElements: ->
    @classList.add('finance-status', 'inline-block')
    @setAttribute 'id', 'finance-status'
    @icon = document.createElement 'span'
    @icon.classList.add('icon-graph', 'inline-block')
    @appendChild(@icon)

    # @finance = document.createElement 'span'
    scroll = atom.config.get('finance.scroll')
    if scroll != 'fixed'
      @finance = document.createElement 'marquee'
      @finance.setAttribute 'direction', scroll
    else
      @finance = document.createElement 'span'

    @price = document.createElement 'span'

  attach: ->
    @build()
    # subscriptions.add atom.packages.once('activated', @attach)
    seconds = atom.config.get 'finance.refresh'

    if seconds > 0
      setInterval (=>
        @build()
      ), seconds * 1000

  toggle: ->
    if @hasParent() then @detach() else @attach()

  hasParent: ->
    has = false
    bar = document.getElementsByTagName 'finance-status'
    if bar != null
      if bar.item() != null
        has = true
    return has

  detach: ->
    bar = document.getElementsByTagName 'finance-status'
    if bar != null
      if bar.item() != null
        el = bar[0]
        parent = el.parentNode
        if parent != null
          parent.removeChild el

  destroy: ->
    @tile?.destroy()
    @detach()

  build: =>
    watchlist = atom.config.get('finance.watchlist')
    currency = atom.config.get('finance.currency')
    separator = atom.config.get('finance.separator')

    yahoo watchlist, (coin) =>
      if not coin.query or not coin.query.results
        return

      quotes = coin.query.results.quote
      results = []
      if not Array.isArray(quotes)
        quotes = [quotes]

      for quote in quotes
        format = atom.config.get('finance.format')  # '{symbol}: {LastTradePriceOnly} ({Change})'
        for exp in format.match(/{[^}]*}/g)
          exp = exp.replace /[{}]/g, ''
          format = format.replace exp, quote[exp]
          console.log exp, quote[exp]
        format = format.replace /[{}]/g, ''
        results.push(format)

      @price.innerHTML = results.join(separator)
      @finance.appendChild @price
      @appendChild(@finance)

      if atom.config.get('finance.display') == 'left'
        @tile = @statusBar.addLeftTile(priority: 100, item: this)
      else
        @tile = @statusBar.addRightTile(priority: 100, item: this)

      return

module.exports = document.registerElement('finance-status', prototype: FinanceView.prototype)
