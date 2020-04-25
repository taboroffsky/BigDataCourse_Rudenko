Лабораторна робота № 1. Завантаження та зчитування даних
================

``` r
packages = c('XML', 'readxl');

for (package in packages) {
  is_installed = any(grepl(package, installed.packages()))
  if (!is_installed) {
    install.packages(package)
  }
}
```

Завдання 1
----------

За допомогою download.file() завантажте любий excel файл з порталу <http://data.gov.ua> та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

``` r
library(readxl)

download.file('https://data.gov.ua/dataset/2cde453d-a726-40e8-95f5-03eb05d4bfcc/resource/2e477324-76a3-4802-8e80-0ec2dc196a03/download/info_aes_blocks_26_02_2020.xlsx', mode='wb', destfile='lab1_1.xlsx');
data1 <- read_excel('lab1_1.xlsx', sheet=1);
head(data1, 6);
```

    ## # A tibble: 6 x 7
    ## station unit_number installed_capac~ reactor_type fuel  сommercial_operati~
    ## <chr>         <dbl>            <dbl> <chr>        <chr> <dttm>             
    ## 1 ЗАЕС              1             1000 ВВЕР-1000    ТВ    1985-12-25 00:00:00
    ## 2 ЗАЕС              2             1000 ВВЕР-1000    Т     1986-02-15 00:00:00
    ## 3 ЗАЕС              3             1000 ВВЕР-1000    ТВ    1987-03-05 00:00:00
    ## 4 ЗАЕС              4             1000 ВВЕР-1000    ТВ    1988-04-14 00:00:00
    ## 5 ЗАЕС              5             1000 ВВЕР-1000    В     1989-10-27 00:00:00
    ## 6 ЗАЕС              6             1000 ВВЕР-1000    Т     1996-10-17 00:00:00

Завдання 2
----------

За допомогою download.file() завантажте файл getdata\_data\_ss06hid.csv за посиланням <https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv> та завантажте дані в R. Code book, що пояснює значення змінних знаходиться за посиланням <https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0> Необхідно знайти, скільки property мають value $1000000+

``` r
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile='lab1_2.csv');
data_2 <- read.csv("lab1_2.csv")
sum(data_2$VAL == 24, na.rm = TRUE)
```

    ## [1] 53

Завдання 3
----------

Зчитайте xml файл за посиланням <http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml>. Скільки ресторанів мають zipcode 21231?

``` r
library(XML)
xml <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",useInternal=TRUE)
node <- xmlRoot(xml)
length(xpathApply(node, '//row/row/zipcode[text()="21231"]'))
```

    ## [1] 127
