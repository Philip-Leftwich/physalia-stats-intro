#___________________________----
# SET UP ---
## Unscramble this jumbled R script ----
# dataset Orange comes preloaded with ggplot2

#__________________________----

# ๐ฆ PACKAGES ----
library(tidyverse) # tidy data packages

#__________________________----

# ๐ CHECK DATA----

Orange # call the dataframe

str(Orange) # check structure of dataframe

#__________________________----

# ๐งน TIDY ----

Orange_filtered <- Orange %>%
  filter(Tree == 1,
         age < 1200)
#__________________________----

# ๐PLOT ----

ggplot(data = Orange_filtered,
       aes(x = age,
           y = circumference))+
  geom_point()+
  geom_line()


