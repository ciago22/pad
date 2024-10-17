
install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Crear un dataframe con tus datos
datos <- data.frame(
  Fecha = rep(c("2024/09/18", "2024/09/24"), each = 12 * 2),
  Var = rep(c("MA", "MB"), each = 12, times = 2),
  tto = rep(c("T1", "T2", "T3"), times = 8),
  rep = rep(1:12, times = 4),
  Alt = c(
    6.9, 7.7, 7.7, 6.7, 5.6, 6.3, 6.9, 8.1, 7.7, 6.7, 5.9, 7.2,
    6.2, 4.8, 5.4, 5.3, 6.2, 5.2, 4, 7.6, 7.1, 5.2, 5.9, 5.3,
    4.5, 5.1, 4.9, 5.4, 4.2, 5.4, 2.2, 2.1, 5.7, 5.7, 5.7, 6,
    5.7, 5.2, 5.8, 4.6, 4.7, 5.4, 4.8, 6.1, 4.6, 5.1, 4, 4.5,
    4.3, 4.4, 5.2, 7.7, 6.4, 4.4, 4.6, 5.2, 5.2, 4.7, 5.1, 7.4,
    4.4, 4.2, 4.1, 4.3, 5.2, 5, 3.6, 4.9, 5.3, 5.6, 6, 5.9,
    12.6, 14.5, 12.5, 11.9, 11.9, 11.1, 13.1, 14.5, 12.5, 15, 12, 13.3,
    13, 13, 10.8, 9.5, 9.4, 11, 10.2, 9.8, 13, 11.5, 10.6, 10,
    8.4, 8.3, 6.2, 9, 7.5, 8, 6, 8.7, 8, 7.2, 8.5, 8.5,
    9, 9.4, 9, 8.5, 8.9, 9.5, 9, 8.3, 9.4, 9.9, 7.7, 8.7,
    8.3, 8.8, 8.3, 9.4, 9.2, 8.5, 7.9, 8.1, 8.8, 8.4, 9.2, 8.3,
    9.4, 5.8, 6.3, 9, 7.2, 8.2, 8.5, 6.9, 7.5, 7.2, 7.8, 7.2
  )
)

ggplot(datos, aes(x = rep, y = Alt, color = Var, group = interaction(tto, Var))) +
  geom_line(aes(linetype = tto)) +  # Líneas para tratamientos
  geom_point() +  # Puntos en las líneas
  labs(title = "Interacción entre Tratamientos, Altura y Variedades",
       x = "Replicaciones",
       y = "Altura",
       color = "Variedad",
       linetype = "Tratamiento") +
  theme_minimal()
