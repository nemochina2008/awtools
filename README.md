---
title: "awtools"
output:
  html_document:
    keep_md: true
  md_document:
    variant: markdown_github
---
# a_theme
A simple, distilled, #rstats theme used mainly on [www.austinwehrwein.com](https://austinwehrwein.com/)

The original <code>a_theme</code> uses fonts that can be found and downloaded from Google Fonts:

 - [Slabo 27px](https://fonts.google.com/specimen/Slabo+27px) (plot title, legend)
 - [PT Sans Narrow](https://fonts.google.com/specimen/PT+Sans+Narrow) (subtitle, captions, axis_text)
 
The new <code>a_robot_theme</code> uses fonts that can be found and downloaded from Google Fonts:

 - [Roboto Slab](https://fonts.google.com/specimen/Roboto+Slab) (plot title, legend)
 - [Roboto Light](https://fonts.google.com/specimen/Roboto) (subtitle, captions, axis_text)
 
 # Examples
Here is a simple scatterplot with the original <code>a_theme</code>.

```r
#devtools::install_github('awhstin/awtools')
library(awtools)
library(gcookbook)
library(ggplot2)

ggplot(heightweight,aes(x=ageYear,y=heightIn,color=ageYear))+
  geom_point()+
  a_theme()+
  labs(title='Height by Age',
       subtitle='Sample data of height in inches by age in years.',
       caption='Source: R Graphics Cookbook')
```

![](README_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

Here is a simple scatterplot with a revised version using specifically Roboto series fonts <code>a_robot_theme</code>. Along with some added elements, sizing, and other aesthetic fixes this will be used most on my website. 

```r
#devtools::install_github('awhstin/awtools')
library(awtools)
library(gcookbook)
library(ggplot2)
library(dplyr)

ggplot(heightweight,aes(x=ageYear,y=heightIn,color=ageYear))+
  geom_point()+
  a_robot_theme()+
  labs(title='Height by Age',
       subtitle='Sample data of height in inches by age in years.',
       caption='Source: R Graphics Cookbook')
```

![](README_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
 
Here is an example of the color palette.

```r
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + 
  geom_area() +
  a_scale_fill() +
  scale_y_continuous(labels = scales::comma)+
  labs(title="Age distribution of population\nin the U.S., 1900-2002",
       subtitle="Example data from the R Graphics Cookbook.",
       caption="Source: R Graphics Cookbook") +
  a_theme() +
  theme(legend.position="bottom")
```

![](README_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

I also created a reverse of the color palette.

```r
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + 
  geom_area() +
  a_reversed_fill() +
  scale_y_continuous(labels = scales::comma)+
  labs(title="Age distribution of population\nin the U.S., 1900-2002",
       subtitle="Example data from the R Graphics Cookbook.",
       caption="Source: R Graphics Cookbook") +
  a_robot_theme() +
  theme(legend.position="bottom")
```

![](README_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

Finally for work I compare 4 and 6 factors often so I created a stepped version of my color palette. 

I also created a reverse of the color palette.

```r
groups<-unique(uspopage$AgeGroup)
uspopage<-uspopage%>%
  filter(uspopage$AgeGroup %in% head(groups,4))
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + 
  geom_area() +
  a_step_fill() +
  scale_y_continuous(labels = scales::comma)+
  labs(title="Age distribution of population\nin the U.S., 1900-2002",
       subtitle="Example data from the R Graphics Cookbook.",
       caption="Source: R Graphics Cookbook") +
  a_robot_theme() +
  theme(legend.position="bottom")
```

![](README_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

