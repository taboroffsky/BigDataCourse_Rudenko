Лабораторна робота № 4. Зчитування даних з реляційних баз даних.
================

```R
install.packages("RSQLite")

##package ‘rlang’ successfully unpacked and MD5 sums checked
##package ‘bit’ successfully unpacked and MD5 sums checked
##package ‘vctrs’ successfully unpacked and MD5 sums checked
##package ‘bit64’ successfully unpacked and MD5 sums checked
##package ‘blob’ successfully unpacked and MD5 sums checked
##package ‘DBI’ successfully unpacked and MD5 sums checked
##package ‘RSQLite’ successfully unpacked and MD5 sums checked

library(DBI)
library(RSQLite)

```
Завдання 1
----------

Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті с типом виступу Spotlight. Сортування по назві статті.

```R
connect <- dbConnect(RSQLite::SQLite(), "D:\\1\\database.sqlite")
task1 <- dbSendQuery(connect, "SELECT Title, EventType FROM Papers WHERE EVENTTYPE ='Spotlight' ORDER BY Title" )
result <- dbFetch(task1, 20)
dbClearResult(task1) 
dbDisconnect(connect)
result
```

```R   
   Title
      Title
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding
2                                    Accelerated Mirror Descent in Continuous and Discrete Time
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games
4                                                                      Adaptive Online Learning
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization
6                                                 Attention-Based Models for Speech Recognition
7                                                       Automatic Variational Inference in Stan
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception
11                        Closed-form Estimators for High-dimensional Generalized Linear Models
12             Collaborative Filtering with Graph Information: Consistency and Scalable Methods
13                           Color Constancy by Learning to Predict Chromaticity from Luminance
14                                                Data Generation as Sequential Decision Making
15                      Decoupled Deep Neural Network for Semi-supervised Semantic Segmentation
16                                                  Deep Convolutional Inverse Graphics Network
17                                                     Deep learning with Elastic Averaging SGD
18                            Distributed Submodular Cover: Succinctly Summarizing Massive Data
19                                                  Distributionally Robust Logistic Regression
20                                          Efficient and Parsimonious Agnostic Active Learning
   EventType
1  Spotlight
2  Spotlight
3  Spotlight
4  Spotlight
5  Spotlight
6  Spotlight
7  Spotlight
8  Spotlight
9  Spotlight
10 Spotlight
11 Spotlight
12 Spotlight
13 Spotlight
14 Spotlight
15 Spotlight
16 Spotlight
17 Spotlight
18 Spotlight
19 Spotlight
20 Spotlight

```

Завдання 2
----------

Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.

```R
connect <- dbConnect(RSQLite::SQLite(), "D:\\1\\database.sqlite")
task2 <- dbSendQuery(connect, "SELECT  authors.name,  Papers.title FROM authors JOIN PaperAuthors ON authors.Id=PaperAuthors.AuthorId JOIN Papers ON Papers.Id=PaperAuthors.paperid WHERE Name='Josh Tenenbaum' ORDER by Title;")
result2 <- dbFetch(task2,5) 
dbClearResult(task2) 
dbDisconnect(connect) 
result2
```

```R
            Name
1 Josh Tenenbaum
2 Josh Tenenbaum
3 Josh Tenenbaum
4 Josh Tenenbaum
                                                                                              Title
1                                                       Deep Convolutional Inverse Graphics Network
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3                                                Softstar: Heuristic-Guided Probabilistic Inference
4                                                        Unsupervised Learning by Program Synthesis

```

Завдання 3
----------

Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.


```R
connect <- dbConnect(RSQLite::SQLite(), "D:\\1\\database.sqlite")
task3 <- dbSendQuery(connect, "SELECT Title FROM Papers WHERE Title LIKE '%statistical%' ORDER BY Title;")
result3 <- dbFetch(task3, 10)
dbClearResult(task3)
dbDisconnect(connect)
result3
```

```R
                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective

```

Завдання 4
----------

Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.

```R
connect <- dbConnect(RSQLite::SQLite(), "D:\\1\\database.sqlite")
task4 <- dbSendQuery(connect, "SELECT authors.name, count(Papers.title) NumPapers FROM Authors JOIN PaperAuthors ON authors.Id=PaperAuthors.AuthorId JOIN papers ON Papers.Id=PaperAuthors.paperid GROUP by name ORDER by NumPapers DESC;")
result4 <- dbFetch(task4, 50)
dbClearResult(task4)
dbDisconnect(connect)
result4
```

```R

                      Name NumPapers
1     Pradeep K. Ravikumar         7
2           Lawrence Carin         6
3                  Han Liu         6
4        Zoubin Ghahramani         5
5                  Le Song         5
6      Inderjit S. Dhillon         5
7             Zhaoran Wang         4
8            Yoshua Bengio         4
9     Simon Lacoste-Julien         4
10             Shie Mannor         4
11           Ryan P. Adams         4
12            Prateek Jain         4
13          Percy S. Liang         4
14       Michael I. Jordan         4
15          Josh Tenenbaum         4
16             Honglak Lee         4
17        Csaba Szepesvari         4
18          Christopher Re         4
19            Zoltan Szabo         3
20              Yann LeCun         3
21        Vibhav G. Gogate         3
22              Tong Zhang         3
23               Shuang Li         3
24 Ruslan R. Salakhutdinov         3
25       Richard E. Turner         3
26           Ricardo Henao         3
27        Rafael Frongillo         3
28            Parag Singla         3
29           Oriol Vinyals         3
30           Matthias Hein         3
31      Kamalika Chaudhuri         3
32              Elad Hazan         3
33 Dimitris Papailiopoulos         3
34        David E. Carlson         3
35              David Blei         3
36         David B. Dunson         3
37        Arindam Banerjee         3
38        Antonio Torralba         3
39            Ambuj Tewari         3
40   Alexandros G. Dimakis         3
41            marc lelarge         2
42       koray kavukcuoglu         2
43            arthur szlam         2
44                 Zhe Gan         2
45          Zaid Harchaoui         2
46               Yukun Zhu         2
47          Yuichi Yoshida         2
48             Yinlam Chow         2
49             Yining Wang         2
50             Yichen Wang         2
```
