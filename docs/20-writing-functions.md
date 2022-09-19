# (PART\*) DRY code {.unnumbered}


# Functions 






Most of the time when we work in R, we will use functions; often pre-written functions that we access from baseR or installed packages. But you can also write your own functions. Eventually you could even turn a collection of your own functions into a package (for yourself or others).

**Functions** make it easy to use sets of code instructions repeatedly (without filling our scripts with the code underlying the function) and help us carry out multiple tasks in a single step without having to go through the details of how the steps are executed.

If you need a refresher on what makes up a function [check here][last time](#functions).

## Structuring a function

R makes it easy to create user defined functions by using `function()`. Here is how it works:


```r
my_function_name <- function(my_args) {
  # code to run
  # return (some value)
}
```

* Give your function an object name and assign the function to it, e.g. `my_function_name <- function()`.

* Within the parentheses you specify inputs and arguments just like how pre-written functions work, e.g. `function(my_args)`.

* Next, put all the code you want your function to execute inside curly brackets like this: `function(my_args) {code to run}`

* Use `return()` to specify what you want to your function to output once it is done running the code.


## Activity 1: Understand the function

Here is a very simple function. Can you guess what it does?


```r
add_one <- function(input_data) {
  return(input_data + 1)
}
```


```r
add_one(10)
```

```
## [1] 11
```

What value did you get when running the function above? <input class='webex-solveme nospaces' size='2' data-answer='["11"]'/>

Now try applying your function to this vector:


```r
number_series <- c(1,5,10)
```

You should see it worked on *each element* inside the vector. This emphasises that R is a vector based language (it will by default apply functions on all elements in an object). 

### Activity 2: Write your own function:

* I’ve started writing a function for you that will square values, sum them and divide by `n-1`. To take the square root, we use the `sqrt()` function.

* Complete this function by filling in input_data for the `sqrt()`, and then filling in the remaining empty parentheses with the appropriate object names.

* Now test your function on the `number_series` vector (or any other vector you like).

What is the function retruning when applied to a vector? <select class='webex-select'><option value='blank'></option><option value=''>standard deviation</option><option value='answer'>variance</option><option value=''>sum of squares</option></select>


<div class="panel panel-default"><div class="panel-heading"> Task </div><div class="panel-body"> 
Finish writing the function below </div></div>
 
```

# Use the instructions above to complete the function below
variance <- function(input_data){
  square <- sqrt(__)
  ss <- sum(__)
  variance <- (__/(length(__)-1))
  return(__)
}

# Use vector (or make a new one) and try out your new function


variance(number_series)

```


<button id="displayTextunnamed-chunk-8" onclick="javascript:toggle('unnamed-chunk-8');">Show Solution</button>

<div id="toggleTextunnamed-chunk-8" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
variance <- function(input_data){
     square <- sqrt(input_data)
     ss <- sum(square)
     variance <- (ss/length(input_data-1))
     return(variance)
}
```
</div></div></div>

<div class="info">
<p>A general rule of thumb. If you end up repeating a line of code more than three times in a script - you should write a function to do the work instead. And write clear comments on its use!</p>
<p>Why?</p>
<p>It reduces the numbers of lines of code in your script, it reduces the amount of repetition in the code, if you need to make changes you can change the function without having to hunt through all of your code.</p>
<p>A really good way to organise your functions is to organise them into a separate script to the rest of your analysis. Write functions in a separate script and use source("scripts/functions.R")</p>
</div>

## Argument defaults

This is an example of a very simple function that just prints the string "Hello World" whenever you type the function `say_hello()`


```r
say_hello <- function(){
  paste("Hello World") 
}

say_hello()
```

```
## [1] "Hello World"
```

### Activity 3: Understand arguments and defaults

<div class="panel panel-default"><div class="panel-heading"> Task </div><div class="panel-body"> 
What happens when you try to put something in the brackets when **using** this function?
  
e.g. say_hello("Phil")
 </div></div>

<button id="displayTextunnamed-chunk-12" onclick="javascript:toggle('unnamed-chunk-12');">Show Solution</button>

<div id="toggleTextunnamed-chunk-12" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">
Error in say_hello( or something similar, this function has not been set with any arguments, therefore it doesn't know what to do with any values provided to it. </div></div></div>

Now lets try a similar function, but we include an argument:


```r
say_morning <- function(x){
  paste("Good morning", x)
}

#  what about this one?
say_morning("Phil")
```

```
## [1] "Good morning Phil"
```

<div class="panel panel-default"><div class="panel-heading"> Task </div><div class="panel-body"> 
What happens when you DO NOT put something in the brackets when using this function? </div></div>

<button id="displayTextunnamed-chunk-15" onclick="javascript:toggle('unnamed-chunk-15');">Show Solution</button>

<div id="toggleTextunnamed-chunk-15" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
Error in paste("Good morning", x) : 
  argument "x" is missing, with no default
```
</div></div></div>

So that was an example where we included an argument for our function. But now it requires a value be provided in order to work. 

#### Argument defaults

However, you are probably used to the idea that many functions have "default" values for arguments, and we can easily set these.


```r
say_morning_default <- function(name = "you"){
  paste("Good morning", name)
}

say_morning_default()
```

```
## [1] "Good morning you"
```

<div class="try">
<p>There is now a default value supplied to the argument, but this should still be able to changed when running the function. Try it!</p>
</div>


## Conditonal functions

Let's make a function that reports p-values in APA format (with "p = [rounded value]" when p >= .001 and "p < .001" when p < .001).

You can add a default value to any argument. If that argument is skipped, then the function uses the default argument.

First we could make a function that rounds any value to three digits.


```r
report_p <- function(p, digits = 3) {
      roundp <- round(p, digits)
    reported <-  paste("p =", roundp)
    
    return(reported)
}
```

But we would like this to have a conditional response as well: so we need and `if` `else` statement (or `if_else`)

<div class="panel panel-default"><div class="panel-heading"> Task </div><div class="panel-body"> 
Can you write this function? to print the statements required above?
 </div></div>


<button id="displayTextunnamed-chunk-20" onclick="javascript:toggle('unnamed-chunk-20');">Show Solution</button>

<div id="toggleTextunnamed-chunk-20" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body"><div class="tab"><button class="tablinksunnamed-chunk-20 active" onclick="javascript:openCode(event, 'option1unnamed-chunk-20', 'unnamed-chunk-20');">Base R</button><button class="tablinksunnamed-chunk-20" onclick="javascript:openCode(event, 'option2unnamed-chunk-20', 'unnamed-chunk-20');"><tt>tidyverse</tt></button></div><div id="option1unnamed-chunk-20" class="tabcontentunnamed-chunk-20">

```r
 report_p <- function(p, digits = 3) {
     reported <- if_else(p < 0.001,
             "p < 0.001",
             paste("p=", round(p, digits)))
     
     return(reported)
 }
```
</div><div id="option2unnamed-chunk-20" class="tabcontentunnamed-chunk-20">

```r
report_p <- function(p, digits = 3) {
  if (p < .001) {
    reported = "p < .001"
  } else {
    roundp <- round(p, digits)
    reported = paste("p =", roundp)
  }
  
  return(reported)
}
```
</div><script> javascript:hide('option2unnamed-chunk-20') </script></div></div></div>



## Scope

Note that any objects created *inside* a function, stay in the function. So it is possible to have variables with the same name (one inside a function, one in the R environment). Changing the values of one will have **no effect** on the other. 

## Warnings and errors

<div class="try">
<p>What happens when omit an argument for p, set the value to 1.5 or a character "a"?</p>
</div>

Sometimes the function will not run, in the first example because we did not provide an argument default. 

For `p = 1.5` it probably *shouldn't* run (p = 1.5 makes no sense), but it does! 

For `p = "a"` there is a warning but perhaps not a very intuitive one. 

We can make our own custom/specific warnings, try this and run it with the arguments above again! 



```r
 report_p <- function(p, digits = 3) {
   
  if (!is.numeric(p)) stop("p must be a number")
  if (p <= 0) warning("p-values cannot less 0")
  if (p >= 1) warning("p-values cannot be greater than 1")
   
     reported <- if_else(p < 0.001,
             "p < 0.001",
             paste("p=", round(p, digits)))
     return(reported)
}
```

## Anonymous functions

Anonymous functions are ones where the function definiton is not bound to an R object. That is the function may be created and used but never assigned to a variable. We don't normally encounter these out in the "wild", but may be quite common when used with Iteration (see next chapter).


```r
function(input_data) {
  return(input_data + 1)
}
```


## Activity 3 : Stretch Exercise

We are going to try and write a custom function called `find_largest_male()`, it will be used to identify the largest male *Drosophila* from a small dataset. 


```r
# Make some fake data into a tibble

vial <- (c((1:10),(1:10)))
sex <- (c(rep("male",10),rep("female", 10)))
weight_mg <- c(rnorm(10, mean=0.2, sd=0.02), rnorm(10, mean=0.21, sd=0.01))

dros_weight <- tibble(vial, sex, weight_mg)
```

#### Step 1.

What functions would you use to extract the heaviest male from this dataset? Try and think that through first.

<button id="displayTextunnamed-chunk-25" onclick="javascript:toggle('unnamed-chunk-25');">Show Solution</button>

<div id="toggleTextunnamed-chunk-25" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
  dros_weight %>% 
    filter(sex == "male") %>% 
    arrange(., desc(weight_mg)) %>% 
    head(., n=1)
```

<div class="kable-table">

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> vial </th>
   <th style="text-align:left;"> sex </th>
   <th style="text-align:right;"> weight_mg </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> male </td>
   <td style="text-align:right;"> 0.2332628 </td>
  </tr>
</tbody>
</table>

</div>
</div></div></div>

#### Step 2. 

Abstract your lines of code to make a function. How could you remove the data and introduce a placeholder instead?

<button id="displayTextunnamed-chunk-26" onclick="javascript:toggle('unnamed-chunk-26');">Show Solution</button>

<div id="toggleTextunnamed-chunk-26" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
find_largest_male <- function(df){ 
  df %>% 
    filter(sex == "male") %>% 
    arrange(., desc(weight_mg)) %>% 
    head(., n=1)
}
```
</div></div></div>


#### Step 3.

Now we have a basic function we can work to refine and extend it. 

What if we made a function that could pick the largest Drosophila overall, or filter by male or female depending on what we need?

Could we extend it to return more than one value if requested?

To make an argument except more than one value as the potential default at once use `c("male", "female")`


<button id="displayTextunnamed-chunk-27" onclick="javascript:toggle('unnamed-chunk-27');">Show Solution</button>

<div id="toggleTextunnamed-chunk-27" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
find_largest_fly <- function(df,  n=1, s=c("male", "female") ){ 
  df %>% 
    filter(sex == s) %>% 
    arrange(., desc(weight_mg)) %>% 
    head(., n=n)
}
```
</div></div></div>

#### Step 4. Stretch exercise

Can you add any useful warning messages? Perhaps if a fruitfly weight is above 0.4mg that this is an unusual value? Or warnings against the wrong types of data being supplied `is.numeric`? 

## Activity 4: Custom ggplot themes

It is often the case that we start to default to a particular 'style' for our figures, or you may be making several similar figures within a research paper. Creating custom functions can extend to making our own custom ggplot themes. You have probably already used theme variants such as `theme_bw()`, `theme_void()`, `theme_minimal()` - these are incredibly useful, but you might find you still wish to make consistent changes. 

Here is a plot we can make with the `dros_weight` tibble:


```r
plot <- dros_weight %>% 
  ggplot(aes(x=sex,
         y=weight_mg))+
  geom_jitter(width = 0.1)

plot
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-28-1.png" width="100%" style="display: block; margin: auto;" />

With the addition of a title and `theme_classic()` we can improve the style quickly


```r
plot+
  ggtitle("Comparison of weights (mg) between \nmale and female Drosophila")+
  theme_classic()
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-29-1.png" width="100%" style="display: block; margin: auto;" />

But I **still** want to make some more changes, rather than do this work for one figure, and potentially have to repeat this several times for subsequent figures, I can decide to make a new function instead. See [here](https://ggplot2.tidyverse.org/reference/theme.html) for a full breakdown of the arguments for the `theme()` function. 

<div class="info">
<p>Note when using a pre-set theme, and then modifying it further, it is important to get the order of syntax correct e.g</p>
<p>theme_classic + theme() # is correct</p>
<p>theme() + theme_classic() # will not work as intended</p>
</div>


```r
# custom theme sets defaults for font and size, but these can be changed without changing the function
theme_custom <- function(base_size=12, base_family="serif"){
  theme_classic(base_size = base_size, 
                base_family = base_family,
                ) +
# update theme minimal 
theme(
  # specify default settings for plot titles - use rel to set titles relative to base size
  plot.title=element_text(size=rel(1.5),
      face="bold",
      family=base_family),
  #specify defaults for axis titles
  axis.title=element_text(
    size=rel(1),
    family=base_family),
  # specify position for y axis title
  axis.title.y=element_text(margin = margin(r = 10, l= 10)),
  # specify position for x axis title
  axis.title.x = element_text(margin = margin( t = 10, b = 10)),
  # set major y grid lines
  panel.grid.major.y = element_line(colour="gray", size=0.5),
  # add axis lines
  axis.line=element_line(),
   # Adding a 0.5cm margin around the plot
  plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"),    
   # Setting the font for the legend text
  legend.text = element_text(face = "italic"),   
    # Removing the legend title
          legend.title = element_blank(),    
   # Setting the position for the legend - 0 is left/bottom, 1 is top/right
          legend.position = c(0.9, 0.8)             
)
  
}
```

With this function set, I can now use it for as many figures as I wish. To use it in the future I should probably save it in a unique script, with a clear title and comments for future use. 

I could then easily use `source("custom_theme_function.R")` to make this available to any scripts I was using. 


```r
plot+
theme_custom()
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-32-1.png" width="100%" style="display: block; margin: auto;" />

<div class="info">
<p>Functions are about 'abstracting' a command, so it can be used more than once. If you are having trouble writing a function, start by writing a standard set of commands as you would to solve a specific problem. Then work backwards to turn this into a function.</p>
</div>


## Writing Packages

You should be familiar by now with the idea that R packages add data and functions to your workspace. They are bundles of code that anyone can write, most commonly you will be downloading packages from CRAN. However development stage packages can also be downloaded directly from GitHub. 

In the previous section we walked through some very basic writing of new functions. We can save these as R scripts and move them from project to project. Or we could choose to write them into a documented R package. 
[This tutorial](https://ourcodingclub.github.io/tutorials/writing-r-package/) shows you just how to do that. Writing packages is a useful thing to do, even if you think the only person that will ever use them is yourself, as you then more easily access these functions across different workspaces and projects. 


## Resources

* [R4DS: Functions](https://r4ds.had.co.nz/functions.html) 

# Iteration

We’ve seen how to write a function and how they can be used to create concise re-usable operations that can be applied multiple times in a script without having to copy and paste, but where functions really come into their own is when combined with iteration. Iteration is the process of running the same operation on a group of objects, further minimising code replication. 

## Simple iteration functions

### `rep()`

The function `rep()` lets you repeat the first argument a set number of times.


```r
rep(1:5, 5)

rep(c("Adelie", "Gentoo", "Chinstrap"), 2)
```

```
##  [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
## [1] "Adelie"    "Gentoo"    "Chinstrap" "Adelie"    "Gentoo"    "Chinstrap"
```

The default for the amount of repetition is `times = ` it will print the entire vector start to finish THEN repeat.

If the second argument is a vector with the same number of elements as the *first* vector, then it will repeat to the specified values for each


```r
rep(c("Adelie", "Gentoo", "Chinstrap"), c(2, 1, 3))
```

```
## [1] "Adelie"    "Adelie"    "Gentoo"    "Chinstrap" "Chinstrap" "Chinstrap"
```

Or if you use the argument `each` then it will rep all of the first element *first* followed by the second etc.



```r
rep(c("Adelie", "Gentoo", "Chinstrap"), each = 3)
```

```
## [1] "Adelie"    "Adelie"    "Adelie"    "Gentoo"    "Gentoo"    "Gentoo"   
## [7] "Chinstrap" "Chinstrap" "Chinstrap"
```
What do you think will happen if you set both times to 3 and each to 2?


```r
rep(c("Adelie", "Gentoo", "Chinstrap"), times = 2, each = 3)
```

<button id="displayTextunnamed-chunk-38" onclick="javascript:toggle('unnamed-chunk-38');">Show Solution</button>

<div id="toggleTextunnamed-chunk-38" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```
##  [1] "Adelie"    "Adelie"    "Adelie"    "Gentoo"    "Gentoo"    "Gentoo"   
##  [7] "Chinstrap" "Chinstrap" "Chinstrap" "Adelie"    "Adelie"    "Adelie"   
## [13] "Gentoo"    "Gentoo"    "Gentoo"    "Chinstrap" "Chinstrap" "Chinstrap"
```
</div></div></div>


### `seq()`

The function `seq()` is useful for generating a sequence of numbers with some pattern.

Use `seq()` to create a vector of the integers 0 to 10.



```r
seq(1,5)
```

```
## [1] 1 2 3 4 5
```

This is initially very similar to just making a vector with


```r
c(1:5)
```

```
## [1] 1 2 3 4 5
```

But with `seq` we have extra functions. You can set the by argument to count by numbers other than 1 (the default). Use `seq()` to create a vector of the numbers 0 to 100 by 10s.


```r
seq(0, 100, by = 10)
```

```
##  [1]   0  10  20  30  40  50  60  70  80  90 100
```


We also have the argument `length.out`, which is useful when you want to know how to many steps to divide something into


```r
seq(0, 100, length.out = 12)
```

```
##  [1]   0.000000   9.090909  18.181818  27.272727  36.363636  45.454545
##  [7]  54.545455  63.636364  72.727273  81.818182  90.909091 100.000000
```

### `replicate()`

Replicate is our first example of a function whose purpose is to iterate *other* functions

For example the `rnorm` function generates numbers from a normal distribution.

Nesting this inside the `replicate()` function will repeat this command a specified number of times


```r
replicate(3, # times to replicate function
          expr = rnorm(n = 5, 
                       mean = 1,
                       sd = 1))
```

```
##             [,1]      [,2]       [,3]
## [1,]  2.18417515 1.3704866  0.8431597
## [2,] -0.56207140 1.4162509  0.5554005
## [3,]  2.37627587 0.6611912 -0.8702782
## [4,]  0.09366455 1.2399915  2.3235088
## [5,]  1.86069439 1.5819641  3.0887671
```


Here we will introduce two approaches to iterative operations - using for loops and using the package `purrr`.

1. for loops iterate code across a series of inputs, but are less common in R than in other programming languages. Nevertheless, we introduce them here as a learning tool and reference

2. The `purrr` package is the tidyverse approach to iterative operations - it works by “mapping” a function across many inputs (values, columns, datasets, etc.)


## For Loops

For loops are an **essential** part of many

A for loop has three core parts:

1) The sequence of items to iterate through

2) The operations to conduct per item in the sequence

3) The container for the results (optional)

