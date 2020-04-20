# SVR
#Carga de Dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

#Carga de Libreria e1071 para usar SVM
#install.packages("e1071")
library(e1071)

#Modelo SVM
regression = svm(formula = Salary ~ .,
                 data = dataset,
                 type = "eps-regression",
                 kernel= "radial")

#Prediccion con Nivel de 6.5 ¿Cuanto debería de ganar?
y_pred = predict(regression, newdata= data.frame(Level =6.5))
library(ggplot2)

#Grafico de SVM
x_grid = seq(min(dataset$Level), max(dataset$Level),0.1)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = "red")+
  geom_line(aes(x = dataset$Level, y = predict(regression, newdata = data.frame(Level= dataset$Level))),
            color ="blue")+
  ggtitle("Prediccion SVM")+
  xlab("Nivel del empleado")+
  ylab("Salario")

