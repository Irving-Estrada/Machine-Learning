# Regresion polinomica

dataset = read.csv('Position_SAlaries.csv')
dataset = dataset [, 2:3]

#Regresion Lineal Simple
lin_reg = lm(formula = Salary ~.,
             data = dataset)


#Regresion Polinomial
dataset$Level2 = dataset$Level ^2
dataset$Level3 = dataset$Level ^3
dataset$Level4 = dataset$Level ^4
poly_reg = lm(formula =  Salary ~ .,
              data =  dataset)

#Visualizacion de Regresion Lineal
library(ggplot2)
ggplot() + 
  geom_point(aes(x= dataset$Level, y = dataset$Salary),
             color = "red")+
  geom_line(aes(x =dataset$Level, y=predict(lin_reg, newdata = dataset)),
           color = "blue")+
  ggtitle("Prediccion de Regresion Lineal")+
  xlab("Nivel de Empleado")+
  ylab("Salario")

#Visualizacion de Regresion Polinomica
ggplot() + 
  geom_point(aes(x= dataset$Level, y = dataset$Salary),
             color = "red")+
  geom_line(aes(x =dataset$Level, y=predict(poly_reg, newdata = dataset)),
            color = "blue")+
  ggtitle("Prediccion de Regresion Polinomica")+
  xlab("Nivel de Empleado")+
  ylab("Salario")


#Prediccion de Nuevos Datos con Regresion Lineal
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))





#Prediccion con Nuevos Datos con Regresion Polinomica
y_pred_poly = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                     Level2 = 6.5^2,
                                                     Level3 = 6.5^3,
                                                     Level4 = 6.5^4))


