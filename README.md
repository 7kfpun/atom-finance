# Finance

Simple plugin for checking your stock in Atom.io editor (Yahoo Finance).

![ScreenShot](https://raw.github.com/7kfpun/atom-finance/master/screenshot.gif)


## Installing

1. Go to `Atom -> Preferences...`
2. Then select the `Install` tab
3. Enter `finance` in the search box

#### Using apm

```sh
$ apm install finance
```

#### Install using Git

Alternatively, if you are a git user, you can install the package and keep up to date by cloning the repo directly into your `~/.atom/packages` directory.

```sh
$ git clone https://github.com/7kfpun/atom-finance.git ~/.atom/packages/finance
```

#### Download Manually

1. Download the files using the [GitHub .zip download](https://github.com/7kfpun/atom-finance/archive/master.zip) option and unzip them
2. Move the files inside the folder to `~/.atom/packages/finance`


## Usage

Display your stock watchlist in status bar.

#### Plugin settings page

To access the Finance Settings:

1. Go to `Atom -> Preferences...` or `cmd-,`
2. In the `Filter Packages` type `finance`

![Settings](https://raw.github.com/7kfpun/atom-finance/master/settings.png)

Finance has 6 settings that can be edited:

1. Display | default: `right` (right, left)
2. Format | default: `<span style="color:white">{symbol}</span>: {LastTradePriceOnly} ({Change})`
3. Refresh | default: `30` (In seconds, if zero seconds only refreshes when open/close windows or trigger refresh)
4. Scroll | default: `left` (left, right, fixed)
4. Scroll Delay | default: `85`
5. Separator | default: ` | `
6. Watchlist | default: `GOOG,^HSI,0005.HK`

#### Commands

The following commands are available and are keyboard shortcuts.

* `finance:toggle` - Toggle - `ctrl-alt-f` `ctrl-alt-f`
* `finance:refresh` - Refresh - `ctrl-alt-r` `ctrl-alt-r`


## Financial data from Yahoo Finance

This plugin supports all exchanges and markets that Yahoo Finance covers.

Quotes are real-time for NASDAQ, NYSE, and NYSE Mkt when available from Nasdaq Last Sale and if not available will appear delayed from the primary listing source. See also delay times for other exchanges [here](https://help.yahoo.com/kb/finance/SLN2310.html).

#### QuoteProperty

    AfterHoursChangeRealtime
    AnnualizedGain
    Ask
    AskRealtime
    AverageDailyVolume
    Bid
    BidRealtime
    BookValue
    Change
    ChangeFromFiftydayMovingAverage
    ChangeFromTwoHundreddayMovingAverage
    ChangeFromYearHigh
    ChangeFromYearLow
    ChangePercentRealtime
    ChangeRealtime
    Change_PercentChange
    ChangeinPercent
    Commission
    Currency
    DaysHigh
    DaysLow
    DaysRange
    DaysRangeRealtime
    DaysValueChange
    DaysValueChangeRealtime
    DividendPayDate
    DividendShare
    DividendYield
    EBITDA
    EPSEstimateCurrentYear
    EPSEstimateNextQuarter
    EPSEstimateNextYear
    EarningsShare
    ErrorIndicationreturnedforsymbolchangedinvalid
    ExDividendDate
    FiftydayMovingAverage
    HighLimit
    HoldingsGain
    HoldingsGainPercent
    HoldingsGainPercentRealtime
    HoldingsGainRealtime
    HoldingsValue
    HoldingsValueRealtime
    LastTradeDate
    LastTradePriceOnly
    LastTradeRealtimeWithTime
    LastTradeTime
    LastTradeWithTime
    LowLimit
    MarketCapRealtime
    MarketCapitalization
    MoreInfo
    Name
    Notes
    OneyrTargetPrice
    Open
    OrderBookRealtime
    PEGRatio
    PERatio
    PERatioRealtime
    PercebtChangeFromYearHigh
    PercentChange
    PercentChangeFromFiftydayMovingAverage
    PercentChangeFromTwoHundreddayMovingAverage
    PercentChangeFromYearLow
    PreviousClose
    PriceBook
    PriceEPSEstimateCurrentYear
    PriceEPSEstimateNextYear
    PricePaid
    PriceSales
    SharesOwned
    ShortRatio
    StockExchange
    Symbol
    TickerTrend
    TradeDate
    TwoHundreddayMovingAverage
    Volume
    YearHigh
    YearLow
    YearRange
    symbol

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).