The basic syntax is: for (item in sequence) {do operations using item}. Note the parentheses and the curly brackets. The results could be printed to console, or stored in a container R object.

```
for(i in list){
    # PERFORM SOME ACTION
}
```

A simple for loop **example** is below. For every number in the vector add 2. There is no *container object* here, the results of the function are printed directly into the console.  


```r
for (num in c(1,2,3,4,5)) {  # the SEQUENCE is defined (numbers 1 to 5) and loop is opened with "{"
  print(num + 2)             # The OPERATIONS (add two to each sequence number and print)
}                            # The loop is closed with "}"                            
```

```
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
```

```
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
```

So let's make a slightly more complicated function - first we are making a new tibble, first we have four vectors - made of 10 numbers each randomly generated to be roughly close to a 0 mean with a s.d. of 1. Then we combine them to make a tibble


```r
# a simple tibble
df <- tibble(
  a =  rnorm(10),
  b =  rnorm(10),
  c =  rnorm(10),
  d = rnorm(10)
)
```

Each vector is randomly generated so the actual averages will be slightly different


```r
median(df$a)
# [1] 0.3085154
median(df$b)
# [1] 0.5429483
median(df$c)
# [1] -0.5137691
median(df$d)
# [1] 0.04415608
```

So the above code works, but it is repetitive, applying the same function again and again. Below we have a simple for loop 


