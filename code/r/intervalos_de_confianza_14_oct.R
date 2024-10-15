# Intervalos de Confianza con R

# Preliminares ------------------------------------------------------------


# Intervalo de Confianza Caso I: Sigma Conocida ---------------------------

# Conozco la desviacion estandar poblacional de mi variable de interés.

# Datos del problema

x_bar <- 245354

n <- 100 # informacion dada.

sigma_pob <- 50000

alpha <- 0.05 # Nivel de confianza es 95%, por ende alpha = 1-0.95 = 0.05

# M.E. = Z(alpha/2) * S.E.

std_error <- sigma_pob/sqrt(n) # Error estandar = sigma poblacional / sqrt(n)

z_alpha_medios <- # Z(alpha/2) = numero de desviaciones o errores estandar que genera 1 - (alpha/2) de area a la derecha
  qnorm(1-0.025)

error_margin <- z_alpha_medios * std_error

# Intervalo de Confianza Caso II: Sigma Desconocida -----------------------

x_bar <- 245354

n <- 100 # informacion dada.

s_muestral <- 34000

alpha <- 0.05 

k <- n - 1 # definicion de grados de libertad.

# M.E. = t(alpha/2, k) * S.E.

std_error <- s_muestral/sqrt(n)

z_t_medios <- qt(1-alpha/2, k)

error_margin <- z_t_medios * std_error