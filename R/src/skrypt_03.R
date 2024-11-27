# 27.11.2024
library(tidyverse)
library(readxl)

# Wczytanie danych
ramka <- readxl::read_excel("R/data/samopoczucie_projekt.xlsx", sheet = "Arkusz1")

ramka <- dplyr::rename(ramka, liczba_krokow = KROKI)
ramka <- dplyr::rename(ramka, woda_ml = `WODA (ml)`)
ramka <- dplyr::rename(ramka, samopoczucie_1_10 = `SAMOPOCZUCIE (1-10)`)
ramka <- dplyr::rename(ramka, data = DATA)

# Zmiana nazwa z malych na wielkie
ramka_2 <- dplyr::rename_with(ramka, .cols = everything(), \(i) toupper(i))
ramka_3 <- dplyr::rename_with(ramka, .cols = dplyr::starts_with("data"), \(i) toupper(i))
ramka_3 <- dplyr::rename_with(ramka, .cols = dplyr::contains("_1_"), \(i) toupper(i))

# Operacje na kolumnaach
ramka$kolumna6 <- ramka[, 3] / ramka[, 4]

# Operacje na kolumnach mutate
ramka_4 <- dplyr::mutate(ramka, wynik_dzielenia = liczba_krokow / woda_ml, wynik_dodawania = liczba_krokow + 1)
ramka_4 <- dplyr::mutate(ramka, wynik_dodawania = liczba_krokow + 1)

ramka_5 <- dplyr::mutate(ramka, woda_ml = woda_ml -10)
ramka_6 <- dplyr::mutate(ramka, woda_ml = woda_ml - 10, .keep = "none")

# Przesunięcie kolumn
ramka_7 <- dplyr::relocate(ramka_5, liczba_krokow, .after = data)