```r
output <- vector("double", ncol(df))  # 1. output having a predefined empty list of the right size works best, we choose to make the vector "double" specifying that it is empty and ready to receive number values. 

for (i in seq_along(df)) {            # 2. sequence - determines what to loop over - here we are looping along df, rather than down the length of each vector
  
  output[[i]] <- median(df[[i]])      # 3. body - each time the loop runs it allocates a value to output, 
}
output
# [1]  0.30851540  0.54294832 -0.51376911  0.0441560
```

```
## [1]  0.14114981 -0.27998485  0.07408331  0.76458783
```

### Exercise for For Loops

This part of the exercise is a real world example of using simple `for()` loops to create graphs. This data comes from the [Living Planet Index](https://livingplanetindex.org/home/index), which holds data on various vertebrate species collected from 1974 to 2014. 


```{=html}
<a href="https://raw.githubusercontent.com/UEABIO/data-sci-v1/main/book/files/LPI_data_loops.csv">
<button class="btn btn-success"><i class="fa fa-save"></i> Download LPI data as csv</button>
</a>
```

First we should import the data:




```r
LPI <- read_csv("data/LPI_data_loops.csv")
```

Here is an example of a graph we can make from the data looking at Griffon Vulture changes in numbers over time. 


```r
vultureITCR <- LPI %>% 
  filter(Common.Name == "Griffon vulture / Eurasian griffon") %>%
  filter(Country.list==c("Croatia", "Italy"))

vulture_scatter <- ggplot(vultureITCR, aes(x = year, y = abundance, colour = Country.list)) +
    geom_point(size = 2) +  
  # Changing point size
    geom_smooth(method = lm, aes(fill = Country.list)) + 
  # Adding a linear model fit and colour-coding by country
    scale_fill_manual(values = c("#EE7600", "#00868B")) +               
  # Adding custom colours
    scale_colour_manual(values = c("#EE7600", "#00868B"),               
                        # Adding custom colours
                        labels = c("Croatia", "Italy")) +               
  # Adding labels for the legend
    ylab("Griffon vulture abundance\n") +                             
    xlab("\nYear")  +
		theme_bw() 

vulture_scatter
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-51-1.png" width="100%" style="display: block; margin: auto;" />

We can use custom themes (like the one you made earlier) to quickly update figures


```r
vulture_scatter+theme_custom()
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-52-1.png" width="100%" style="display: block; margin: auto;" />

Now let's take a look at using functions and loops to help us build figures. 


```r
LPI_UK <- filter(LPI, Country.list == "United Kingdom")

# Pick 4 species and make scatterplots with a simple regression model fits that show how the population has varied through time

# Careful with the spelling of the names, it needs to match the names of the species in the LPI.UK dataframe

house_sparrow <- filter(LPI_UK, Common.Name == "House sparrow")
great_tit <- filter(LPI_UK, Common.Name == "Great tit")
corn_bunting <- filter(LPI_UK, Common.Name == "Corn bunting")
meadow_pipit <- filter(LPI_UK, Common.Name == "Meadow pipit")
```

So now we have four separate R objects holding data from four bird species, our standard approach might then be to make four figures looking at abundance over time. 


```r
house_sparrow_scatter <- ggplot(house_sparrow, aes (x = year, y = abundance)) +
    geom_point(size = 2, colour = "#00868B") +                                                
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = "House sparrow")

great_tit_scatter <- ggplot(great_tit, aes (x = year, y = abundance)) +
    geom_point(size = 2, colour = "#00868B") +                                                
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = "Great tit")

corn_bunting_scatter <- ggplot(corn_bunting, aes (x = year, y = abundance)) +
    geom_point(size = 2, colour = "#00868B") +                                                
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = "Corn bunting")

meadow_pipit_scatter <- ggplot(meadow_pipit, aes (x = year, y = abundance)) +
    geom_point(size = 2, colour = "#00868B") +                                                
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = "Meadow pipit")
```

If we want to look at all four plots at once we can use the layout functions from the package `patchwork`. 


```r
# put at the top of your script
library(patchwork)

layout <- "AABB
           CCDD"

house_sparrow_scatter+
  great_tit_scatter+
  corn_bunting_scatter+
  meadow_pipit_scatter+
  plot_layout(design=layout)
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-55-1.png" width="100%" style="display: block; margin: auto;" />

This is ok, but arguably still requires a lot of code repetition. We have used the same lines of code four times to recreate four plots that are functionally the same. If we want to make any changes to the look of our plots we have to make four separate edits & mistakes can easily creep in. 

If we want to apply a loop, then the easiest thing is to first make our objects into an R list:


```r
Sp_list <- list(house_sparrow, great_tit, corn_bunting, meadow_pipit)
```

Then loop down the length of our list:


```r
my_plots <- list(length(Sp_list))

for (i in 1:length(Sp_list)) {                                    
  # For every item along the length of Sp_list we want R to perform the following functions
  data <- as.data.frame(Sp_list[i])                               
  # Create a dataframe for each species
  sp.name <- unique(data$Common.Name)                             
  # Create an object that holds the species name, so that we can title each graph
  plot <- ggplot(data, aes (x = year, y = abundance)) +               
    # Make the plots and add our customised theme
    geom_point(size = 2, colour = "#00868B") +                              
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +        
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = sp.name)
 
   # makes a list of all the plots generates
  my_plots[[i]] <- plot 
  
  # prints each plot out as it is made
  print(plot) 
}
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-57-1.png" width="100%" style="display: block; margin: auto;" /><img src="20-writing-functions_files/figure-html/unnamed-chunk-57-2.png" width="100%" style="display: block; margin: auto;" /><img src="20-writing-functions_files/figure-html/unnamed-chunk-57-3.png" width="100%" style="display: block; margin: auto;" /><img src="20-writing-functions_files/figure-html/unnamed-chunk-57-4.png" width="100%" style="display: block; margin: auto;" />

