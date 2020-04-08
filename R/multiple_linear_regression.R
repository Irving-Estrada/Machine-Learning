#Regresion Lineal multiple

#Cargar Dataset
dataset = read.csv('50_Startups.csv')

#Variables Dummy
dataset$State =  factor(dataset$State,
                        levels= c("New York", "California", "Florida"),
                        labels = c(1,2,3))

library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8) 
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)


#AJUSTAR EL MODELO DE REGRESION LINEAL MULTIPLE CON EL MODELO, 
#El punto hace referencia a que esta usando todas las variables independientes en lugar de escribirlas
#todas se pone un .
regression= lm(formula = Profit ~ .,
               data = training_set)


#Predecir los resultados con el conjunto testing
y_pred = predict(regression, newdata = testing_set)

#Eliminacion hacia atras
SL=0.05
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend ,
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend + Marketing.Spend ,
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend,
                data = dataset)
summary(regression)
