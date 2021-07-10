import yfinance as yf
from datetime import datetime, timedelta
import pandas as pd


#Get the stock price for Unity Software Inc going back 1 year
timeInterval = '1d'
ticker = 'U'
dfStocks = yf.download(ticker, 
                      start='2020-07-05', 
                      end='2021-07-05', 
                      interval=timeInterval,
                      progress=False
                      )

dfStocks['TimestampEst'] = dfStocks.index
dfStocks['Interval'] = timeInterval
dfStocks['Ticker'] = ticker
dfStocks.reset_index(drop=True, inplace=True)
dfStocks = dfStocks.rename(columns={'Adj Close': 'AdjClose'})
dfStocks = dfStocks[['Ticker', 'Interval', 'TimestampEst',  'Open', 'Close', 'High', 'Low',  'AdjClose', 'Volume']]

#Export to csv
dfStocks.to_csv('C:\\Users\\kendo\\Documents\\R\\Medium\\Business Data Game\\UnityStockData.csv', index = False)


