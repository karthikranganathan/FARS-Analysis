library(foreign)
VEH_15 <- read.dbf('VEH_AUX.dbf')

VEH_15$A_IMP1[VEH_15$A_IMP1==1]<- "Non-Collision" 
VEH_15$A_IMP1[VEH_15$A_IMP1==2]<- "Front" 
VEH_15$A_IMP1[VEH_15$A_IMP1==3]<- "Right Side" 
VEH_15$A_IMP1[VEH_15$A_IMP1==4]<- "Rear"
VEH_15$A_IMP1[VEH_15$A_IMP1==5]<- "Left Side"
VEH_15$A_IMP1[VEH_15$A_IMP1==6]<- "Other" 
VEH_15$A_IMP1[VEH_15$A_IMP1==7]<- "Unknown" 





#Vehicle Body Type

VEH_15$A_BODY[VEH_15$A_BODY==1] <- "Passenger Car"
VEH_15$A_BODY[VEH_15$A_BODY==2] <- "Light Truck - Pickup"
VEH_15$A_BODY[VEH_15$A_BODY==3] <- "Light Truck - Utility"
VEH_15$A_BODY[VEH_15$A_BODY==4] <-"Light Truck - Van"
VEH_15$A_BODY[VEH_15$A_BODY==5] <- "Light Truck - Other"
VEH_15$A_BODY[VEH_15$A_BODY==6] <- "Large Truck"
VEH_15$A_BODY[VEH_15$A_BODY==7] <- "Motorcycle"
VEH_15$A_BODY[VEH_15$A_BODY==8] <- "Bus"
VEH_15$A_BODY[VEH_15$A_BODY==9] <- "Other/Unknown"

#License of Driver
VEH_15$A_LIC_S[VEH_15$A_LIC_S==1] <- "Valid"
VEH_15$A_LIC_S[VEH_15$A_LIC_S==2] <- "Invalid"
VEH_15$A_LIC_S[VEH_15$A_LIC_S==3] <- "Unknown"
VEH_15$A_LIC_S[VEH_15$A_LIC_S==4] <- "Not Applicable"

#Motorcycle Licence
VEH_15$A_MC_L_S[VEH_15$A_MC_L_S==1]<- "Valid"
VEH_15$A_MC_L_S[VEH_15$A_MC_L_S==2]<- "Invalid"
VEH_15$A_MC_L_S[VEH_15$A_MC_L_S==3]<- "Unknown"
VEH_15$A_MC_L_S[VEH_15$A_MC_L_S==4]<- "Not Applicable"

#Speeding
VEH_15$A_SPVEH[VEH_15$A_SPVEH==1]<- "Speeding"
VEH_15$A_SPVEH[VEH_15$A_SPVEH==2]<- "Not Speeding"
VEH_15$A_SPVEH[VEH_15$A_SPVEH==3]<- "N/A"

#Roll OVer
VEH_15$A_VROLL[VEH_15$A_VROLL==1] <- "Roll OVer"
VEH_15$A_VROLL[VEH_15$A_VROLL==2] <- " No Roll OVer"

#Distracted
VEH_15$A_DRDIS[VEH_15$A_DRDIS==1] <- "Distracted"
VEH_15$A_DRDIS[VEH_15$A_DRDIS==2] <- "Not Distracted"

#Drowsy
VEH_15$A_DRDRO[VEH_15$A_DRDRO==1] <- "Drowsy"
VEH_15$A_DRDRO[VEH_15$A_DRDRO==2] <- "Not Drowsy"

#Creating a new dataframe
veha <- data.frame(VEH_15$ST_CASE,VEH_15$A_DRDRO,VEH_15$A_DRDIS,VEH_15$A_VROLL,VEH_15$A_SPVEH,VEH_15$A_MC_L_S,VEH_15$A_MOD_YR,
                   VEH_15$A_LIC_S,VEH_15$A_BODY,VEH_15$VEH_NO,VEH_15$A_IMP1)

#Column names
colnames(veha) <- c("St_Case","Drowsiness","Distracted","Rollover","Speeding","Motorcycle_Licence","Model_Year","License","Vehicle_Type","No_of_Vehicles","Initial Impact")

##Removing unknown Values

veha <- subset(veha, Model_Year != '9998' & Model_Year != '9999')

#Writing the file
write.csv(veha,"veha14.csv")

