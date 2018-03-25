View(THERMAX_NS_1_)
plot(THERMAX_NS_1_)
summary(THERMAX_NS_1_)
apts <- ts(THERMAX_NS_1_, frequency = 12)
plot(apts)
f <- decompose(apts)
plot(f)
names(f)
plot(f$figure, type = "b")
plot(f)
acf(THERMAX_NS_1_)
pacf(THERMAX_NS_1_) #AR(1) model to be used
fit <- arima (THERMAX_NS_1_$`Adj Close`, order = c(1,0,0), list(order =c(2,1,0), period = 12))
fit
fore1 <- forecast(fit,h=5)
fore1
plot(forecast(fit,h=12),include = 20)
#fore <-predict(fit, n.ahead = 24) 
#fore
#U <- fore$pred + 2 * fore$se
#L <- fore$pred + 2 * fore$se
#ts.plot(THERMAX_NS_1_$`Adj Close`, fore$pred, U, L, col=c(1,2,4,4), lty = c(1,1,2,2))
#legend ("top left", col = c(1,2,4), lty = c(1,1,2), c("actual", "Forecast", "Errors"))
plot(THERMAX_NS_1_$`Adj Close`, type='l', xlim=c(2012, 2018), ylim=c(300,1000))
lines(fore$pred, col="blue")
lines(fore$pred + U, col="red")
lines(fore$pred + L, col="red")