So now we have a new object `my_plots` which is a list containing the four plots. This loop allowed us to code the details of our figures once, then iterate across four different groups.


```r
wrap_plots(my_plots)+
  plot_layout(design=layout) 
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-58-1.png" width="100%" style="display: block; margin: auto;" />

```r
#wrap_plots function from patchwork can take a list of ggplots
```

What if you want to write a loop to save all four plots at once - can you modify the script to do this?


```r
for (i in 1:length(Sp_list)) {                                    
  # For every item along the length of Sp_list we want R to perform the following functions
  data <- as.data.frame(Sp_list[i])                               
  # Create a dataframe for each species
  sp.name <- unique(data$Common.Name)                             
  # Create an object that holds the species name, so that we can title each graph
  plot <- ggplot(data, aes (x = year, y = abundance)) +               
    # Make the plots and add our customised theme
    geom_point(size = 2, colour = "#00868B") +                                                
    geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
    theme_custom() +
    labs(y = "Abundance\n", x = "", title = sp.name)
  
    if(i %% 1==0){    # The %% operator is the remainder, this handy if line prints a number every time it completes a loop
    print(i)
    }
# use paste to automatically add filename
  ggsave(plot, file=paste("figure/", sp.name, ".png", sep=''), dpi=900) 
}
```


### Iteration in R

Loops are a fundamental part of programming in many languages - that's why they have been introduced as a concept with examples here. However in R, Loops are used much less often than in other languages. That is because R is a 'vector based language', something we often take for granted. But what does that mean?

Here's an example - in the below written for R if we make a vector then apply a function to it, then it is applied to each element of the function, this is something we take for granted in R, but simply doesn't exist in languages like C++

```
x <- c(2,4,6,8,10)

