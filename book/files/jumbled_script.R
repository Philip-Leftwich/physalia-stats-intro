#___________________________----
# SET UP ---
## Unscramble this jumbled R script ----
# dataset Orange comes preloaded with ggplot2

#__________________________----

# ๐งน TIDY ----


  filter(Tree == 1,
         Orange_filtered <- Orange %>%
         age < 1200)
#__________________________----

# ๐ฆ PACKAGES ----
library(tidyverse) # tidy data packages

#__________________________----

# ๐ CHECK DATA----

Orange # call the dataframe

str(Orange) # check structure of dataframe

#__________________________----

# ๐PLOT ----

ggplot(data = Orange_filtered,
       geom_point()+
           y = circumference))+
  geom_line()
aes(x = age,
