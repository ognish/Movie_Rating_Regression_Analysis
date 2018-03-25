
#### CHECKING THE GDP OF COUNTRYS

library(gapminder)
library(tidyverse)
library(ggplot2)
library(gganimate)
attach(gapminder)
gapminder %>%
  filter(year=="2007")%>%
  arrange(desc(lifeExp))%>%
  mutate(gdp=pop*gdpPercap)%>%
  select(country, lifeExp, gdp)%>%
  summarise(max_gdp=max(gdp))

gapminder%>%
  filter(year=="2007") %>%
  group_by(country) %>%
  mutate(gdp=pop*gdpPercap) %>%
  select(country,gdp)%>%
  arrange(desc(gdp))


gapminder %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(country) %>% 
  summarise(gdp1952 = first(gdp), gdp2007 = last(gdp)) %>% 
  mutate(cagr = ((gdp2007 / gdp1952) ^ (1/55) - 1) * 100) %>% 
  arrange(desc(cagr)) %>% 
  select(country, cagr)


## Top 10 GDP

top_10 <- c("United States", "United Kingdom", "Germany", "France","Japan", "Italy", "China", "India", "Canada", "Brazil")

## ggplot(data = <DATA>) +
 ## <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

gapminder %>% 
  filter(country %in% top_10) %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  ggplot() +
  geom_line(mapping = aes(x = year, y = gdp, color = country))


### Scaling gdp

gapminder %>% 
  filter(country %in% top_10) %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(country) %>% 
  mutate(scaled_gdp = gdp / first(gdp)) %>% 
  ggplot() +
  geom_line(mapping = aes(x = year, y = scaled_gdp, color = country))


## CAGR


gapminder %>% 
  filter(country %in% top_10) %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(country) %>% 
  summarise(start = first(gdp), end = last(gdp)) %>% 
  mutate(cagr = ((end/start) ^ (1 / 55) - 1) * 100) %>% 
  arrange(desc(cagr)) %>% 
  select(country, cagr)


##CAGR with plot

gapminder %>% 
  filter(country %in% top_10) %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(country) %>% 
  summarise(start = first(gdp), end = last(gdp)) %>% 
  mutate(cagr = ((end/start) ^ (1 / 55) - 1) * 100) %>% 
  arrange(desc(cagr)) %>% 
  select(country, cagr)%>%
  ggplot() +
  geom_col(mapping = aes(x=country, y= cagr))

## Aspirational

library(forcats)
gapminder %>% 
  filter(country %in% top_10) %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(country) %>% 
  summarise(start = first(gdp), end = last(gdp)) %>% 
  mutate(cagr = ((end/start) ^ (1 / 55) - 1) * 100) %>% 
  arrange(desc(cagr)) %>% 
  ggplot() +
  geom_col(mapping = aes(x = fct_reorder(country, cagr), y = cagr)) +
  labs(x = "Country", y = "Cumulative Annual Growth Rate in GDP (1952-2007)") +
  coord_flip()

# Generating an animation GIF

#devtools::install_github("dgrtwo/gganimate")

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size= pop, color=continent, frame=year)) +
  geom_point() +
  scale_x_log10()
gganimate(p)









