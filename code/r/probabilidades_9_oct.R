# Probabilidades

# Preliminares ------------------------------------------------------------


# Ejercicios con distribucion normal estandar -----------------------------

# distr normal estandar
# mu = 0
# sigma = 1

# cual es la probabilidad de caer por debajo de 1.40 desviaciones estandar

# dnorm <- densidad (sirve para hacer graficos)

# crear grafico de distribucion normal

x <- seq(-3, 3, by = 0.01) # secuencia de numeros (rango de la variable distribuida normalmente), vector

y <- dnorm(x, mean = 0, sd = 1) # densidad de probabilidad estandar, mean = 0, sd = 1.

# grafico con ggplot2

library(ggplot2)

df <- data.frame(x = x, y = y) # crear un dataframe

ggplot(df, aes(x = x, y = y)) +
  geom_line() +
  theme_minimal()

plot(df$x, df$y, type = "l")

# pnorm() <- CDF. sirve para responder preguntas con probabilidad.

pnorm(1.4,
      mean = 0,
      sd = 1)

# 91% de prob. de caer por debajo de 1.4 desviaciones estandar

# cdf siempre dan probabilidades a la izquierda P(x < a).

# probabilidad a la derecha P(x > a) = complemento de la probabilidad de la izquierda. 

# P(x>a) = 1 - P(x < a) = complemento.

# cual es la prob de caer POR ARRIBA de 1.4 desviaciones estandar

1 - pnorm(1.4, mean = 0, sd = 1)

# 0.08 de probabilidad (8%)

# si es que tengo una probabilidad de 0.5 a la izquierda, cual es el numero de desviaciones estandar que generan dicha probabilidad?

# CDF "inversa"

qnorm(0.5, mean = 0 , sd = 1) # 0, porque la media es 0 en la normal estandar y tambien media = mediana para distr. normales

# que tan por debajo de la media de 6, con sd = 3 yo caeria si es que considero p = 0.9
# cdf inversa normal (area la izquierda)

qnorm(0.9, mean = 6, sd = 3)

# yo caeria por debajo de 9.84 "unidades" debajo de la media. 

# si es que quiero ver por arriba de que caigo, cambio argumentos de cdf. 

qnorm(0.9, mean = 6, sd = 3, lower.tail = FALSE)

# con un 90% de probabilidad, yo caigo por encima de 2.16 aprox. 