x/2

# [1] 1 2 3 4 5

```

Instead for C++ we would be required to write a loop, in order to explicitly request that the division is applied to each element of the vector

```
for(i in seq_along(x)){
x[i] = x[i]/2
}
x

# [1] 1 2 3 4 5

```

A lot of functions in R are already vectorised and you don't even have to think about this concept. When we want more control over how this vectorization is applied, we have used the function `group_by()` It allows us to subset our data into hidden vectors, then command R to perform subsequent `dplyr` functions on each group separately. Because of the combined functionality of R's vectorization and dplyr's data tools you might find there is little need for loops. When we *do* wish to apply a function that isn't vectorize in the way we want - then tidyverse has an answer to this as well - purrr @R-purrr and the `map()` function

### Learn to purrr

There are also a few other advantages to using `purrr::map()` - you can use it with pipes %>%, it handles errors better than normal for loops, and the syntax is quite clean and simple! 

**Remember** purrr is a very tidyverse focused method of iteration, so understanding for loops can be useful if you end up learning other programming languages in the future. 

**purrr** is more focused on the function, and less obviously focused on the looping aspect, as you might be able to see below.



The basic syntax is map(`.x` = SEQUENCE, `.f` = FUNCTION, OTHER ARGUMENTS). In a bit more detail:

* `.x` = are the inputs upon which the .f function will be iteratively applied - e.g. a vector of jurisdiction names, columns in a data frame, or a list of data frames

* `.f` = is the function to apply to each element of the .x input - it could be a function like print() that already exists, or a custom function that you define. The function is often written after a tilde ~ (details below).
A few more notes on syntax:

* If the function needs no further arguments specified, it can be written with no parentheses and no tilde (e.g. `.f = mean`). To provide arguments that will be the same value for each iteration, provide them within `map()` but outside the `.f = argument`, such as the `na.rm = T` in `map(.x = my_list, .f = mean, na.rm=T)`.

* You can use `.x` (or simply `.`) within the `.f = function` as a placeholder for the `.x` value of that iteration

* Use tilde syntax (`~`) to have greater control over the function - write the function as normal with parentheses, such as: `map(.x = my_list, .f = ~mean(., na.rm = T))`. Use this syntax particularly if the value of an argument will change each iteration, or if it is the value `.x` itself.

**The output of using` map()` is a list** - a list is an object class like a vector but whose elements can be of different classes. So, a list produced by `map()` could contain many data frames, or many vectors, many single values, or even many lists! There are alternative versions of `map()` explained below that produce other types of outputs (e.g. `map_dfr()` to produce a data frame, `map_chr()` to produce character vectors, and `map_dbl()` to produce numeric vectors).

Basic `map()` will *always* return a list of values

* `map_lgl()` returns a logical
* `map_int()` returns an integer vector
* `map_dbl()` returns a double vector
* `map_chr()` returns a character vector
* `map_df()` returns a data frame



```r
# Apply n_distinct to all variables, returning a double (numeric) for each
map_dbl_result <- LPI %>% 
  map_dbl(n_distinct)

