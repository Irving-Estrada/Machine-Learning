# ANN

#Cargar Dataset
dataset = read.csv('Churn_Modelling.csv')
dataset = dataset [, 4:14]

#Codificar los Factores para la ANN
dataset$Geography = as.numeric(factor(dataset$Geography,
                                      levels = c("France","Spain","Germany"),
                                      labels = c(1, 2, 3)))

dataset$Gender = as.numeric(factor(dataset$Gender,
                                   levels = c("Female", "Male"),
                                   labels = c(1,2)))

# Dividir Entrenamiento y Testing
library(caTools)
set.seed(123)
split = sample.split(dataset$Exited, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Escalado de Variables
training_set[,-11] = scale(training_set[,-11])
testing_set[,-11] = scale(testing_set[,-11])

# Creacion de ANN 
#install.packages("h2o")
library(h2o)
h2o.init(nthreads = -1)
classifier = h2o.deeplearning(y = "Exited",
                              training_frame = as.h2o(training_set),
                              activation = "Rectifier",
                              hidden = c(6,6),
                              epochs = 100,
                              train_samples_per_iteration = -2)

# Prediccion de los resultados
prob_pred = h2o.predict(classifier, newdata = as.h2o(testing_set[,-11]))
y_pred = (prob_pred > 0.5)
y_pred = as.vector(y_pred)

# Matriz de Confusion
cm = table(testing_set[,11], y_pred)

# Cerrar Servidor
h2o.shutdown()

