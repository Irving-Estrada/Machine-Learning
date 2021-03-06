#Regresion Log�stica

#Cargar dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset [,3:5]

#Dividir Entrenamiento y Testing
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
testing_set = subset (dataset, split == FALSE)

#Escalado de Datos
training_set[,1:2] = scale(training_set[,1:2])
testing_set[,1:2] = scale(testing_set[,1:2])


#Reresion Logistica con el Conjunto de Entrenamiento
classifier = glm(formula = Purchased ~ .,
                 data = training_set,
                 family = binomial)

#Prediccion con el Conjunto de Testing
prob_pred = predict(classifier, type = "response",
                    newdata =  testing_set[,-3])
y_pred = ifelse(prob_pred > 0.5, 1, 0)


#Matriz de Confunsion
cm = table(testing_set[,3], y_pred)

#Visualizacion de Conjunto de Entrenamiento 
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[,1]) - 1, max(set[,1]) + 1, by = 0.01)
X2 = seq(min(set[,2]) - 1, max(set[,2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata =  grid_set)
y_grid = ifelse(prob_set >0.5 ,1,0)
plot(set[,-3],
     main = 'Clasificacion (Training)',
     xlab = 'Edad', ylab = 'Sueldo',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


#Visualizavion de Conjunto de Testing
library(ElemStatLearn)
set = testing_set
X1 = seq(min(set[,1]) - 1, max(set[,1]) + 1, by = 0.01)
X2 = seq(min(set[,2]) - 1, max(set[,2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata =  grid_set)
y_grid = ifelse(prob_set >0.5 ,1,0)
plot(set[,-3],
     main = 'Clasificacion (Testing)',
     xlab = 'Edad', ylab = 'Sueldo',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
