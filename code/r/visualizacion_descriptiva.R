# Statistical data viz
# 30 de Septiembre

# Preliminares ------------------------------------------------------------

# Cargar librerias

library(readxl)
library(readr)
library(haven) # libreria para cargar bases de stata y otros sistemas estadisticos

# Cargar base de datos

supercias_raw <- read_csv("data/supercias_raw.csv")

# Cargar base de datos de LAPOP

lapop_2019 <- read_dta("data/lapop 2019/Ecuador LAPOP AmericasBarometer 2019 v1.0_W.dta")

# Histogramas -------------------------------------------------------------

# R base: hist()

hist(supercias_raw$capital_suscrito)

# puedo alimentar un vector a breaks para personalziar los valores de los intervalos
# debe cubrir TODO el rango de x. 

# hist(supercias_raw$capital_suscrito, breaks = c(100,200,300,400,500,600,700))

# para mejorar la forma en la que se ve un grafico, puedo aplicar escala logaritmica

hist(log(supercias_raw$capital_suscrito),
     breaks = 10,
     main = "Histograma de SUPERCIAS Capital Suscrito")

# con mtcars sale un mejor histograma puesto que es una base "limpia"

hist(mtcars$mpg)

# Densidad ----------------------------------------------------------------

# aplicar una "kernel" de densidad para aplanar y mejorar la manera en la que estan distribuidos los datos

densidad <- density(supercias_raw$capital_suscrito, na.rm = T)

plot(densidad)

densidad_mtcars <- density(mtcars$mpg)

plot(densidad_mtcars)

# Boxplot -----------------------------------------------------------------

boxplot(supercias_raw$capital_suscrito)

boxplot(mtcars$mpg)

boxplot(log(supercias_raw$capital_suscrito))

# filtremos observaciones con menos de 2000 de capital suscrito

supercias <- subset(supercias_raw, supercias_raw$capital_suscrito <= 2000)

boxplot(supercias$capital_suscrito,
        col = "#FFD100")

# Diagramas de dispersion -------------------------------------------------

plot(lapop_2019$q2, lapop_2019$l1)

plot(lapop_2019$q2, log(lapop_2019$l1))

plot(mtcars$mpg, mtcars$hp)

# Ojivas o cumulative distribution plots ----------------------------------

tabla_de_frecuencias <-
  data.frame(table(lapop_2019$q2))

tabla_de_frecuencias$Var1 -> tabla_de_frecuencias$edad

tabla_de_frecuencias$Freq -> tabla_de_frecuencias$frecuencia


tabla_de_frecuencias$Var1 <- NA

tabla_de_frecuencias$Freq <- NA


tabla_de_frecuencias$acumulado <- cumsum(tabla_de_frecuencias$frecuencia)

plot(tabla_de_frecuencias$edad, tabla_de_frecuencias$frecuencia)

# ojiva

plot(tabla_de_frecuencias$edad, tabla_de_frecuencias$acumulado, type = "b")

# freq acumulada relativa

tabla_de_frecuencias$acumulado_relativo <- tabla_de_frecuencias$acumulado/(nrow(lapop_2019))

# ojiva con frecuencia relativa

plot(tabla_de_frecuencias$edad, tabla_de_frecuencias$acumulado_relativo, type = "b")