# Datos de entrada

b            <- 30    # cm
pef          <- 52    # cm
recub        <- 3     # cm
fc           <- 250   # kg/cm2
fy           <- 4200  # kg/cm2
ecu          <- 0.003 # 
Mu           <- 25    # ton-m
FR           <- 0.9   # 
costConcreto <- 1400  # m3
costAcero    <- 18    # kg

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
q <- 1 - sqrt(1-((2*Mu*100000)/(FR*0.85*fc*b*pef^2)))

# rho
rho <- q*((fc*0.85)/fy)

# Area de acero (cm2)








