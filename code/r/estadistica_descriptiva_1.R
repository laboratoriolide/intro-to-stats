# Estadistica Descriptiva Univariada

# Preliminares ------------------------------------------------------------

library(readxl)
library(readr) # leer datos con comas como numeros 

supercias_raw <- read_excel("data/directorio_companias_supercias.xlsx",
                            skip = 4)

supercias_raw$`CAPITAL SUSCRITO` <- parse_number(supercias_raw$`CAPITAL SUSCRITO`,
                                                   locale = locale(decimal_mark = ",", 
                                                                   grouping_mark = "."))

# Analisis ----------------------------------------------------------------

# Promedio del capital suscrito de cada empresa

mean(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

# Moda con table()

tabla_para_moda <- table(supercias_raw$`CAPITAL SUSCRITO`)

tabla_para_moda

# Range

min_max <- range(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

diff(min_max)

max(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

min(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

# Mean

mean <- mean(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

# SD

sd <- sd(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)

# CV

cv <- sd/mean

# Medidas de posicion (percentiles) con R base (quantile)

# Tres cuartiles (p25, p50, p75)

cuartiles <-
quantile(supercias_raw$`CAPITAL SUSCRITO`, 
        probs = c(0.25, 0.5, 0.75), 
        na.rm = T)

cuartiles[1]

cuartiles[2]

cuartiles[3]

IQR(supercias_raw$`CAPITAL SUSCRITO`, na.rm = T)


# Z score con Scale

scale(supercias_raw$`CAPITAL SUSCRITO`)

supercias <-
  supercias_raw

supercias$z_score_capital <- scale(supercias_raw$`CAPITAL SUSCRITO`)

# Extraer la observacion 3 de capital suscrito como un numerico

x <- as.numeric(supercias[3,"CAPITAL SUSCRITO"])

z <- (x-mean)/sd
