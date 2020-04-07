
#Regrsión lineal simple 

# Importar librerias
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar dataset
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Dividir dataset en entrenamiento y testing
from sklearn.model_selection import train_test_split
X_train, X_test,y_train,y_test = train_test_split(X,y, test_size = 1/3, random_state=0)

# Creacion de modelo de regresion lineal para entrenamiento 
from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train) #es necesario que sean del mismo tamaño para que funcione

# Prediccion de conjunto de test
y_pred =regression.predict(X_test)

#Visualizar resultados de entrenamiento 
plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regression.predict(X_train), color = "blue")
plt.title("Sueldo Vs Años de Experiencia(Conjunto de Entrenamiento)")
plt.xlabel("Años de experiencia")
plt.ylabel("Sueldo en dlls")
plt.show()


#Visualizar resultados de test 
plt.scatter(X_test, y_test, color = "red")
#queda igual debido a que la recta de gregresion lineal es unica y ya habiamos hecho el modelado con X_train
plt.plot(X_train, regression.predict(X_train), color = "blue") 
plt.title("Sueldo Vs Años de Experiencia(Conjunto de Entrenamiento)")
plt.xlabel("Años de experiencia")
plt.ylabel("Sueldo en dlls")
plt.show()


