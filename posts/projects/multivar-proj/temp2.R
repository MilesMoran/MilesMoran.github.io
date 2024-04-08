
library(dplyr)
library(ggplot2)

rwine.df <- read.csv("posts/projects/multivar-proj/winequality-red.csv") 
wwine.df <- read.csv("posts/projects/multivar-proj/winequality-white.csv") 
wine.df <- dplyr::bind_rows(wwine.df, rwine.df, .id="type")

wine.QDA <- MASS::qda(type ~ ., data=select(wine.df,-quality))

decisionplot(wine.QDA, select(wine.df,-quality), class = "type")

model <- qda(Species ~ ., iris)
decisionplot_ggplot(wine.QDA, total.sulfur.dioxide ~ density, wine.df, showgrid = TRUE) + 
    xlim(0,300) + 
    ylim(0.985,1.005)

wine.QDA

"
     APER                   V1                   V2
74  0.037              density total.sulfur.dioxide
68  0.045     volatile.acidity total.sulfur.dioxide
71  0.051            chlorides total.sulfur.dioxide
"

m <- c(.5, -.5)

mu.type1 <- 
    wine.df %>% 
    subset(type=="1") %>% 
    select(c(total.sulfur.dioxide, density)) %>% 
    colMeans()
mu.type2 <- 
    wine.df %>% 
    subset(type=="2") %>% 
    select(c(total.sulfur.dioxide, density)) %>% 
    colMeans()
sigma.type1 <- 
    wine.df %>% 
    subset(type=="1") %>% 
    select(c(total.sulfur.dioxide, density)) %>% 
    cov()
sigma.type1 <- 
    wine.df %>% 
    subset(type=="2") %>% 
    select(c(total.sulfur.dioxide, density)) %>% 
    cov()

data.grid <- expand.grid(s.1 = seq(0,300, length.out=200), s.2 = seq(0.985,1.005, length.out=200))
q.samp <- cbind(data.grid, prob = mvtnorm::dmvnorm(data.grid, mean = mu.type1, sigma = sigma.type1))
ggplot(q.samp, aes(x=s.1, y=s.2, z=prob)) + 
    geom_contour() +
    coord_fixed(xlim = c(-3, 3), ylim = c(-3, 3), ratio = 1)

wine %>% 
    mutate(
        mu.density = 
    )

ggplot(wine.df, aes(x=total.sulfur.dioxide, y=density, col=type)) + 
    geom_point(alpha=0.1) +
    geom_density_2d(lwd=0.5) + 
    xlim(0,300) + 
    ylim(0.985,1.005) + 
    theme_minimal() + 
    labs(x="Total Sulfur Dioxide", y="Density") + 
    legend.




C <- wine.df %>% select(-c(type,quality)) %>% colnames()
expand.grid("V1"=C,"V2"=C) %>% 
    subset(V1!=V2) %>% 
    apply(1, function(row){
        # print(c(row,"type"))
        w <- wine.df %>% select(c(row,"type"))
        wine.QDA <- MASS::qda(type ~ ., data=w) 
        lbls.pred <- as.numeric(predict(wine.QDA, w)$class)
        lbls.true <- as.numeric(w[,"type"])
        misclass.tbl <- table(lbls.pred, lbls.true)
        N.total <- nrow(w)
        n.correct <- sum(diag(misclass.tbl))
        APER <- round((N.total - n.correct) / N.total, 3)
        return(APER)
    }) %>% 
    cbind(subset(expand.grid("V1"=C,"V2"=C),V1!=V2)) %>% 
    magrittr::set_colnames(c("APER","V1","V2")) %>% 
    arrange(APER)
