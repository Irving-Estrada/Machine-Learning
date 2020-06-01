#K-Means

#Cargar Dataset 
dataset = read.csv('Mall_Customers.csv')
X = dataset[, 4:5]

#Metodo del Codo
set.seed(6)
wcss = vector()
for (i in 1:10){
  wcss[i] <- sum(kmeans(X, i)$withinss)
}
plot(1:10, wcss, type ='b', main ="Metodo del codo",
     xlab ="Numero de cluster (k)", ylab ="WCSS(k)")

#Aplicar el algoritmo k-means
set.seed(29)
kmeans <- kmeans (X, 5, iter.max =300, nstart =10)

#Visualizacion de cluster
library(cluster)
clusplot(X, 
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 1,
         plotchar = FALSE,
         span = TRUE,
         main = "Clustering de clientes",
         xlab = "Ingresos anuales",
         ylab = "Puntuacion"
)


