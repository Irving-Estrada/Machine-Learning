#SVM
#Carga de Librerias
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Carga de Dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:,2].values

#Escalado de Variables
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
sc_y = StandardScaler()
X = sc_X.fit_transform(X)
y = sc_y.fit_transform(y.reshape(-1,1))

#SVR
from sklearn.svm import SVR
regression= SVR(kernel= "rbf")
regression.fit(X, y)
y_pred = sc_y.inverse_transform(regression.predict(sc_X.transform([[6.5]])))

plt.scatter (X, y,  color = "red")
plt.plot(X, regression.predict(X), color = "blue")
plt.title("Modelo de Regresion (SVR)")
plt.xlabel("Posicion de empleado")
plt.ylabel("Sueldo")
plt.show()
