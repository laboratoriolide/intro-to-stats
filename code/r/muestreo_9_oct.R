# Muestreo y distribuciones de muestreo

# Preliminares ------------------------------------------------------------

# cargar libs

library(tidyverse)
library(readxl)

# cargar datos

load("data/supercias_raw.RData")

# Muestreo ----------------------------------------------------------------

# base de la SUPERCIAS es un "sampling frame"

# sampling frame permite sacar muestras con funciones aleatorias

# todas las funciones de muestreo aleatorio simple tienen componentes de aleatoriedad. 
# cada vez que yo las ejecuto los resultados van a cambiar.
# para asegurarnos reproducibilidad, hay que poner una "semilla" en base a la cual yo genero datos aleatorios para el muestreo.

set.seed(123)

muestra_20 <-
  supercias_raw %>% 
  sample_n(20)

muestra_20_perc <-
  supercias_raw %>% 
  sample_frac(0.2)

# verificar

nrow(muestra_20_perc)/nrow(supercias_raw)

# r base: sample()

muestra_empresas_rbase<- 
  sample(supercias_raw$nombre, 20)

muestra_empresas_df <-
  supercias_raw %>% 
  filter(nombre %in% muestra_empresas_rbase)