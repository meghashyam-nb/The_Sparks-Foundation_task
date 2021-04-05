#!/usr/bin/env python
# coding: utf-8

# # GRIPAPR21 @ THE SPARKS FOUNDATION

# ### AUTHOR:MEGHASHYAM

# ### TASK1:PREDICTION USING SUPERVISED ML

# ### DATA SCIENCE AND BUISNESS ANALYTICS

# OBJECTIVE: TO DETERMINE THE PERCENTAGE OF STUDENT BASED ON THE HOURS OF STUDY

# ### Importing all the required libraries and Data set

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')


url = "http://bit.ly/w-data"
data= pd.read_csv(url)


# In[2]:


data.head(10)


# In[3]:


#plotting the above data
data.plot(x='Hours', y='Scores', style='*')  
plt.title('Hours vs Percentage')  
plt.xlabel('number of hours Studied')  
plt.ylabel('Percentage Score')  
plt.show()


# by looking at the graph we can conclude that there is positive linear relation between the number of hours studied and percentage scored

# ### Preparing the data

# In[4]:


#splitting the data into attributes(input) and labels(output)
from sklearn.model_selection import train_test_split
x=data.iloc[:,0:1].values
y=data.iloc[:,-1]


# In[5]:


#importing train_test_split from SKlearn
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)
x_train.shape


# ### Applying the regression model

# In[6]:


#importing the regression model
from sklearn.linear_model import LinearRegression
lg=LinearRegression()
lg.fit(x_train,y_train)


# In[7]:


lg.intercept_


# In[8]:


lg.coef_


# Ploting the regression line on the data

# In[9]:


line=lg.coef_*x+lg.intercept_
plt.scatter(x,y)
plt.plot(x,line);
plt.show()


# ### Prediction

# making prediction

# In[10]:


print(x_test)


# In[11]:


y_predict=lg.predict(x_test)
y_predict


# comparing the actual data vs predicted data

# In[12]:


comparison= pd.DataFrame({'Actual': y_test, 'Predicted': y_predict})  
comparison


# ### predicting the score of the student based on the hours studied .

# according to the question our aim is to predict the score of student if he/she has studied for 9.25hrs/day

# In[13]:


hours = 9.25
n_pred = lg.predict([[hours]])
print("No of Hours studied by student = {}".format(hours))
print("Predicted Score of the student = {}".format(n_pred[0]))


# ### Accuracy of the model

# In[14]:


np.round(lg.score(x_test,y_test)*100,2)


# ### Evaluating the model
we will be evaluating 
-R square
-Mean squared error
-Mean absolute error
# In[15]:


from sklearn import metrics

print("R2 score:",metrics.r2_score(y_test,y_predict))

print("Root mean squared error:",np.sqrt(metrics.mean_squared_error(y_test,y_predict)))

print("Mean absolute error:",metrics.mean_absolute_error(y_test,y_predict))


# In[ ]:





# In[ ]:




