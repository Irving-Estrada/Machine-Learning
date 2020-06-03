#Clustering Jerarquico

#Cargar dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset [,4:5]

#Dendograma
dendrogram = hclust(dist(X, method = "euclidean"),
                    method = "ward.D")
plot(dendrogram,
     main = "Dendograma",
     xlab = "Clientes del centro comercial",
     ylab = "Distancia Euclidea")

#Custering jerarquico
hc = hclust(dist(X, method = "euclidean"),
                    method = "ward.D")

y_hc = cutree(hc, k = 5)


#Visualizacion
library(cluster)
clusplot(X, 
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 1,
         plotchar = FALSE,
         span = TRUE,
         main = "Clustering de clientes",
         xlab = "Ingresos anuales",
         ylab = "Puntuacion (1-100)"
)