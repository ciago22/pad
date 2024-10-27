
# IMPORTAR DATOS CSV ----------------------------------------------------------
chucho <- read.csv(file = "LA MOLINA 2014 POTATO WUE (FB) - fb.csv"
                   , header= TRUE, sep = ",")
?read.csv
chucho
View(chucho) #para visualizar la data

direccion <- choose.files()
direccion #para saber la direccion del archivo

# IMPORTAR DATOS TSV ------------------------------------------------------
library(tidyverse)
data <- read_tsv( file = direccion ,
                  quote = "\"",
                  col_names = TRUE)
View(data)

# IMPORTAR DATOS EXCEL ----------------------------------------------------

install.packages("readxl")
library(readxl)
direccion2 <- choose.files()
mis_datos <- read_xlsx(direccion2,
                       sheet = 2,
                       col_names = TRUE)
library(openxlsx)
excel <- openxlsx::read.xlsx(direccion2, 
                             sheet = "fb",
                             colNames = TRUE)

# RSTUDIO IMPORT ----------------------------------------------------------
library(readxl)
DATA <- read_excel("LA MOLINA 2014 POTATO WUE (FB).xlsx", 
                                            sheet = "fb")
View(DATA)

URL <- "https://docs.google.com/spreadsheets/d/15r7ZwcZZHbEgltlF6gSFvCTFA-CFz
VBWwg3mFlRyKPs/edit?gid=172957346#gid=172957346"
library(googlesheets4)
GS <- as_sheets_id(URL)
GS
fb <- range_read(GS, sheet = "fb")







