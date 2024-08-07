###############
# Exercícios #
############## 

#################C1#################

install.packages("wooldridge")
library(wooldridge) 
?wage1
dados_c1 <- wage1

# Encontre o nível médio, mínimo e máximo de escolaridade médio da amostra.

mean(wage1$educ, na.rm = TRUE)
min(wage1$educ, na.rm = TRUE)
max(wage1$educ, na.rm = TRUE)

# Encontre o nível médio, mínimo e máximo de salário-hora, médio da amostra.

mean(wage1$wage, na.rm = TRUE)
min(wage1$wage, na.rm = TRUE)
max(wage1$wage, na.rm = TRUE)

# Quantas mulheres e homens existem na amostra?

table(wage1$female) 

#################C2#################

dados_C2 <- bwght
?bwght

# Quantas mulheres relataram fumar durante a gravidez? 

table(dados_C2$cigs) 

# Qual é o número médio de cigarros por dia?  

mean(dados_C2$cigs)

#Entre as mulheres que fumam, qual a média?

library(dplyr)
dados_fumam <- dados_C2 %>% filter (cigs > 0)
mean(dados_fumam$cigs) 

# relate a renda média familiar e seu desvio-padrao. 

mean(dados_C2$faminc) 
sd(dados_C2$faminc)

#################C5#################

dados_C5 <- fertil2 

# Qual os menores, maiores e a média de  valores de crianças da amostra?

min(dados_C5$children) #mínimo
max(dados_C5$children) #máximo
mean(dados_C5$children)#média

# Qual a porcentagem de mulheres que tem energia em casa? 

table(dados_C5$electric)/nrow(dados_C5)

#média de crianças que tem e não tem eletricidade 

dados_el <- dados_C5 %>% filter (electric ==  1) #com eletricide
mean(dados_el$children)
dados_sel <- dados_C5 %>% filter (electric == 0) #sem eletricide
mean(dados_sel$children)
mean(dados_el$children)

#################C6#################

dados_c6 <- countymurders 
?countymurders

# Quantos condado são listados? Quantos tiveram 0 assassinatos e sua porcentagem? 

dados_c6_1996 <- dados_c6 %>% filter (year  ==  1996)
dados_ass <- dados_c6_1996 %>% filter (murders == 0)
table(dados_c6_1996$execs)/nrow(dados_c6_1996)

# Qual é o maior número de assasinatos e execucoes

max(dados_c6_1996$murders)
max(dados_c6_1996$execs)

# Calcule o coeficiente de correlação entre execuções e assassinatos

cor(countymurders$murders, countymurders$execs) 

#################C7#################

dados_c7 <- alcohol
?alcohol

#Porcentagem de de hoemens com abuso de alcool e a taxa de emprego.

dados_ha <- dados_c7 %>% filter (abuse == 1)
table(dados_ha$status)/nrow(dados_ha)

#dados_des <- dados_c7 %>% filter (status == 2)
#table(dados_des$status)/nrow(dados_c7)

# Homens que abusam de alcool e empregados

dados_emp <- dados_c7 %>% filter (status == 3)
table(dados_emp$status)/nrow(dados_c7)

#homens que nao abusam de alcool e empregados

dados_hn <- dados_c7 %>% filter(abuse == 0)
table(dados_hn$status)/nrow(dados_hn)

