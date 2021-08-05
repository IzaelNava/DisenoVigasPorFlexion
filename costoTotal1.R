

costoTotal1 <- function(b, d, recub, Acero, costConcreto, costAcero) {
  # data.frame con el número de varillas y área
  esp <- data.frame(varilla=c(3, 4, 5, 6, 8, 10, 12),
                    area =c(0.71, 1.27, 1.98, 2.85, 5.07, 7.94, 11.40), 
                    d=c(0.95, 1.27, 1.59, 1.91, 2.54, 3.18, 3.81))
  colnames(esp) <- c("# de varilla", "Área (cm2)", "diámetro (cm)")
  
  #Cantidad de varillas
  canVar <- ceiling(Acero/esp[,2])
  
  #Desperdicio de varillas
  desperdicio <- round((canVar*esp[,2]) - Acero, 2)
  
  # Costo total por metro lineal
  costoTotal <- ((((b*(d+recub)) - (canVar*esp[,2]))/10000) * costConcreto) + 
                            (((canVar*esp[,2]*(1/10000)) * 7650) * costAcero)
  
  # Tabla de resultados
  esp <- cbind(esp, canVar, round(costoTotal, 2))
  colnames(esp) <- c("# de varilla", "Area (cm2)", "diametro (cm)", "cantidad de varillas", "Costo Total por ml")
  esp
  
  # Espacio en el lecho (entre varillas)
  espacioLecho <- matrix(0, length(esp[,1]), 1)
  
  for (i in 1:length(esp[,1])){
    espacioLecho[i,] <- max(esp[i,3], tamAgre*1.5)
  }
  espacioLecho
  
  # espacio total de la varilla y espacios
  besp <- ((esp[,4]*esp[,3]) + (espacioLecho * (esp[,4]-1)))
  
  # Caben en el lecho, 0 es no y 1 es si
  caben <- matrix(0, length(esp[,1]), 1)
  
  for(i in 1:length(esp[,1])){
    if(besp[i,] > (b-2*recub)){
      caben[i,] <- 0
    } else {
      caben[i,] <- 1
    }
    
  }
  
   # # qué varillas se descartan
    
    descarte <- which(caben == 0)
    
   # Resultado con la misma varilla
    tabla1 <- esp[-descarte,]
    
    return(list(esp=esp, tabla1=tabla1))
   
}

   
   