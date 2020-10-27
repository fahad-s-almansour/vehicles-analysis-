# Title
# Name
# Date
# Description (i.e. what kind of data?
# what is the research question being asked here?)

# Data From:
# https://www.kaggle.com/??????????

# load packages
library(tidyverse)
library(rio)
library(scales)
library(GGally)


# load the data
vehicles <- read_csv("vehicles.csv")

# explore
glimpse(vehicles)
summary(vehicles$fuel_h)

# SPLOM (Scatter plot matrix) but with proper data types:
vehicles %>%
  select(-num, -model, -manufacturer) %>%
  ggpairs()

ggplot()

# Analysis on city v
summary(vehicles$fuel_c)
#qplot(fuel_c, data=vehicles, geom="histogram", bins=30)
ggplot()


ggplot()


table(vehicles$cylinders)
qplot(cylinders, data=vehicles, geom="bar", fill=factor(cylinders))
ggplot()

# Analysis on Fuel types
qplot(fl, data=vehicles, geom="bar", fill=fl)
ggplot()

# Analysis Vehicle kind
table(vehicles$size)
#qplot(size, data=vehicles, geom="bar", fill=size)
ggplot()

# engine in highway
ggplot(vehicles, aes(engine, fuel_h)) +
  geom_point(color = "#cb181d", alpha = 0.4, shape = 16)

# by size
ggplot(vehicles, aes(engine, fuel_h, color = size)) +
  geom_point()

# By plot:
ggplot(vehicles, aes(engine, fuel_h)) +
  geom_point() +
  facet_wrap(~ size, nrow = 2)



# Type of drive
ggplot(data = vehicles) +
  geom_smooth(mapping = aes(x = engine, y = fuel_h, linetype = , color=drive))

#Analysis of kg/l compared to engine
plot(fuel_h ~ engine, data = vehicles, col = "blue", pch = 20, cex = 1.5)

#  engine in highway km
ggplot(vehicles, aes(engine, fuel_h)) +
  geom_point(alpha = 0.3) +
  geom_smooth()


# Number of cylinders
ggplot(data = vehicles) +
  geom_point(mapping = aes(x = engine, y = fuel_h, color=drive)) +
  facet_grid(drive ~ cylinders)



#kg/l in highway
hist(vehicles$fuel_h, main = "Driving on highways",
     xlab = ", kg/l")

#kg/l in city
hist(vehicles$fuel_c, main = "Driving on City",
     xlab = "kilograms per liters, kg/l")

#Highway kg/l data
vehicles = lm(fuel_h ~ cylinders + year, data = vehicles)
coef(vehicles)

#City kg/l data
vehicles = lm(fuel_c ~ cylinders + year, data = vehicles)
coef(vehicles)

#summary
summary(automatic.fuel_c)
summary(manual.fuel_c)
