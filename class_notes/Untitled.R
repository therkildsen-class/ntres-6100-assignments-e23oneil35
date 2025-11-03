

for(i in 1:10) {
  print(i)
}

volumes = c(1.6, 3, 8)


for(volume in volumes){
  
  mass <- 2.65 * volume ^ 0.9
  print(mass)
}

for (i in 1:3){
  mass <- 2.65 * i ^ 0.9
  print(mass)
  
}

for (i in 1:length(volumes)){
  mass <- 2.65 * i ^ 0.9
  print(mass)
  
}

for (i in seq_along(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  print(mass)
  
}

##store results##

masses <- vector("numeric", length = length(volumes))

for (i in seq_along(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  masses[i] <- mass
}

###convert pounds to kilograms###

mass_lbs <- c(2.2, 3.5, 9.6, 1.2)
mass_kg <- vector("numeric", length = length(mass_lbs))

mass_kg = 2.2 * mass_lbs

for (i in seq_along(mass_lbs)){
  mass_kg[i]= 2.2 * mass_lbs[i]
  
}

mass_kg

mass_lbs*2.2



