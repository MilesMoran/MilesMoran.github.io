---
layout: default
---

# Data Science in 5 Minutes

Let's assume we have some kind of data that can be defined in terms of a Relational Database. This means that our data comes in a format comprised of observations (also called samples), and each 
observation contains a set of measurements (numbers, text, etc.) representing attributes that ALL\* observations have in common. An example might be as such: 

| Students in Mr. Moran's Survey			   						|
| Observation	| Name  | Age | Height 	| Pronouns	| Weight (lbs)	|
|:--------------|:------|:----|:--------|:----------|:--------------|
| 1           	| Adam 	| 19  | 5'10"  	| he/him	| 160			|
| 2 			| Sam   | 21  | 6'2"	| he/him	| 210			|
| 3           	| Helen | 20  | 5'4"	| she/her	| 100			|
| 4           	| Wei 	| 20  | 5'9"	| he/him	| 140			|
| 5				| Alex 	| 19  | 5'5		| they/them | 120			|

IN this case, we have _five_ observations, representing the _five_ people in the class. Each person (observation) has _four_ attributes, including their name, age, height, and pronouns. The first thing we will do in our analysis is *clean* the data by translating it into numbers only :

| Students in Mr. Moran's Survey			   						|
| Observation	| Age	| Height | Pronouns he/him?	| Weight (lbs)	|
|:--------------|:------|:-------|:-----------------|:--------------|
| 1 (Adam)      | 19  	| 70" 	 | 1 				| 160			|
| 2 (Sam)		| 21  	| 74" 	 | 1 				| 210			|
| 3 (Helen)     | 20  	| 64" 	 | 0 				| 100			|
| 4 (Wei)       | 20  	| 69" 	 | 1 				| 140			|
| 5	(Alex)		| 19  	| 65" 	 | 0 				| 120			|

What this will allow us to do is perform normal mathematical operations (addition, subtraction, etc.) on our data. Typically in data science, we perform serious computation when data is in this so-called _Matrix_ form. In fact, allow us to refer to our whole dataset as a mathematical variable like $x$ or $y$. Let's call this matrix $A$.

$ A = x^2 + y^2 $

With this data, we might have a particular *goal* in mind. Suppose our objective is to guess whether or not a person's pronouns are he/him based on nothing but their height and weight (don't ever do this in real life). Then, a natural way to do this is to plot some of our data 

![image]()

and attempt to draw a line through it as such:

![image]()

so that the two *classes* of that attribute (he/him or NOT he/him) are clearly divided into two separate _regions_ on the graph. In our case, the line $y = mx + b$ clearly divides our data into two *partitions* such that Adam, Sam, and Wei's data all fall in one partition and Helen's and Alex's data fall in the _other_ partition. That way, if Mr. Moran surveys someone new, he can attempt to judge their pronouns prematurely and make a fool of himself! Hah!