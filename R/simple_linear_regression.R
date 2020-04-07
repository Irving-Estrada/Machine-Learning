#Regresion lineal simple

#Importar dataset
dataset = read.csv('Salary_Data.csv')

#Cargar libreria y dividir conjunto entrenamiento y training
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)
#Utilizando summary(Regressor) podemos ver muchos datos de nuestra regresion lineal 
#que tan buena es, lo mas importante son los coeficientes la relevancia estadistica
#se representa en los coeficientes con asteriscos *** el maximo de asteriscos es tres
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#predecir resultados con el congunto de test
#Aqui usamos el modelo de prediccion el cual es regresor y lo comparamos con el testis_set


#Visualizacion de los datos en el conjunto de entrenamiento
#install.packages("ggplot2")
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
                 colour = "red")+
  geom_line(aes(x =training_set$YearsExperience,
                             y = predict(regressor, newdata = training_set)),
                         colour = "blue")+
  ggtitle("Sueldo vs Años de experiencia ") +
  xlab("Años de experiencia")+
  ylab("Sueldo")

#Visualisacion de los resultados de testing
ggplot()+
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red")+
  geom_line(aes(x =training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue")+
  ggtitle("Sueldo vs Años de experiencia (Testing)") +
  xlab("Años de experiencia")+
  ylab("Sueldo")


