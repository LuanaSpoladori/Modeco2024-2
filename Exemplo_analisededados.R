# Importação dos dados

install.packages("readr") #instala pacote
library(readr)            #carrega pacote

#carrega os dados

dados  <- read.csv("C:/Users/20231enpro0194/Downloads/olimpiadas.csv")

##########################
# Tabelas de frequência #
#########################

# Tabelas simples

table(dados$Sex) #quantidade de mulheres e homens, valores absolutos.
table(dados$Sex)/nrow(dados) #proporção, valores relativos.

# Tabela de dupla entrada

table(dados$Sex,dados$NOC) #distribuição de F e M por comitê.

#############
# Gráficos #
############

install.packages("esquisse") 
library(esquisse)

# Dados somente do Brasil

install.packages("dplyr") 
library(dplyr)

dados_brasil <- dados %>% filter (NOC == "BRA")


library(ggplot2)

ggplot(dados) +
 aes(x = Sex) +
 geom_bar(fill = "#112446") +
 theme_light()

#############################
# Estatísticas descritivas #
###########################

# Estatísticas descritivas para idade:

min(dados$Age, na.rm = TRUE) #mínimo
max(dados$Age, na.rm = TRUE) #máximo
mean(dados$Age, na.rm = TRUE)#média
sd(dados$Age, na.rm = TRUE) #desvio-padrão

esquisser(dados)

dados_F <- dados %>% filter (Sex == "F") #separando dados das mulheres
mean(dados_F$Weight, na.rm = TRUE)

dados_M <- dados %>% filter (Sex == "M") #separando dados dos homens
mean(dados_M$Weight, na.rm = TRUE)

dados %>% group_by(Sex) %>% summarise( media = mean(Weight, na.rm = TRUE))




