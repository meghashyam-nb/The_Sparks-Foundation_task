                           THE SPARKS FOUNDATION GRIP PROGRAM(APRIL-2021)
                           DATA SCIENCE AND BUISNESS ANALYTICS INTERNSHIP
   TASK-2:FROM THE GIVEN "IRIS" DATASET PREDICT THE OPTIMUM NUMBER OF CLUSTER AND REPRESENT IT VISUALLY                           
  BY: MEGHASHYAM
  
  
  
#importing the dataset
datasets::iris

#installing packages
install.packages('tidyverse')       
install.packages('cluster')         
install.packages("reshape")
install.packages("ggplot2")

#Exploring the Data set
mydata <- iris

head(mydata)
View(mydata) 


                           #visualizing the dataset
                       #Let’s visualize the data now with ggplot2
    
#Sepal-Length vs. Sepal-Width
ggplot(mydata)+geom_point(aes(x = Sepal.Length, y = Sepal.Width), stroke = 2)+facet_wrap(~ Species)+labs(x = 'Sepal Length', y = 'Sepal Width')+theme_linedraw()

#Petal-Length vs. Petal-Width
ggplot(mydata)+geom_point(aes(x = Petal.Length, y = Petal.Width), stroke = 2)+facet_wrap(~ Species)+ labs(x = 'Petal Length', y = 'Petal Width')+theme_gray()

#Sepal-Length vs. Petal-Length
ggplot(mydata)+geom_point(aes(x = Sepal.Length, y = Petal.Length), stroke = 2)+facet_wrap(~ Species)+ labs(x = 'Sepal Length', y = 'Petal Length')+ theme_bw()

#Sepal-Width vs. Pedal-Width
ggplot(mydata)+geom_point(aes(x = Sepal.Width, y = Petal.Width), stroke = 2)+ facet_wrap(~ Species)+ labs(x = 'Sepal Width', y = 'Pedal Width')+theme_bw()


                               #Box plots

#sepal.length
ggplot(mydata)+geom_boxplot(aes(x = Species, y = Sepal.Length, fill = Species))+theme_bw()

#sepal.width
ggplot(mydata)+geom_boxplot(aes(x = Species, y = Sepal.Width, fill = Species))+theme_bw()

#petal.length
ggplot(mydata)+geom_boxplot(aes(x = Species, y = Petal.Length, fill = Species))+theme_bw()

#petal.width
ggplot(mydata)+geom_boxplot(aes(x = Species, y = Petal.Width, fill = Species))+theme_bw()


                                #k-means Clustering

#Find the optimal number of clusters by Elbow Method
set.seed(123)

wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(mydata[, -5], i)$withinss)
plot(1:10, wcss, type = 'b',  main = paste('The Elbow Method'),xlab = 'Number of Clusters',ylab = 'WCSS')
#the elbow point : k(centers) = 3



#Apply kmeans function to the feature columns
set.seed(123)
km <- kmeans( x = mydata[, -5] , centers = 3)

yclus <- km$cluster
table(yclus)


#Visualize the kmeans clusters
clusplot(mydata[, -5], yclus, lines = 0,shade = TRUE,color = TRUE, labels = 0, plotchar = FALSE, span = TRUE, main = paste('Clusters of Iris Flowers'))

#Comparing the clusters
mydata$cluster.kmean <- yclus
cm <- table(mydata$Species, mydata$cluster.kmean)
cm


                       #Scatter plots to view Species & kmeans custers
mydata$cluster.kmean <- as.factor(mydata$cluster.kmean)

# Sepal-Length vs. Sepal-Width (Species)
ggplot(mydata)+geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species) , size = 10)+ labs(x = 'Sepal Length', y = 'Sepal Width')+ggtitle("Species")+theme_bw()

# Sepal-Length vs. Sepal-Width (kmeans cluster)
ggplot(mydata)+geom_point(aes(x = Sepal.Length, y = Sepal.Width,  color = cluster.kmean) , size = 10)+ labs(x = 'Sepal Length', y = 'Sepal Width')+ggtitle("kmeans Cluster")+theme_bw()


# Petal-Length vs. Petal-Width (Species)
ggplot(mydata)+geom_point(aes(x = Petal.Length, y = Petal.Width,color = Species) , size = 10)+ labs(x = 'Petal Length', y = 'Petal Width')+ggtitle("Species")+theme_bw()

# Petal-Length vs. Petal-Width (kmeans cluster)
ggplot(mydata)+ geom_point(aes(x = Petal.Length, y = Petal.Width, color = cluster.kmean) , size = 10)+   labs(x = 'Petal Length', y = 'Petal Width')+ ggtitle("kmeans Cluster")+theme_bw()
-