# Intervalos de Confianza con R

# Preliminares ------------------------------------------------------------

library(dplyr)

load("data/supercias_raw.RData")

# Calculo de p hat --------------------------------------------------------

# Sacar muestra

set.seed(123)

supercias_muestra <-
  supercias_raw %>% 
  sample_n(100)

# P hat (proporcion muestral)
# proporcion de companias en Pichincha

supercias_pichincha <-
  supercias_muestra %>% 
  filter(provincia == "PICHINCHA")

p_hat <- nrow(supercias_pichincha)/nrow(supercias_muestra)

# Calculo de P poblacional (solo teorico) ---------------------------------

supercias_pichincha_pob <-
  supercias_raw %>% 
  filter(provincia == "PICHINCHA")

p_pob <- nrow(supercias_pichincha_pob)/nrow(supercias_raw)

# Margen de error ---------------------------------------------------------

# Z_alpha_medios * E.S.

alpha <- 0.05

n <- nrow(supercias_muestra)

se <- sqrt((p_hat * (1-p_hat))/n)

z_alph_2 <- qnorm(1-alpha/2)

me <- se * z_alph_2

intervalo_confianza <- c(p_hat - me, p_hat + me)