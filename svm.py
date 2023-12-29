from sklearn.svm import SVR
from sklearn.preprocessing import StandardScaler #可做标准化
from sklearn.model_selection import train_test_split

#读入数据
import pandas as pd
import numpy as np
import matplotlib.pylab as plt


df=pd.read_excel(r'C:\Users\79365\OneDrive\桌面\图像-叶绿素\叶绿素\原始数据\day1_140.xlsx')
x=df.iloc[:,1:5]
y=df['目标']
#标准化
std=StandardScaler()
x_std=std.fit_transform(x)
#拆分训练集
x_train, x_test, y_train, y_test= train_test_split(x_std,y,train_size=0.75)
#svm建模
svm_regression = SVR()
svm_regression.fit(x_train,y_train)
#模型效果
print(svm_regression.score(x_test,y_test))
