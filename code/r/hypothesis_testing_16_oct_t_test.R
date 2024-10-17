# Pruebas de Hipotesis, T-test y pruebas de dos muestras

# Preliminares ------------------------------------------------------------

library(haven)

esi <- read_dta("case-study/esi_2023_dta/esi_2023.dta")

# Prueba t de una muestra -------------------------------------------------

# Sample size:25
# Sample mean:9.5
# Sample standard deviation:2.5
# Hypothesized mean:10
# Significance level:5%

# H0: mu >= 10
# H1: mu < 10

n <- 25
x_bar <- 9.5
sd_muestral <- 2.5
mu_0 <- 10
alpha <- 0.05

# estadistico de prueba

t_statistic <- (x_bar - mu_0) / (sd_muestral/sqrt(n))

# valor-p

valor_p <- pnorm(t_statistic)

valor_p < 0.05

# valor_p es mayor a alpha (0.05)
# no puedo rechazar H0
# no puedo rechazar que la media poblacional sea MAYOR o IGUAL a 10.

# Otra prueba t de una muestra -----------------------------------------------------------

# edad promedio es significativamente diferente de 25 años

t.test(esi$edad, alternative = "two.sided", mu = 25)

# Pruebas t de dos muestras -----------------------------------------------

# Comparando las edades de quienes entran al pais
# Edades de quienes salen del pais (promedio poblacional)

# H0: mu1 = mu2
# H1: mu1 != mu2

# todas las edades de quienes entran al pais



