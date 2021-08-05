

Asfinal <- function(b, d, recub, fc, fy, ecu, Mu, FR, costConcreto, costAcero, Ductilidad){
  
  # Cálculos
  
  # B1
  if(fc <= 280){
    B1 <- 0.85
  } else {
    if (1.05-(fc/140) >= 0.65){
      B1 <- 1.05-(fc/140) 
    } else {
      0.65
    }
  }
  
  # q
  q <- 1 - sqrt(1-((2*Mu*100000)/(FR*0.85*fc*b*d^2)))
  
  # rho
  rho <- q*((fc*0.85)/fy)
  
  # Area de acero (cm2)
  As <- rho*b*d
  
  # Acero mínimo por norma (cm2)
  Asmin <- 0.7*sqrt(fc)*(1/fy)*b*d
  
  # Acero máximo (cm2)
  As1.33 <- 1.33 * As
  
  # Área de acero balanceada (cm2)
  Asbal <- ((fc*0.85)/fy)*(6000*B1*b*d)*(1/(fy+6000))
  
  # Área de acero máxima por ductilidad
  if(Ductilidad == "Baja"){
    Asmaxduc <- 0.9*Asbal
  } else {
    if(Ductilidad == "Media"){
      Asmaxduc <- 0.75*Asbal
    } else {
      Asmaxduc <- 0.025*b*d
    }
  }
  
  # Área de acero fila
  if(As < min(Asmin, As1.33)){
    Asfinal <- min(Asmin, As1.33)
  } else {
    if(As > Asmaxduc){
      Asfinal <- 0
    } else {
      Asfinal <- As
    }
  }
  
  
  return(Asfinal)
  
}