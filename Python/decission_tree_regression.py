# Regresión con Arboles de DEcision

# Importar Librerias
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Cargar Dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values

#Modelo de Arboles de Decision
from sklearn.tree import DecisionTreeRegressor
regression = DecisionTreeRegressor(random_state= 0)
regression.fit(X,y)

#Prediccion
y_pred = regression.predict([[6.5]])

#Visualizacion de resultados
X_grid = np.arange(min(X), max(X),0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X, y, color ="red")
plt.plot(X, regression.predict(X), color = "blue")
plt.title("Arbol de Desicion")
plt.label("Posicion del Empleado")
plt.ylabel("Sueldo")
plt.show()
