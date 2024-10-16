# Pruebas de Hipótesis

# Preliminares ------------------------------------------------------------

# Prueba Z de una cola ---------------------------------------------------

# Datos

n <- 100

sample_mean <- 2.8

mu_0 <- 3

sigma <- 0.3

alpha <- 0.05 # 95% de confianza

# Prueba a realizar

# H0: mu >= 3.0

# H1: mu < 3.0 (left tailed test)

# Calcular el estadistico de prueba

z <- (sample_mean - mu_0)/sigma/sqrt(n)

# Calcular el valor p del estadistico de prueba z

p_val <- pnorm(z)

p_val < alpha

# valor-p es MAYOR a alpha.

# no se puede rechazar la hipotesis nula


# Prueba de dos colas -----------------------------------------------------

# nota promedio es diferente de 70 pts

# muestra de 100 estudiantes, sigma historico es 10 pts

# estadistico muestral (nota promedio de la muestra) es 45 pts.

# Definir la prueba:

# H0: mu = 70
# H1: mu != 70

# Prueba de dos colas!!

test_statistic <- (45 - 70)/(10/sqrt(100))

# valor p para prueba de dos colas.

valor_p <- 2 * pnorm(test_statistic)

# preguntar a R si valor_p es menor que alpha (95% confianza) = 0.05

valor_p < 0.05

# rechazar la hipótesis nula!
# el promedio de los estudiantes es DIFERENTE de 70.


