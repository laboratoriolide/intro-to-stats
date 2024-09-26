# Estadistica Descriptiva II

# Preliminares ------------------------------------------------------------

# R base para cargar un csv: es read.csv

# .RData son archivos de objetos de R. 

load("data/supercias_raw.RData") # la funcion load carga los objetos de .RData, no necesita un asignador

# Estadistica Descriptiva para Categoricas --------------------------------

# Tabla de frecuencias

tabla_frecuencias_provincia <- table(supercias_raw$provincia)

# Agregar columna de frecuencias relativas

class(tabla_frecuencias_provincia) #objeto "table"

# convertir el objeto a dataframe para facilitar el analisis

df_frecuencias <- data.frame(tabla_frecuencias_provincia)

df_frecuencias$provincia <- df_frecuencias$Var1

df_frecuencias$Var1 <- NULL

df_frecuencias$freq_relativa <- df_frecuencias$Freq/nrow(supercias_raw)

# Verificar que esta bien 

sum(df_frecuencias$freq_relativa)

tabla_de_frecuencias_con_prop_table <- prop.table(tabla_frecuencias_provincia)

# Variables dicotomicas ---------------------------------------------------

# Crear una variable dummy de region

supercias <-
  supercias_raw

# R base tiene una funcion de condicional, similar a SI o IF en Excel. 
# dplyr tiene if_else

supercias$dummy_sierra <- ifelse(supercias$region == "SIERRA", 1, 0)

supercias$sierra <- ifelse(supercias$dummy_sierra == 1, "Region Sierra", "Todas las otras regiones")

# tabla de frecuencias relativas

prop.table(table(supercias$region)) # SIERRA tiene el 45.45% de empresas en los datos.

mean(supercias$dummy_sierra, na.rm = T) # me da el mismo resultado que lo de arriba!

# Medidas de asociacion o estadistica descriptiva bivariada ---------------

# Utilizando mtcars por que tiene mas de una variable numerica que podemos relacionar

cov(mtcars$mpg, mtcars$wt)

cor(mtcars$mpg, mtcars$wt) # relacion negativa fuerte: un carro mas pesado tiende a rendir menos millas por galon de gasolina.

# Para trabajar con NAs, utilizar el argumento "use"

mtcars_con_NAs <- mtcars

mtcars_con_NAs[5, "mpg"] <- NA

cov(mtcars_con_NAs$mpg, mtcars_con_NAs$wt, use = "complete.obs")

cor(mtcars_con_NAs$mpg, mtcars_con_NAs$wt, use = "complete.obs")

# Matriz de correlacion

matriz_corr <- cor(mtcars)

# Tablas de contingencia o tabulaciones cruzadas

tabulacion_cruzada <- table(supercias$region, supercias$tipo)

# Codigo para poner en formato ancho (lo veremos despues)

pivot_wider(data.frame(tabulacion_cruzada), names_from = Var1, values_from = Freq)

# Frecuencias relativas cruzadas

proporciones <- prop.table(tabulacion_cruzada, margin = 2)



