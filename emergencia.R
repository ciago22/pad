# Crear el dataframe a partir de los datos proporcionados
data <- read.table(text = "
Fecha    Var   tto    Em
2024/09/07 MA    T1    0
2024/09/07 MA    T2    0
2024/09/07 MA    T3    0
2024/09/07 MB    T1    0
2024/09/07 MB    T2    0
2024/09/07 MB    T3    0
2024/09/08 MA    T1    0
2024/09/08 MA    T2    0
2024/09/08 MA    T3    0
2024/09/08 MB    T1    0
2024/09/08 MB    T2    0
2024/09/08 MB    T3    0
2024/09/09 MA    T1    0
2024/09/09 MA    T2    0
2024/09/09 MA    T3    0
2024/09/09 MB    T1    0
2024/09/09 MB    T2    0
2024/09/09 MB    T3    0
2024/09/10 MA    T1    0
2024/09/10 MA    T2    0
2024/09/10 MA    T3    0
2024/09/10 MB    T1    0
2024/09/10 MB    T2    0
2024/09/10 MB    T3    0
2024/09/11 MA    T1    4
2024/09/11 MA    T2    0
2024/09/11 MA    T3    0
2024/09/11 MB    T1    2
2024/09/11 MB    T2    0
2024/09/11 MB    T3    0
2024/09/12 MA    T1    7
2024/09/12 MA    T2    0
2024/09/12 MA    T3    0
2024/09/12 MB    T1    5
2024/09/12 MB    T2    1
2024/09/12 MB    T3    0
2024/09/13 MA    T1    1
2024/09/13 MA    T2    1
2024/09/13 MA    T3    0
2024/09/13 MB    T1    3
2024/09/13 MB    T2    2
2024/09/13 MB    T3    1
2024/09/14 MA    T1    0
2024/09/14 MA    T2    2
2024/09/14 MA    T3    1
2024/09/14 MB    T1    2
2024/09/14 MB    T2    1
2024/09/14 MB    T3    1
2024/09/15 MA    T1    0
2024/09/15 MA    T2    2
2024/09/15 MA    T3    1
2024/09/15 MB    T1    0
2024/09/15 MB    T2    2
2024/09/15 MB    T3    2
2024/09/16 MA    T1    0
2024/09/16 MA    T2    4
2024/09/16 MA    T3    3
2024/09/16 MB    T1    0
2024/09/16 MB    T2    1
2024/09/16 MB    T3    2
2024/09/17 MA    T1    0
2024/09/17 MA    T2    2
2024/09/17 MA    T3    2
2024/09/17 MB    T1    0
2024/09/17 MB    T2    2
2024/09/17 MB    T3    3
2024/09/18 MA    T1    0
2024/09/18 MA    T2    1
2024/09/18 MA    T3    4
2024/09/18 MB    T1    0
2024/09/18 MB    T2    2
2024/09/18 MB    T3    1
2024/09/19 MA    T1    0
2024/09/19 MA    T2    0
2024/09/19 MA    T3    1
2024/09/19 MB    T1    0
2024/09/19 MB    T2    1
2024/09/19 MB    T3    2
", header = TRUE)

# Convertir la columna de fecha a tipo Date
data$Fecha <- as.Date(data$Fecha)

# Calcular la suma de emergencias por fecha y tratamiento
emergencias_por_fecha_tto <- data %>%
  group_by(Fecha, tto) %>%
  summarise(Velocidad = sum(Em), .groups = 'drop') 

# Graficar la velocidad de emergencia por fecha y tratamiento
ggplot(emergencias_por_fecha_tto, aes(x = Fecha, y = Velocidad, color = tto, group = tto)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = "Velocidad de Emergencia por Fecha y Tratamiento",
       x = "Fecha",
       y = "Velocidad de Emergencia") +
  theme_minimal() +
  scale_color_manual(values = c("T1" = "blue", "T2" = "red", "T3" = "green")) +
  theme(legend.title = element_blank())

