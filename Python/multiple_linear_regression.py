
#Regresion Lineal multiple
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Cargar el dataser
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:,4].values

#Datos Categoricos
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X= LabelEncoder()
X[:, 3] = labelencoder_X.fit_transform(X[:,3])
onehotencoder = OneHotEncoder(categorical_features = [3])
X= onehotencoder.fit_transform(X).toarray()

#Ajuste de Variables Dummy
X= X[:, 1:]

# Split de Train y Test
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

#Ajustar el Modelo de Regresion lineal multiple al conjunto de entrenamiento 
from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

#Prediccion de Resultados
y_pred = regression.predict(X_test)

#Eliminción hacia atras
import statsmodels.api as sm
X = np.append(arr= np.ones((50,1)).astype(int), values = X, axis = 1)

SL = 0.05

X_opt = X[:, [0,1,2,3,4,5]]
regression_OLS = sm.OLS(endog =y, exog = X_opt).fit()
regression_OLS.summary()

X_opt = X[:, [0,1,3,4,5]]
regression_OLS = sm.OLS(endog =y, exog = X_opt).fit()
regression_OLS.summary()

X_opt = X[:, [0,3]]
regression_OLS = sm.OLS(endog =y, exog = X_opt).fit()
regression_OLS.summary()

#Podemos concluir que la variable de la columna 3 es la mejor para hacer 
#la prediccion y nos lleva a que podria ser una regresion lineal simple
#Sin embargo existen ma metodos los cuales podemos usar elegir la variable 
#Se puede automatizar esto de ir repitiendo lineas de codigo con un ciclo
# o una funcion que lo haga por nosotros






