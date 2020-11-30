library(tidyverse)
library(gganimate)
library(gapminder)

###Question 1: Why does it make sense to have a log10 scale on x axis?
#Answer: A logarithmic scale (or a log10 scale) makes it possible to represent a very large quantity of data spread out over a very wide range of values in an easy and accessible way. With the huge differences in the gdp/capita across the nations of the world, this is an optimal way of showcasing the data.

###Question 2: What country is the richest in 1952 (far right on x axis)? 

#Code Used
gapminder %>%
  filter(year==1952) %>%
  group_by(country, gdpPercap) %>%
  arrange(desc(gdpPercap))

#Answer: When running the code, a top 10 list appears, showing Kuwait in Asia on the first place with “10838. gdpPerCap”


###Question 3: Can you differentiate the continents by color and fix the axis labels?"

# By including “colors=continents” in the first “aes” part of the code, we should be able to get nice colours on the chart.
# By adding the code “labs(x=”GDP/Capita”)” we would change the name of the x axis. We can do the same for our y-axis
# and the final code will look like this:
ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, color = continent , size = pop)) +
  geom_point() +
  scale_x_log10() +
  labs(x = "GDP/Capita")
  labs(y = "Life Expentacny")

###Question 4: What are the five richest countries in the world in 2007?

# We use the same code as in Q1, but we change the year to 2007. This is now our new code.
gapminder %>%
  filter(year==2007) %>%
  group_by(country, gdpPercap) %>%
  arrange(desc(gdpPercap))
# This gives us a list of the richest countries. In order, the top 5 are: Norway, Kuwait, Singapore, United States and Ireland 

###Quesion 5: Can you add a title to one or both of the animations above that will change in sync with the animation? 

anim2 <- ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10() + # convert x to log scale
  transition_time(year)
anim2

anim2 + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  view_follow(fixed_y = TRUE)

###NB!
# Question 6+7 have not been answered. Time is right now Monday 23:18, and I have yet to make the other assignment (describing my project).
# Therefore, I cannot provide answers to the rest of the questions. I struggled for an hour and decided to give up.