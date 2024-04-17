
library(dplyr)
library(stringr)

parsePath <- function(x, L)
{
    ifelse(L==0, x, paste0('posts/resources/', x)) %>% 
    return()
}

parseCateg <- function(x) 
{
    x %>% 
    str_replace_all("\\[", "\\[\\'") %>% 
    str_replace_all("\\]", "\\'\\]") %>% 
    str_replace_all(", ", "\\', \\'") %>% 
    return()
}

main <- function()
{
    read.csv("posts/resources/resources.csv", encoding="UTF-8") %>% 
    str_glue_data("
    - path: '{parsePath(FILE_PATH, IS_LOCAL)}'
      image: 'posts/resources/icons/{IMG_PATH}' 
      title: '{TITLE}'
      description: '{INSTITUTE}'
      author: '{AUTHOR_LAST}, {AUTHOR_FIRST}'
      categories: {parseCateg(CATEGORIES)} \n
    ") %>% 
    writeLines("posts/resources/resources.yml")
}

main()
