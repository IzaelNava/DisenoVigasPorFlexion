source("AsFinal.R")
source("costoTotal1.R")
source("costoTotal2.R")

# Datos de entrada

b            <- 30    # cm
d            <- 52    # cm (peralte efectivo)
recub        <- 3     # cm
fc           <- 250   # kg/cm2
fy           <- 4200  # kg/cm2
ecu          <- 0.003 # 
Mu           <- 25    # ton-m
FR           <- 0.9   # 
costConcreto <- 1400  # m3
costAcero    <- 18    # kg
tamAgre      <- 1.9   # cm

Ductilidad <- c("Baja", "Media", "Alta")[3]



Acero <- Asfinal(b, d, recub, fc, fy, ecu, Mu, FR, costConcreto, costAcero, Ductilidad)

if(Acero == 0) {
  print("Redimensionar sección de viga")
} else {
  costoTotal <- costoTotal1(b, d, recub, Acero, costConcreto, costAcero)
  costoTotalCombinado <- costoTotal2(b, d, recub, costoTotal)
}


Acero
costoTotal
costoTotalCombinado

# comentario
plot(rnorm(10), rnorm(10))
