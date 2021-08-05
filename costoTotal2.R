
#--------------------------------------------------------------------------------------------------------------#
# Combinación de varillas

matAreas <- matrix(0, length(esp[,1]), length(esp[,1]))

for(i in 1:length(esp[,1])){
  for(j in 1:length(esp[,1])){
    if(i == j){
      matAreas[i,j] <- esp[i,2]
    } else {
      matAreas[i,j] <- esp[i,2] + esp[j,2]
    }
  }
}

matAreas

cantVarComb <- ceiling(Acero/matAreas)

costoTotalComb <- ((((b*(d+recub)) - (cantVarComb*matAreas))/10000) * costConcreto) + 
  (((cantVarComb*matAreas*(1/10000)) * 7650) * costAcero)
