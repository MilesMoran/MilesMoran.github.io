---
layout: default
---

# Data Science in 5 Minutes

Suppose I take a survey of 100 men, measuring (1) their risk of heart disease and (2) several related health variables (including age, height and weight). The results of this survey might look something like this: 

![image](../assets/images/datasci/table1.png)

In this case, our data is defined in terms of a _Relational_ _Database_. This means our data can be visualized like an excel spreadsheet, wherein each row corresponds to some observation (also called a 'sample') and each column corresponds to some measurement (also called an 'attribute' or 'feature') of those observations. Note:

1. Each observation has had the _same_ attributes measured (age, height, weight, at risk), meaning our data has no _sparsity_. Generally, extrapolating meaningful information from _sparse_ data is more difficult than from non-sparse data. 

2. All of our measurements are numerical. Even the text-based 'yes' and 'no' measurements that fill up the 'risk factor' category can be thought of as 1's and 0's, respectively. What this will allow us to do is perform normal mathematical operations (addition, subtraction, etc.) on our data. 

Typically in data science, we perform serious computation when data is in this so-called _Matrix_ form. In fact, allow us to refer to our whole dataset as a mathematical variable like $x$ or $y$. Let's call this matrix $A$.

![image](../assets/images/datasci/latex1.png)


With this data, we might have a particular *goal* in mind. Suppose our objective is to guess whether or not a person's pronouns are he/him based on nothing but their height and weight (don't ever do this in real life). Then, a natural way to do this is to plot some of our data 

![image]()

and attempt to draw a line through it as such:

![image]()

so that the two *classes* of that attribute (he/him or NOT he/him) are clearly divided into two separate _regions_ on the graph. In our case, the line $y = mx + b$ clearly divides our data into two *partitions* such that Adam, Sam, and Wei's data all fall in one partition and Helen's and Alex's data fall in the _other_ partition. That way, if Mr. Moran surveys someone new, he can attempt to judge their pronouns prematurely and make a fool of himself! Hah!