# Print out result
map_dbl_result

# Print out type of result
typeof(map_dbl_result)
```

```
##         ...1        Class        Order  Common.Name Country.list       Region 
##       182086           14          100         2947          357            9 
##       system        biome        realm         year    abundance 
##            4           33           16           45        30872 
## [1] "double"
```


```r
# Apply n_distinct to all variables, returning a dataframe
map_df_result <- LPI %>% 
  map_df(n_distinct)

# Print out result
map_df_result

# Check if output is a data frame (tibble in this case)
is_tibble(map_df_result)
```

<div class="kable-table">

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> ...1 </th>
   <th style="text-align:right;"> Class </th>
   <th style="text-align:right;"> Order </th>
   <th style="text-align:right;"> Common.Name </th>
   <th style="text-align:right;"> Country.list </th>
   <th style="text-align:right;"> Region </th>
   <th style="text-align:right;"> system </th>
   <th style="text-align:right;"> biome </th>
   <th style="text-align:right;"> realm </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> abundance </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 182086 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 2947 </td>
   <td style="text-align:right;"> 357 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 30872 </td>
  </tr>
</tbody>
</table>

</div>

```
## [1] TRUE
```


## Reading and writing lots of files

### Writing


```r
LPI_list <- LPI %>% 
  group_split(Class)
