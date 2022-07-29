library(tidyverse)
view(day_wise)
dim(day_wise)
str(day_wise)
head(day_wise)
summarize(day_wise)

Corona_2020 <- day_wise %>% 
     separate(Date, into = 
         c("Month", "Day", "Year"), 
            sep = "\\/", convert = TRUE)

Corona_2020 %>% view()

# Confirmed covid cases between Jan & July 2020
#> Cases per Month
ggplot(data = Corona_2020) +
  geom_smooth(mapping = aes(x = Month, 
        y = Confirmed), color = "orange")
#> As can be seen, the cases kept increasing throughout
#> the months

#> Average deaths per month
ggplot(data = Corona_2020) +
  geom_smooth(mapping = aes(x = Month, 
            y = Deaths), color = "red")

#> Average Recovery per month
ggplot(data = Corona_2020) +
  geom_smooth(mapping = aes(x = Month, 
                  y = Recovered), color = "green")

#> No. of countries reporting per month
ggplot(data = Corona_2020) +
  geom_bar(mapping = aes(x = Month), fill = "purple")

#> Active per month
ggplot(data = Corona_2020) + 
  stat_summary(
    mapping = aes(x = Month, y = Active),
    fun.min = min,
    fun.max = max,
    fun = median
  )

summary(Corona_2020)
