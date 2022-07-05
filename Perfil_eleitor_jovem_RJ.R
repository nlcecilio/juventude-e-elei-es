install.packages("dplyr")

library(dplyr)

dados_eleitorado <- read.csv("C:/Users/03283108/Downloads/perfil_eleitor_secao_ATUAL_RJ.csv", header=TRUE, sep=";")
view(dados_eleitorado)
