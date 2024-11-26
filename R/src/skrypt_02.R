# Load packages
library(tidyverse)

data <- iris
# Średnia długość płatka

sredni_platek <- mean(data$Petal.Length)

mediana_platek <- median(data[, 1])

sd_platek <- sd(data$Petal.Length)

# Średnie dla gatunków

sredni_platek_setosa <- mean(data[1:50, 4])

sredni_platek_versi <- mean(data[51:100, 4])

sredniplatek_virgi <- mean(data[101:150, 4])

# Średnie dla gatunków po nazwach

sredni_platek_setosa_nazwa <- mean(data[data$Species == 'setosa' , 4])

# Podsumowanie

podsumowanie <- summary(data)
podsumowanie

podsumowanie_2 <- summary(data[1, 2 ])
podsumowanie_2

# Suma długości
data$Suma.dlugosci <- data$Sepal.Length + data$Petal.Length

# Frakcja
data$Frakcja <- (data$Sepal.Length + data$Petal.Length) / data$Sepal.Width

# Średnia jako kolumna
data$srednia <- mean(c(data$Sepal.Length, data$Petal.Length))

# Ramka danych tylko sentosa
data_sentosa <- data[1:50, ]

#Ramka danych tylko sentosa po nazwie
data_sentosa_nazwa <- data[data$Species == "sentosa", ]

# Ramka danych tylko oryginalne kolumny
data_oryginalne <- dplyr::select(data, Sepal.Length:Species)

# Wybór zmiennych według nazwy z zapisem od:do
data_oryginalne_tylko_Sepal <- dplyr::select(data, Sepal.Length:Sepal.Width)

# Wybór zmiennych według nazwy z zapisem sklejamy
data_oryginalne_tylko_Sepal_2 <- dplyr::select(data, c(Sepal.Length:Sepal.Width))

# Wybór zmiennych według nazwy z zapisem według początku
data_oryginalne_tylko_Sepal_3 <- dplyr::select(data, starts_with("Petal"))

# Wybór zmennych według nazwy z zapisem według końca
data_oryginalne_tylko_Sepal_4 <- dplyr::select(data, ends_with(Length))

# Wybór zmiennych według nazwy z zapisem według końca
data_oryginalne_tylko_Sepal_5 <- dplyr::select(data, contains("al"))

# Wybór zmiennych według nazwy z zapisem według początku - zanegowane
data_oryginalne_tylko_Sepal_6 <- dplyr::select(data, !starts_with("Petal"))

#### Wybór wierszy
# Wybor wierszy z gatunku setosa
data_wiersze_1 <- dplyr::filter(data, Species == "setosa")

# Wybór wierszy nie z gatunku setosa
data_wiersze_2 <- dplyr::filter(data, !Species == "setosa")

#Wybór wierszy gdzie Petal.Length jest większe od 5.0
data_wiersze_3 <- dplyr::filter(data, Petal.Length > 5.0)

# Wybór wierszy gdzie Petal.Lenght jest większe od 5.0 oraz < 6.0
data_wiersze_4 <- dplyr::filter(data, Petal.Length > 5.0 & Petal.Length < 6.0)

#Działanie na zbiorach | || & &&