```


I’ll also use `purrr::map()` to take the character values from the Class column itself for assigning names to the list. `map()` transforms an input by applying a function to each element of the input, and then returns a vector the same length as the input. In this immediate example, the input is the list_of_dfs and we apply the function `dplyr::pull()` to extract the Class variable from each data frame. We then repeat this approach to convert Class into character type with `as.character()` and take out a single value with `unique()`:


```r
  names(LPI_list) <- LPI_list %>%
  purrr::map(~pull(.,Class)) %>% # Pull out Species variable
  purrr::map(~as.character(.)) %>% # Convert factor to character
  purrr::map(~unique(.)) # Set this as names for list members

names(LPI_list)
```
```
 [1] "Actinopterygii"            "Amphibia"                  "Aves"                      "Cephalaspidomorphi"       
 [5] "Cetacea"                   "Chondrichthyes"            "Elasmobranchii"            "Holocephali"              
 [9] "Mammalia"                  "Myxini"                    "Perciformes"               "Reptilia"                 
[13] "Sarcopterygii"             "Testudinidae"              "updated by Nancy - Feb/02"

```

Exporting the list of data frames into multiple CSV files will take a few more lines of code, but is relatively straightforward. There are three main steps:

1. Define a function that tells R what the names for each CSV file should be, which I’ve called output_csv() below. The data argument will take in a data frame whilst the names argument will take in a character string that will form part of the file name for the individual CSV file.

2. Create a named list where the names match the arguments of the function you’ve just defined (data and names), and should contain the objects that you would like to pass through to the function for the respective arguments. In this case, list_of_dfs will provide the three data frames, and names(list_of_dfs) will provide the names of those three data frames. This is necessary for running pmap(), which in my view is basically a super-powered version of map() that lets you iterate over multiple inputs simultaneously.

3. `pmap()` will then iterate through the two sets of inputs through output_csv() (the inputs are used as arguments), which then writes the three CSV files with the file names you want. For the “writing” function, you could either use write_csv() from readr (part of tidyverse) or fwrite() from data.table, depending on your workflow / style.



```r
# Step 1
# Define a function for exporting csv with the desired file names and into the right path
output_csv <- function(data, names){ 
    folder_path <- "../data/"
    
    write_csv(data, paste0(folder_path, "class-", names, ".csv"))
  }

# Step 2
list(data = LPI_list,
     names = names(LPI_list)) %>% 
  
# Step 3
  purrr::pmap(output_csv) 
```



### Reading

The method for reading CSV files into a directory is slightly different, as you’ll need to find a way to identify or create a character vector of names of all the files that you want to load into R. To do this, we’ll use `list.files()`, which produces a character vector of the names of files or directories in the named directory:


```r
list.files(path="../data/", pattern = "*.csv", full.names = T)
```
```
 [1] "class-Actinopterygii.csv"     "class-Amphibia.csv"           "class-Aves.csv"               "class-Cephalaspidomorphi.csv"
 [5] "class-Cetacea.csv"            "class-Chondrichthyes.csv"     "class-Elasmobranchii.csv"     "class-Holocephali.csv"       
 [9] "class-Mammalia.csv"           "class-Myxini.csv"             "class-Perciformes.csv"        "class-Reptilia.csv"          
