# Cargar las bibliotecas necesarias
library(tidyverse)

# Leer los datos
data <- read.table(header = TRUE, text = "
Fecha Var tto Rep Alt D H
2024/09/18 MA T1 1 6.90 3.45 2.00
2024/09/18 MA T1 2 7.70 3.21 2.00
2024/09/18 MA T1 3 6.10 3.09 2.00
2024/09/18 MA T1 4 7.70 3.10 2.00
2024/09/18 MA T1 5 6.70 3.15 2.00
2024/09/18 MA T1 6 6.10 2.94 2.00
2024/09/18 MA T1 7 6.20 3.52 1.00
2024/09/18 MA T1 8 3.40 2.68 1.00
2024/09/18 MA T1 9 6.30 3.06 2.00
2024/09/18 MA T1 10 6.90 3.58 1.00
2024/09/18 MA T1 11 6.70 2.67 2.00
2024/09/18 MA T1 12 3.90 2.74 1.00
2024/09/18 MA T2 1 4.80 3.21 1.00
2024/09/18 MA T2 2 5.30 3.95 2.00
2024/09/18 MA T2 3 6.20 4.28 2.00
2024/09/18 MA T2 4 5.20 4.41 2.00
2024/09/18 MA T2 5 4.00 4.17 1.00
2024/09/18 MA T2 6 7.60 3.27 2.00
2024/09/18 MA T2 7 7.10 3.45 2.00
2024/09/18 MA T2 8 6.80 3.85 2.00
2024/09/18 MA T2 9 5.20 3.67 2.00
2024/09/18 MA T2 10 5.90 3.79 2.00
2024/09/18 MA T2 11 6.70 3.64 2.00
2024/09/18 MA T2 12 5.30 4.08 1.00
2024/09/18 MA T3 1 4.50 3.80 1.00
2024/09/18 MA T3 2 5.10 3.40 1.00
2024/09/18 MA T3 3 4.90 3.60 1.00
2024/09/18 MA T3 4 5.40 3.36 1.00
2024/09/18 MA T3 5 4.20 3.29 1.00
2024/09/18 MA T3 6 5.40 3.59 2.00
2024/09/18 MA T3 7 6.60 3.95 2.00
2024/09/18 MA T3 8 5.40 3.05 1.00
2024/09/18 MA T3 9 5.70 2.28 1.00
2024/09/18 MA T3 10 7.70 3.23 2.00
2024/09/18 MA T3 11 5.70 2.43 1.00
2024/09/18 MA T3 12 6.20 3.63 2.00
2024/09/18 MB T1 1 4.50 2.82 1.00
2024/09/18 MB T1 2 5.20 3.27 1.00
2024/09/18 MB T1 3 5.80 3.16 2.00
2024/09/18 MB T1 4 3.70 2.75 1.00
2024/09/18 MB T1 5 4.70 3.54 1.00
2024/09/18 MB T1 6 5.40 3.08 2.00
2024/09/18 MB T1 7 4.80 2.62 1.00
2024/09/18 MB T1 8 6.10 3.60 2.00
2024/09/18 MB T1 9 4.10 3.63 1.00
2024/09/18 MB T1 10 4.60 3.57 1.00
2024/09/18 MB T1 11 4.00 2.82 1.00
2024/09/18 MB T1 12 4.50 2.34 1.00
2024/09/18 MB T2 1 4.30 3.71 2.00
2024/09/18 MB T2 2 4.40 3.26 1.00
2024/09/18 MB T2 3 5.20 3.65 1.00
2024/09/18 MB T2 4 7.70 3.54 2.00
2024/09/18 MB T2 5 6.40 3.84 2.00
2024/09/18 MB T2 6 4.40 3.25 1.00
2024/09/18 MB T2 7 4.60 3.24 1.00
2024/09/18 MB T2 8 5.20 3.34 2.00
2024/09/18 MB T2 9 5.20 3.07 2.00
2024/09/18 MB T2 10 4.70 3.75 1.00
2024/09/18 MB T2 11 5.10 3.57 1.00
2024/09/18 MB T2 12 7.40 3.45 2.00
2024/09/18 MB T3 1 4.40 3.29 1.00
2024/09/18 MB T3 2 4.20 3.30 1.00
2024/09/18 MB T3 3 4.10 2.14 1.00
2024/09/18 MB T3 4 4.30 2.39 1.00
2024/09/18 MB T3 5 5.20 3.26 2.00
2024/09/18 MB T3 6 3.60 3.69 1.00
2024/09/18 MB T3 7 4.90 3.78 1.00
2024/09/18 MB T3 8 5.60 2.52 1.00
2024/09/18 MB T3 9 6.00 2.36 2.00
2024/09/18 MB T3 10 5.90 2.66 2.00
2024/09/18 MB T3 11 6.30 2.34 2.00
2024/09/18 MB T3 12 6.20 3.05 2.00
2024/09/24 MA T1 1 12.60 3.58 4.00
2024/09/24 MA T1 2 14.50 3.46 4.00
2024/09/24 MA T1 3 12.50 3.50 4.00
2024/09/24 MA T1 4 11.10 3.73 4.00
2024/09/24 MA T1 5 9.90 3.68 4.00
2024/09/24 MA T1 6 13.10 3.75 4.00
2024/09/24 MA T1 7 14.50 3.19 4.00
2024/09/24 MA T1 8 12.50 3.66 5.00
2024/09/24 MA T1 9 15.00 3.75 4.00
2024/09/24 MA T1 10 13.10 3.35 4.00
2024/09/24 MA T1 11 14.40 3.29 4.00
2024/09/24 MA T1 12 10.10 3.58 4.00
2024/09/24 MA T2 1 12.40 3.19 4.00
2024/09/24 MA T2 2 14.00 3.80 4.00
2024/09/24 MA T2 3 11.20 3.64 4.00
2024/09/24 MA T2 4 13.10 3.25 4.00
2024/09/24 MA T2 5 10.80 3.42 4.00
2024/09/24 MA T2 6 14.00 3.69 4.00
2024/09/24 MA T2 7 11.50 3.67 4.00
2024/09/24 MA T2 8 11.30 3.54 4.00
2024/09/24 MA T2 9 12.60 3.44 4.00
2024/09/24 MA T2 10 12.10 3.69 4.00
2024/09/24 MA T2 11 11.10 3.38 4.00
2024/09/24 MA T2 12 12.90 3.23 4.00
2024/09/24 MA T3 1 12.50 3.28 4.00
2024/09/24 MA T3 2 11.40 3.45 4.00
2024/09/24 MA T3 3 11.10 3.63 4.00
2024/09/24 MA T3 4 12.00 3.20 4.00
2024/09/24 MA T3 5 12.40 3.57 4.00
2024/09/24 MA T3 6 10.90 3.67 4.00
2024/09/24 MA T3 7 14.00 3.53 4.00
2024/09/24 MA T3 8 10.10 3.57 4.00
2024/09/24 MA T3 9 13.10 3.61 4.00
2024/09/24 MA T3 10 10.20 3.77 4.00
2024/09/24 MA T3 11 11.80 3.38 4.00
2024/09/24 MA T3 12 11.50 3.53 4.00
2024/09/24 MB T1 1 7.20 3.49 4.00
2024/09/24 MB T1 2 8.50 3.76 4.00
2024/09/24 MB T1 3 7.60 3.64 4.00
2024/09/24 MB T1 4 6.90 3.81 4.00
2024/09/24 MB T1 5 7.10 3.85 4.00
2024/09/24 MB T1 6 8.10 3.55 4.00
2024/09/24 MB T1 7 9.80 3.52 4.00
2024/09/24 MB T1 8 7.40 3.40 4.00
2024/09/24 MB T1 9 7.90 3.34 4.00
2024/09/24 MB T1 10 8.30 3.12 4.00
2024/09/24 MB T1 11 7.60 3.65 4.00
2024/09/24 MB T1 12 7.20 3.54 4.00
2024/09/24 MB T2 1 8.10 3.73 4.00
2024/09/24 MB T2 2 6.80 3.45 4.00
2024/09/24 MB T2 3 9.00 3.68 4.00
2024/09/24 MB T2 4 7.20 3.12 4.00
2024/09/24 MB T2 5 7.70 3.56 4.00
2024/09/24 MB T2 6 6.70 3.37 4.00
2024/09/24 MB T2 7 6.30 3.20 4.00
2024/09/24 MB T2 8 8.30 3.43 4.00
2024/09/24 MB T2 9 9.10 3.54 4.00
2024/09/24 MB T2 10 8.50 3.73 4.00
2024/09/24 MB T2 11 8.80 3.50 4.00
2024/09/24 MB T2 12 7.80 3.55 4.00
2024/09/24 MB T3 1 7.90 3.21 4.00
2024/09/24 MB T3 2 9.00 3.63 4.00
2024/09/24 MB T3 3 9.30 3.35 4.00
2024/09/24 MB T3 4 8.40 3.10 4.00
2024/09/24 MB T3 5 8.80 3.34 4.00
2024/09/24 MB T3 6 8.30 3.52 4.00
2024/09/24 MB T3 7 9.20 3.39 4.00
2024/09/24 MB T3 8 7.70 3.49 4.00
2024/09/24 MB T3 9 8.90 3.30 4.00
2024/09/24 MB T3 10 9.50 3.62 4.00
2024/09/24 MB T3 11 9.80 3.53 4.00
2024/09/24 MB T3 12 8.90 3.40 4.00
")

# Resumen de estadísticas descriptivas
summary(data)

# Gráfico de barras para visualizar la altura promedio por tratamiento
ggplot(data, aes(x = Var, y = Alt, fill = tto)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(title = "Altura promedio por tratamiento",
       x = "Variedad",
       y = "Altura (cm)") +
  theme_minimal()

# Gráfico de barras para visualizar el diámetro promedio por tratamiento
ggplot(data, aes(x = Var, y = D, fill = tto)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(title = "Diámetro promedio por tratamiento",
       x = "Variedad",
       y = "Diámetro (cm)") +
  theme_minimal()

# Gráfico de barras para visualizar el número de hojas promedio por tratamiento
ggplot(data, aes(x = Var, y = H, fill = tto)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  labs(title = "Número promedio de hojas por tratamiento",
       x = "Variedad",
       y = "Número de hojas") +
  theme_minimal()

# ANOVA para Altura por Variedad
anova_alt_variedad <- aov(Alt ~ Var, data = data)
summary(anova_alt_variedad)

# ANOVA para Diámetro por Variedad
anova_diam_variedad <- aov(D ~ Var, data = data)
summary(anova_diam_variedad)

# ANOVA para Número de Hojas por Variedad
anova_hojas_variedad <- aov(H ~ Var, data = data)
summary(anova_hojas_variedad)

# Prueba post-hoc de Tukey para Altura por Variedad
tukey_alt_variedad <- TukeyHSD(anova_alt_variedad)
print(tukey_alt_variedad)

# Repite para las otras variables
tukey_diam_variedad <- TukeyHSD(anova_diam_variedad)
tukey_hojas_variedad <- TukeyHSD(anova_hojas_variedad)




