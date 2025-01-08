test <- c(6, 7, 8, 9)
test <- cumsum(test)
test <- mean(cumsum(c(6, 7, 8, 9)))

# Paczki
library(tidyverse)

# test_potokowania
# Stworzyć wektor 2. Policzyć sumę skumulowaną 3. Policzyć średnią.
# Nadpisywane kolejnymi wartościami

dane_nadpisane <- c(6, 7, 8, 9)

dane_nadpisane <- cumsum(dane_nadpisane)

dane_nadpisane <- mean(dane_nadpisane)

# Zapis z zagnieżdzoną funkcją

dane_funkcja <- mean(cumsum(c(6, 7, 8, 9)))

# Zapis z uzyciem potokowania ("pipe")

dane_potok <- c(6, 7, 8, 9) |>
  #Komentarz
  cumsum() |>
  #Komentarz 2
  mean()

# tidyr ####
data <- iris

#  Zmiana formatu long na wide
l_2_w <- data |>
tidyr::pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Width)

# Paczka z pingwinami
pingwiny <- palmerpenguins::penguins

# Zmiana formatu long na wide
pingwiny_wide <- pingwiny |>
tidyr::drop_na()
# Zmiana formatu na "szerszy"
tidyr::pivot_wider(names_from =)

pingwiny <- pingwiny |>
dplyr::mutate(id = 1:length(year))
# Zmiana formatu wide na long
pingwiny_longer <- pingwiny |>
tidyr::pivot_longer(bill_length_mm:body_mass_g, names_to = "zmienna", values_to = "wartości" )

# Wykres
ggplot2::ggplot(pingwiny_longer, aes(year, wartości, color =species)) +
geom_point()
facet_wrap(vars(zmienna))

# Do szerokiego
pingwiny_wider <- pingwiny_longer |>
# Zmiana formatu ramki
  tidyr::pivot_wider(names_from = zmienna, values_from = wartości)

# Joins (operacje na wielu ramkach) ####
# Podział na płeć
pingwiny_m <- pingwiny |>
  #Wybór samców
  dplyr::filter(sex == "male")

 # Wybór samic
pingwiny_s <- pingwiny |>
dplyr::filter(!sex == "male")

# Łączenie wierszy - bnind rows
pingwiny_m_s <- dplyr::bind_rows(pingwiny_m, pingwiny_s)

# Podział kolumn
pingwiny_1 <- pingwiny |>
dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
dplyr::select(-c(species:body_mass_g))

# Łączenie wierszy - bind cols
pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)
