library(forecast)
data_ge <- EOD_GE
data_ge_t <- ts(EOD_GE$Adj_Price, start = c(2000,1), end = c(2017,1), frequency = 1)
#plot(data_ge_t)
summary(data_ge_t)
pacf(data_ge_t) #AR(1), Arima(1,0,0)
diff_ge <- diff(data_ge_t, 1) #YTD change (Decemver-December)
fit_diff_ar_ge <- arima(diff_ge, order = c(1,0,0)) #AR(1) model with PACF lag(1)
fit_diff_arf_ge <- forecast(fit_diff_ar_ge, h=5) #12 is one period (i.e 1 yr)
plot(fit_diff_arf_ge, include = 20)
rm(ames)

