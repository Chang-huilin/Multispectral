# SVR（Support Vector Regression）和SVM（Support Vector Machines）都是基于支持向量机（SVM）算法的变种。它们都属于监督学习算法，用于回归和分类问题

1. **SVM（Support Vector Machines）**:

   SVM 是一种用于分类问题的机器学习算法。其基本思想是找到一个最优的超平面，将不同类别的数据点分隔开。在二维空间中，这个超平面就是一条直线，但在高维空间中，它是一个超平面。SVM 的目标是找到离超平面最近的数据点，这些数据点被称为支持向量。SVM 试图最大化这些支持向量与超平面之间的距离，即间隔（margin）。这种方法使得SVM在处理线性和非线性分类问题时非常有效。

2. **SVR（Support Vector Regression）**:

   SVR 是 SVM 的回归版本。与分类问题不同，回归问题的目标是预测一个连续的输出，而不是将数据点分为不同的类别。SVR 的基本思想是在特征空间中找到一个超平面，使得训练数据点尽可能地靠近这个超平面。与分类的SVM类似，SVR也使用支持向量来确定超平面的位置。SVR的目标是使得预测值与真实值之间的误差最小化，并且允许一定的误差范围，这个范围由一个参数ε（epsilon）来控制。

总的来说，SVM 主要用于分类问题，而SVR 用于回归问题。它们的共同点在于都使用了支持向量和间隔最大化的思想，但在处理不同类型的问题时有不同的应用方

## 多标签分类问题

1. ML-KNN、ML-DT、Rank-SVM、CML
