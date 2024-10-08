# Operaciones con probabilidades
# oct 2

# Preliminares ------------------------------------------------------------

# cargando paquetes

library(dplyr)

# cargar base de datos

load("data/supercias_raw.RData")

# Union de dos eventos ----------------------------------------------------

# El evento A es que una empresa sea de pichincha

# numero de empresas en pichincha/numero de empresas en total

empresas_pichincha <-
  supercias_raw %>% 
  filter(provincia == "PICHINCHA")

prob_A <- nrow(empresas_pichincha)/nrow(supercias_raw)

# El evento B es que una empresa esté activa

empresas_activas <-
  supercias_raw %>% 
  filter(situacion_legal == "ACTIVA")

prob_B <- nrow(empresas_activas)/nrow(supercias_raw)

# union mal hecha: p(A) + p(B)

union_mal_hecha <- prob_A + prob_B

# sale mas de uno, puesto que hay una interseccion existente.
# puede haber empresas activas en pichincha (A interseccion B)

# P(A interseccion B) = numero de empresas activas en pichincha/numero de empresas totales

empresas_activas_pich <-
  supercias_raw %>% 
  filter(situacion_legal == "ACTIVA", provincia == "PICHINCHA")

interseccion <- nrow(empresas_activas_pich)/nrow(supercias_raw)

union_correcta <- prob_A + prob_B - interseccion

# verificar: cuantas empresas estan activas o estan en pichincha

verificacion_base <-
  supercias_raw %>% 
  filter((situacion_legal == "ACTIVA" | provincia == "PICHINCHA"))

verificacion_prob <- nrow(verificacion_base)/nrow(supercias_raw)

