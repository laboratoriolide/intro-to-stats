# Prueba de Hipotesis para Proporciones (phat)

# Preliminares ------------------------------------------------------------

# Librerias

library(dplyr)

# Cargar base SUPERCIAS:

load("data/supercias_raw.RData")

# Sacar una muestra de SUPERCIAS ------------------------------------------

supercias_muestra <-
  supercias_raw %>% 
  sample_n(500)

# Valores poblacionales para una proporcion
# Proporcion de empresas activas

tabulado_sit_legal <- table(supercias_raw$situacion_legal)

empresas_activas <- tabulado_sit_legal[1]

prop_activas_poblacional <- empresas_activas/nrow(supercias_raw)

# Prueba de Hipotesis -----------------------------------------------------

p_0 <- 0.5 # proporcion poblacional hipotetica

# H0: p <= p_0
# H1: p > p_0

n <- nrow(supercias_muestra)

p_hat <-
  table(supercias_muestra$situacion_legal)[1]/500

z_statistic <- (p_hat - p_0)/sqrt((p_0 * (1 - p_0)) / n)

valor_p <- 1 - pnorm(z_statistic)

valor_p < 0.05

# valor_p menos que 0.05 (alpha), rechazo la Hipotesis Nula
# la proporcion de empresas activas es en efecto mayor a 0.5 en la poblacion. 



