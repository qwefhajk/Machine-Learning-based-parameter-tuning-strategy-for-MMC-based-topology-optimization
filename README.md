# Machine-Learning-based-parameter-tuning-strategy-for-MMC-based-topology-optimization
_all code for this study in MMC-master.zip_

## 简单介绍
MMC_cantilever和MMC_Lshape函数是分别是两个算例的求解函数，FUNCTION文件夹是子函数。

pso.m运行可以得到论文中的结果，对应不同算例需要改变pso.m中对应的求解函数以及model，这里求解函数指MMC_cantilever.m和MMC_Lshape.m，model是图像分类模块的模型。

pkl文件是利用机器学习训练好的模型，后缀为ET的对应是cantilever算例的模型。后缀ET-L5的是Lshape算例的模型。

Lshape和cantilever-beam压缩包是机器学习的训练数据
## 各个代码的意思
### 需要更改路径的代码
* PSO.m <br>
  这是优化的主运行程序，默认是进行悬臂梁算例的优化。因此代码中所采用的的求解迭代函数为MMC188.m，MMC188.m中有图片的保存路径，需要按自己的需求更改。
* MMC188.m and MMC_Lshape.m <br>
  分别对应两个算例的MMC优化迭代函数，需要更改保存路径。
* switch.py <br>
  将迭代的保存的jpg图片转化为png图片，以区别新旧的粒子种群迭代出的图像。需要更改图片的路径。
* test.py <br>
  对生成的图片进行识别，给定图片的标签，确定迭代的结构是否为可行解。需要对不同的例子更改不同的pkl模型文件，以及图片的路径。

### 不需要更改的代码
* BasicKe.m
* Heaviside.m
* tPhi.m
* tvoid.m
* variables.m
* subsolv.m
* mmasub.m
* afterProcessing.m <br>
  程序自动运行结束后，会保存一个all.mat的文件，直接运行此代码可以将迭代过程中的粒子最优解pbest以及迭代顺序的全局最优解gbest等关键的程序结果提取出来。
## 程序结果
  ![Alt text](/img/悬臂梁的优化结果.png)


