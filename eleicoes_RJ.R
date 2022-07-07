install.packages("ggplot2")
install.packages("dplyr")
install.packages("electionsBR")

library(dplyr)
library(electionsBR)

eleicao_RJ <- read.csv("C:/Users/03283108/Documents/votacao_secao_2020_RJ.csv", header=TRUE, sep=";")
View(eleicao_RJ)

## selecionar os eleitores do Município do Rio de Janeiro
eleicao_RJ_Mun <- eleicao_RJ %>% 
  filter(NM_MUNICIPIO=="RIO DE JANEIRO")
View(eleicao_RJ_Mun)

## Analisar candidaturas
cargo_candidatos <- eleicao_RJ_Mun %>% 
  group_by(NM_VOTAVEL, DS_CARGO) %>% 
  summarise(quant_cargos=sum(QT_VOTOS))
View(cargo_candidatos)

## Vereador

vereadores_RJ <- eleicao_RJ_Mun %>% ## seleção de vereadores
  filter(DS_CARGO=="VEREADOR")
View(vereadores_RJ)

vereadores_RJ %>% 
  group_by(NR_ZONA, NM_VOTAVEL) %>% 
  summarise(contagem_votos=sum(QT_VOTOS))

vereador_zona <- eleicao_RJ_Mun %>% 
  group_by(NR_ZONA, NM_VOTAVEL) %>% 
  summarise(contagem_votos=sum(QT_VOTOS))
View(vereador_zona)

vereador_zona2 <- vereadores_RJ %>% ## contagem de vereadores por zona eleitoral
  group_by(NR_ZONA, NM_VOTAVEL) %>% 
  summarise(contagem_votos=sum(QT_VOTOS))
View(vereador_zona2)


vereador_teste2 <- vereadores_RJ %>% 
  group_by(NR_ZONA, NM_VOTAVEL) %>% 
  summarise(contagem=max(QT_VOTOS))
View(vereador_teste2)

install.packages("xlsx")
library("xlsx")

install.packages("WriteXLS")
library(WriteXLS)

install.packages("writexl")
library(writexl)

write_xlsx(vereador_teste2,path = "C:/Users/03283108/Documents/vereador.xlsx" )

