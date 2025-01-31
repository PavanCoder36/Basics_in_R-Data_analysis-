#codes to visualise data using ggplot2

#load packages
library(tidyverse)
library(ggplot2)

# for 1 categorical variable = use bar chart
# for 1 numerical variable = use histogram
# for 2 numerical var = use scatter plot
# for 1 category and 1 numerical variable = use box plot and density plot
# aes(aesthetics) includes x,y,colour,size
# != means not equal to.

#Example 1
data()
?BOD
BOD
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand)) +
  geom_point(size = 5) +
  geom_line(colour="red")

ggplot(BOD, aes(Time, demand,))+
  geom_point(size = 3)+
  geom_line(colour="purple")+
  theme_bw()

#example 2

data()
view(CO2)
names(CO2)
CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size=3,alpha = 0.5)+
  geom_smooth(method=lm, se= F)+
  facet_wrap(~Type)+
  theme_bw()+
  labs(title= "Concentration of CO2")

#for giving labels we use = labs
#for transperancy of colours we use  = alpha

#example 3
view(CO2)
CO2 %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha=0.5,
             aes(size=conc,
                 colour= Plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()+
  labs(title= "chilled vs non_chilled")

#example 3
#1 showing use of %>%
?facet_wrap

CO2 %>%
  filter(uptake < 40) %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot(aes(colour= Treatment))+
  geom_point(alpha=0.5,
             aes(size=conc,
                 colour= Plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()+
  labs(x= "shocked",
       y= "are you",
    title= "chilled vs non_chilled")


#DENSITY PLOT
view(msleep)
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha=0.2)+
  theme_bw()

msleep %>%
  drop_na(vore) %>%
  ggplot(aes(sleep_total))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()
  
##using filter
msleep %>%
  drop_na(vore) %>%
  filter(vore == "herbi" | vore == "carni") %>%
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha=0.2)+
  theme_bw()

msleep %>%
  drop_na(vore) %>%
  filter(vore %in% c("carni", "herbi")) %>%
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha=0.2)+
  theme_bw()
           
#BAR PLOT
view(starwars)
starwars %>%
  filter(hair_color %in% c("black", "brown")) %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex))+
  geom_bar(aes(fill = sex), alpha = 0.5)+
  facet_wrap(~ hair_color)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none")+
  labs(title = "Gender and hair colour",
       x = "hair color")
#2
starwars %>%
  filter(hair_color %in% c("black", "brown")) %>%
  drop_na(sex) %>%
  ggplot(aes(hair_color, fill = sex))+
  geom_bar(position = "dodge",
           alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none")+
  labs(title = "Gender and hair colour",
       x = "hair color")

