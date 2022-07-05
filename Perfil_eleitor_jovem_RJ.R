install.packages("dplyr")

library(dplyr)

dados_eleitorado <- read.csv("C:/Users/03283108/Downloads/perfil_eleitor_secao_ATUAL_RJ.csv", header=TRUE, sep=";")
View(dados_eleitorado)

## Selecionar os eleitores do Municipio do Rio de Janeiro
eleitores_RJ <- dados_eleitorado %>%
  filter(NM_MUNICIPIO=="RIO DE JANEIRO")
View(eleitores_RJ)

## Selecionar os eleitores do Municipio do Rio de Janeiro entre 16 e 29 anos
eleitores_RJ_jovens <- eleitores_RJ %>%
  filter(CD_FAIXA_ETARIA=="1600"| CD_FAIXA_ETARIA == "1700" | CD_FAIXA_ETARIA == "1800" | 
           CD_FAIXA_ETARIA == "1900" | CD_FAIXA_ETARIA == "2000" | CD_FAIXA_ETARIA == "2124"| 
           CD_FAIXA_ETARIA == "2529")
View(eleitores_RJ_jovens)

## Calcular o percentual de genero entre os eleitores
eleitores_RJ_jovens %>%
  summarise(genero_feminino=sum(DS_GENERO=="FEMININO"), quantidade_eleitores=sum(QT_ELEITORES_PERFIL)) %>%
mutate(genero_feminino/quantidade_eleitores)

## Criar tabela só com dados de mulheres
voto_feminino <- eleitores_RJ_jovens %>%
  filter(DS_GENERO=="FEMININO")
View(voto_feminino)

voto_feminino %>%
  summarise(quant_eleitores_feminino=sum(QT_ELEITORES_PERFIL))

## Criar tabela só com dados de homens
voto_masculino2 <- eleitores_RJ_jovens %>% 
  filter(DS_GENERO=="MASCULINO")
View(voto_masculino2)

voto_masculino2 %>% 
  summarise(quant_eleitores_masculino=sum(QT_ELEITORES_PERFIL))

## Eleitores com deficiencia
eleitores_RJ_jovens %>% 
  summarise(quant_eleitores_PCD=sum(QT_ELEITORES_DEFICIENCIA))

## Eleitores com nome social
eleitores_RJ_jovens %>% 
  summarise(quant_nome_social=sum(QT_ELEITORES_INC_NM_SOCIAL))

## Estado Civil dos eleitores jovens
names(eleitores_RJ_jovens)
head(eleitores_RJ_jovens)

eleitores_RJ_jovens %>% 
  group_by(DS_ESTADO_CIVIL) %>% 
  summarise(quant_estado_civil=sum(QT_ELEITORES_PERFIL))

## Escolaridade dos eleitores jovens
eleitores_RJ_jovens %>% 
  group_by(DS_GRAU_ESCOLARIDADE) %>% 
  summarise(quant_escolaridade=sum(QT_ELEITORES_PERFIL))

## Faixa etária dos jovens
eleitores_RJ_jovens %>% 
  group_by(DS_FAIXA_ETARIA) %>% 
  summarise(qnt_faixa_etaria=sum(QT_ELEITORES_PERFIL))

