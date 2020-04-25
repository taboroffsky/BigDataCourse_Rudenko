Лабораторна робота № 3. Зчитування даних з WEB.
================

В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100 фільмами 2017 року виходу за посиланням «<http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature>». Необхідно створити data.frame «movies» з наступними даними: номер фільму (rank\_data), назва фільму (title\_data), тривалість (runtime\_data). Для виконання лабораторної рекомендується використати бібліотеку «rvest». CSS селектори для зчитування необхідних даних: rank\_data: «.text-primary», title\_data: «.lister-item-header a», runtime\_data: «.text-muted .runtime». Для зчитування url використовується функція read\_html, для зчитування даних по CSS селектору – html\_nodes і для перетворення зчитаних html даних в текст - html\_text. Рекомендується перетворити rank\_data та runtime\_data з тексту в числові значення. При формуванні дата фрейму функцією data.frame рекомендується використати параметр «stringsAsFactors = FALSE».

``` r
library(rvest)

url = read_html('http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature')

rank_html_text <- html_text(html_nodes(url,'.text-primary'))
rank_data <- as.numeric(rank_html_text)

title_data <- html_text(html_nodes(url,'.lister-item-header a'))

runtime_html_text <- html_text(html_nodes(url,'.text-muted .runtime'))
runtime_data <- as.numeric(gsub(" min", "", runtime_html_text))

movies <- data.frame(rank = rank_data, title = title_data, runtime = runtime_data, stringsAsFactors = FALSE)
```

Завдання 1
----------

Виведіть перші 6 назв фільмів дата фрейму.

``` r
head(movies$title, 6)
```

    ## [1] "Molly's Game"                  "Chiamami col tuo nome"        
    ## [3] "Blade Runner 2049"             "The Greatest Showman"         
    ## [5] "Thor: Ragnarok"                "Il sacrificio del cervo sacro"

Завдання 2
----------

Виведіть всі назви фільмів с тривалістю більше 120 хв.

``` r
movies[movies$runtime > 120, ]$title
```

    ##   [1] "Molly's Game"                               
    ##   [2] "Chiamami col tuo nome"                      
    ##   [3] "Blade Runner 2049"                          
    ##   [4] "Thor: Ragnarok"                             
    ##   [5] "Il sacrificio del cervo sacro"              
    ##   [6] "It"                                         
    ##   [7] "Guardiani della Galassia Vol. 2"            
    ##   [8] "Star Wars - Gli ultimi Jedi"                
    ##   [9] "Spider-Man: Homecoming"                     
    ##   [10] "Pirati dei Caraibi - La vendetta di Salazar"
    ##  [11] "La bella e la bestia"                       
    ##  [12] "The War - Il pianeta delle scimmie"         
    ##  [13] "La forma dell'acqua - The Shape of Water"   
    ##  [14] "Logan - The Wolverine"                      
    ##  [15] "Seven Sisters"                              
    ##  [16] "Wonder Woman"                               
    ##  [17] "Madre!"                                     
    ##  [18] "John Wick - Capitolo 2"                     
    ##  [19] "Alien: Covenant"                            
    ##  [20] "King Arthur: Il potere della spada"         
    ##  [21] "Transformers - L'ultimo cavaliere"          
    ##  [22] "L'ora più buia"                             
    ##  [23] "Papillon"                                   
    ##  [24] "Sempre amici"                               
    ##  [25] "Il filo nascosto"                           
    ##  [26] "Kingsman: Il cerchio d'oro"                 
    ##  [27] "Valerian e la città dei mille pianeti"      
    ##  [28] "Fast & Furious 8"                           
    ##  [29] "Power Rangers"                              
    ##  [30] "Hostiles: Ostili"                           
    ##  [31] "The Shack"                                  
    ##  [32] "Downsizing - Vivere alla grande"            
    ##  [33] "Tutti i soldi del mondo"                    
    ##  [34] "La fratellanza" 

Завдання 3
----------

Скільки фільмів мають тривалість менше 100 хв.

``` r
nrow(movies[movies$runtime < 100, ])
```

    ## [1] 13
