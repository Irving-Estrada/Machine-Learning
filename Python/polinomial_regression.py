
#Regresion Polinomica

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Cargar Dataset
dataset = pd.read_csv('Position_Salaries.csv')

#Definir Variables X y y
X = dataset.iloc[: , 1:2].values
y = dataset.iloc[: , 2].values

#Regresion Lineal simple (Para Ver Diferencias)
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X,y)

#la Regresion Polinomica t
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly =  poly_reg.fit_transform(X)
lin_reg2 = LinearRegression()
lin_reg2.fit(X_poly, y)


#Visualizacion de Regresion lineal simple
plt.scatter(X, y , color ="red")
plt.plot(X, lin_reg.predict(X), color = "blue")
plt.title("Modelo de Regresion lineal Simple")
plt.xlabel("Posicion del empleado")
plt.ylabel("Sueldo del Empleado")
plt.show()

#Visualizacion de Regresion Polinomica
X_grid =np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X, y , color ="red")
plt.plot(X_grid, lin_reg2.predict(poly_reg.fit_transform(X_grid)), color = "blue")
plt.title("Modelo de Regresion lineal Polinomial")
plt.xlabel("Posicion del empleado")
plt.ylabel("Sueldo del Empleado")
plt.show()

#Prediccion de nuestros modelos

lin_reg.predict([[6.5]])
lin_reg2.predict(poly_reg.fit_transform([[6.5]]))












