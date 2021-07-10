library(tidyverse)
library(ggplot2)

df <- read_csv('UnityStockData.csv')
lim <- as.Date(c("2020-09-18", "2021-07-06"))

#Line Chart with labels
dfLine <- df %>% 
  select(TimestampEst, AdjClose) %>% 
  rename(Date = TimestampEst, StockPrice = AdjClose) %>% 
  ggplot(aes(x = Date, y = StockPrice)) +
  geom_line() +
  ylim(0, 180)+
  scale_x_date(date_breaks = "1 month", limits = lim, date_labels = "%B\n%Y")+
  ggtitle(label = "Unity Software Inc. (U) "
          , subtitle = "NYSE Stock Price USD")

#Show the chart
dfLine

#Area chart without labels and background. This will be our clipping mask. 
dfArea <- df %>% 
  select(TimestampEst, AdjClose) %>% 
  rename(Date = TimestampEst, StockPrice = AdjClose) %>% 
  ggplot(aes(x = Date, y = StockPrice)) +
  geom_area()+
  ylim(0, 180)+
  scale_x_date(date_breaks = "1 month", limits = lim, date_labels = "%B\n%Y")+
  theme_minimal() + 
  theme(panel.border = element_blank()
        , panel.grid.major = element_blank()
        , panel.grid.minor = element_blank()
        , axis.line = element_blank()
        , axis.title.x=element_blank()
        , axis.text.x=element_blank()
        , axis.ticks.x=element_blank()
        , axis.title.y=element_blank()
        , axis.text.y=element_blank()
        , axis.ticks.y=element_blank()
        )+
  ggtitle(label = "", subtitle = "")

#Show the chart
dfArea


#This will save our two plots as pngs to the image folder
ggsave(plot = dfLine, 'Images/StockPriceChartLine.png', device = 'png')
ggsave(plot = dfArea, 'Images/StockPriceChartArea.png', device = 'png', bg = "transparent")
