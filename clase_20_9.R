#CREAR FUNCIONES
saludo <- function(x, y){
  paste(x, y)
}
saludo(z="Bye", f="UNTRM")


# MI PRIMERA FUNCTION -----------------------------------------------------

area <- function(r) {
  if (!is.numeric(r)) {
    return("Por favor, ingrese un valor numérico")
  } else if (r <= 0) {
    return("Por favor, ingrese un número mayor que 0")
  } else {
    return(pi * r^2)
  }
}
area(r=8)
area(r=10)
area(r= "a")


# IMC ---------------------------------------------------------------------

imc <- function(peso, altura_cm) {
  if (!is.numeric(peso) || !is.numeric(altura_cm)) {
    return("Por favor, ingrese valores numéricos para peso y altura")
  } else if (peso <= 0) {
    return("Por favor, ingrese un peso mayor que 0")
  } else if (altura_cm <= 0) {
    return("Por favor, ingrese una altura mayor que 0")
  } else {
    # Convertir altura de centímetros a metros
    altura_m <- altura_cm / 100
    
    # Calcular el IMC
    imc_value <- peso / (altura_m^2)
    imc_value <- round(imc_value, 2)  # Redondear a 2 decimales
    
    # Clasificación según el valor del IMC
    if (imc_value < 18.5) {
      clasificacion <- "Desnutrición"
    } else if (imc_value >= 18.5 && imc_value < 24.9) {
      clasificacion <- "Peso normal"
    } else if (imc_value >= 25 && imc_value < 29.9) {
      clasificacion <- "Sobrepeso"
    } else {
      clasificacion <- "Obesidad"
    }
    
    return(paste("Su IMC es:", imc_value, "y está clasificado como:", clasificacion))
  }
}


imc (94, 164)






