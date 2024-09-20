# R basico
#alt + - (<-)
#ctrl + l 
#separador en ingles es punto(.)
#y la (,) para separar argumentos de una funcion

nombre <- "alexandra"
saludo <- "hola"
paste(saludo, nombre)
?paste #Buscar para que sirve, concatena
paste(saludo, nombre, sep = "_")
#ejemplo
(nth <- paste0(1:12, c("st", "nd", "rd", rep("th", 9))))
#instalar paquetes o nuevas herramientas
install.packages("tidyverse") #paquete de r para la ciencia de datos
install.packages("ggplot2")
#programacion base
notas <- c(15,16,17,18,5)
newnotas <- notas+1
newnotas
notas_p <- mean(newnotas)
notas_p
#programacion con tidyverse
library(tidyverse) #activar el paquete

#pipe => %>% (ctrl + shift + m)
notas <- c(15,16,17,18,5) %>% 
  +1 %>% 
  mean(.) #el punto significa el dato anterior
#COMPARACION (CTRL + SHIFT + R) -------------------------------------------------------------------------

# BASE --------------------------------------------------------------------
categorias <- c("categoria1","categoria2","categoria3","categoria4")
valores <- c(10,20,15,30)
barplot(valores,
        names.arg = categorias,
        col = "yellow",
        main = "Grafico de barras",
        xlab = "categorias",
        ylab = "valores")
