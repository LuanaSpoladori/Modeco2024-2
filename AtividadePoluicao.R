   #################################
  #   Pacotes                     #
  install.packages(("ggplt2"))  # Luana
 library(ggplot2)            # 
##############################

# 1) Diagrama de dispersão
ggplot(data = poluicao, aes(x = dia, y = CO)) + 
  geom_point() + 
  theme_classic() + 
  xlab("dia") + 
  ylab("CO") + 
  geom_smooth(method = "lm", se = FALSE)

# 2) Coeficiente de correlação
cor(poluicao$dia, poluicao$CO)

# 3) Ajuste 
Poluicao2 <- lm(formula = CO ~ dia, data = poluicao)
summary(Poluicao2)
# CO = 6.264608+0.019827*dia

# 4) Verificar o modelo

# - Coeficiente de determinação
# r-squared  = 0.1996

# - Verificar homocedasticidade dos resíduos
plot(poluicao$dia, rstandard(Poluicao2), xlab = "dia", ylab = "Resíduos")
abline(0,0)

# A hipotese de homocedasticidade pode ser aceita