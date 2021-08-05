Acero

# data.frame con el número de varillas y área
esp <- data.frame(varilla=c(3, 4, 5, 6, 8, 10, 12),
                  area =c(0.71, 1.27, 1.98, 2.85, 5.07, 7.94, 11.40))
colnames(esp) <- c("# de varilla", "Área (cm2)")
esp


canVar <- ceiling(Acero/esp[,2])
canVar

desperdicio <- round((canVar*esp[,2]) - Acero, 2)
desperdicio


costoTotal <- ((((b*(d+recub)) - (canVar*esp[,2]))/10000) * costConcreto) + 
                          (((canVar*esp[,2]*(1/10000)) * 7650) * costAcero)

costoTotal

esp <- cbind(esp, canVar, costoTotal)
colnames(esp) <- c("# de varilla", "Área (cm2)", "cantidad de varillas", "Costo Total por ml")
esp

  
