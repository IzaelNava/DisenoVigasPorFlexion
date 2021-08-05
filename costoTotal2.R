
costoTotal2 <- function(b, d, recub, costoTotal){
#--------------------------------------------------------------------------------------------------------------#
  # Combinación de varillas
  
  matAreas <- matrix(0, length(costoTotal$esp[,1]), length(costoTotal$esp[,1]))
  
  for(i in 1:length(costoTotal$esp[,1])){
    for(j in 1:length(costoTotal$esp[,1])){
      if(i == j){
        matAreas[i,j] <- costoTotal$esp[i,2]
      } else {
        matAreas[i,j] <- costoTotal$esp[i,2] + costoTotal$esp[j,2]
      }
    }
  }
  
  cantVarComb <- ceiling(Acero/matAreas)
  
  costoTotalComb <- ((((b*(d+recub)) - (cantVarComb*matAreas))/10000) * costConcreto) + 
                                      (((cantVarComb*matAreas*(1/10000)) * 7650) * costAcero)
  
  
  idx <- which(costoTotalComb == min(costoTotalComb), arr.ind = TRUE)
  
  optimo <- data.frame(nv=cantVarComb[idx[1], idx[2]], 
                       var1=costoTotal$esp[idx[,1], 1], 
                       var2=costoTotal$esp[idx[,2], 1],
                       costo=costoTotalComb[idx[1], idx[2]]) 

  return(optimo)
  
}