[13] "class-Sarcopterygii.csv"      "class-Testudinidae.csv"

```

The code below takes that list of files, pipes it to a `map_df()` function that runs read_csv on each file, then outputs everything toa dataframe


```r
LPI <- list.files(path="../data/", pattern = "*.csv", full.names = T) %>% 
     map_df(~read_csv(.))
```

I think `map_df` is extremely useful because you can feed it’s output directly into a ggplot2 call:


```r
LPI %>% 
  map_df(n_distinct) %>% 
  # Convert to longer format
  pivot_longer(everything(), names_to = "variable", values_to = "count") %>%
  # Start plotting
  ggplot(aes(x = variable, y = count)) +
  geom_col() +
  coord_flip()
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-67-1.png" width="100%" style="display: block; margin: auto;" />


Now you have a simple grasp of `purrr` you should see that we have a list containing species objects, and an anonymous function ~ggplot on the right. We can use this to quickly make four plots, just like we did with our for loops. 

the `map()` function takes a list or vector as the first argument, and a function (prefixed by ~) as the second argument, it will then apply the function to each element of the list or vector. It will then return the output as new list. Simple! 


```r
my_plots_2 <- 
  map(Sp_list, ~ ggplot(., aes (x = year, y = abundance)) +              
                      geom_point(size = 2, colour = "#00868B") +                                                
                      geom_smooth(method = lm, colour = "#00868B", fill = "#00868B") +          
                      theme_custom() +
                      labs(y = "Abundance\n", x = "")) 


wrap_plots(my_plots_2)+plot_layout(design=layout)
```

<img src="20-writing-functions_files/figure-html/unnamed-chunk-68-1.png" width="100%" style="display: block; margin: auto;" />



## Activity 4: Test yourself

**Question 1.** Predict the output of the following when executed in R:


```r
foo=function(d,n,max){
   nums=seq(from=1, by=d, length.out=n)
   return(nums[nums <= max])
}
foo(4,5,10)
```

<select class='webex-select'><option value='blank'></option><option value=''>4, 5, 10</option><option value='answer'>1, 5, 9</option><option value=''>4, 8, 12</option></select>


**Question 2.** Predict the output of the following when executed in R:


```r
fum=function(a,b) {
  a = a[a<b]
  return(a)
}

fum(3:7,(1:5)^2)
```

<select class='webex-select'><option value='blank'></option><option value='answer'>5, 6, 7</option><option value=''>3, 4, 5, 6, 7</option><option value=''>3, 4</option></select>


**Question 3.** Write a function that adds two numbers and divides the results by 2.

<button id="displayTextunnamed-chunk-71" onclick="javascript:toggle('unnamed-chunk-71');">Show Solution</button>

<div id="toggleTextunnamed-chunk-71" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
addtwo <- function(num1, num2){
(num1 + num2)/2
}
```
</div></div></div>


**Question 4.**  Recode values of a datase. tFor example, if you have a survey of age data, you may want to convert any crazy values (like anything below 0 or above 100) to NA. Write a function called recode.integer() with 3 arguments: x, lb, and ub. We’ll assume that x is a numeric vector. The function should look at the values of x, convert any values below lb and above ub to NA, and then return the resulting vector. Here is the function in action:

Some hints: there are multiple ways to solve this. 


```r
vector <- c(-5:30)
```



```r
recode.integer(x = vector,
               lb = 0,
               ub = 10)
```

<button id="displayTextunnamed-chunk-74" onclick="javascript:toggle('unnamed-chunk-74');">Show Solution</button>

<div id="toggleTextunnamed-chunk-74" style="display: none"><div class="panel panel-default"><div class="panel-heading panel-heading1"> Solution </div><div class="panel-body">

```r
recode.integer <- function(x, lb, ub){
  x[x<lb] <- NA
  x[x>ub] <- NA
  return(x)
}
```

```r
recode.integer <- function(x, lb, ub){
    x <- x %>% as_tibble() %>% 
      mutate(value = replace(value, value<lb, NA)) %>% 
      mutate(value = replace(value, value>ub, NA))
return(x)}

recode.numeric <- function(x, lb, ub){
x <- if_else(x < lb, NA_integer_, x)
x <- if_else(x > ub, NA_integer_, x)
return(x)
}
```
</div></div></div>

## Activity 5

If you are hungry for more `map()` then check out [this blogpost](https://www.rebeccabarter.com/blog/2019-08-19_purrr/#simplest-usage-repeated-looping-with-map)

## Summary

Making functions and iterations are advanced R skills, and can often seem daunting. I do not expect you to HAVE to implement these for this course, but I do want to give you an insight into some core programming skills that you might be interested in and want to develop.

Below are some links you may find useful

* [RStudio education cheat sheet for purr](https://www.rstudio.com/resources/cheatsheets/)

* [R4DS - intro to programming](https://r4ds.had.co.nz/program-intro.html)

* [Coding club](https://ourcodingclub.github.io/tutorials/funandloops/#function)

* [EpiR handbook](https://epirhandbook.com/en/iteration-loops-and-lists.html)


