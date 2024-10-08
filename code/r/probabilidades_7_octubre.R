# Probabilidades
# oct 7

# Preliminares ------------------------------------------------------------

# cargando paquetes

library(dplyr)

# cargar base de datos

load("data/supercias_raw.RData")

# Interseccion ------------------------------------------------------------

# probabilidad de estar en la sierra 

empresas_sierra <-
  supercias_raw %>% 
  filter(region == "SIERRA") %>% 
  nrow()

empresas_totales <-
  supercias_raw %>%
  nrow()

p_sierra <-
  empresas_sierra/empresas_totales

# probabilidad de ser SAS (sociedad de acciones simplificada)

empresas_sas <-
  supercias_raw %>% 
  filter(tipo == "SOCIEDAD POR ACCIONES SIMPLIFICADA") %>% 
  nrow()

p_SAS <- empresas_sas/empresas_totales

# interseccion: empresas SAS y que estan en la SIERRA

empresas_sas_en_las_sierra <-
  supercias_raw %>% 
  filter(tipo == "SOCIEDAD POR ACCIONES SIMPLIFICADA", region == "SIERRA") %>% 
  nrow()

p_interseccion <- empresas_sas_en_las_sierra/empresas_totales

# utilizando la regla: 

p_SAS * p_sierra

# no da lo mismo porque existe dependencia de los eventos.
# no se cumple que p_int = pSAS * pSIERRA

# Probabilidades condicionales --------------------------------------------

# Encontrar la probabilidad condicional de encontrar una empresa SAS, DADO que la empresa esta en la Sierra.

# "está dado que un evento sucedió": filtrar para los casos que ya sucedieron.

# filtrar empresas solo en la sierra

supercias_sierra <-
  supercias_raw %>% 
  filter(region == "SIERRA")

empresas_sas_en_las_sierra <-
  supercias_sierra %>% 
  filter(tipo == "SOCIEDAD POR ACCIONES SIMPLIFICADA") %>% 
  nrow()

p_condicional_calculada <- empresas_sas_en_las_sierra/nrow(supercias_sierra)

# verificar que la formula de prob. condicional sirve:

p_interseccion/p_sierra

# Verificar independencia

p_interseccion/p_sierra != p_SAS # statement logico

p_interseccion/p_sierra == p_SAS