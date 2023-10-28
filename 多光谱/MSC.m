[xmsc,me]=MSC(X,1,25);  %1为第一个变量 25为最后一个变量

x_values = linspace(660, 924, 25); % 在660到924之间生成25个等间距的数值
plot(x_values, xmsc);

xlabel('Wavelength(nm)'); % 请将'横坐标标签'替换为你想要显示的横坐标标签

ylabel('Reflectance(%)'); % 请将'纵坐标标签'替换为你想要显示的纵坐标标签

title('MSC'); % 请将'图表标题'替换为你想要显示的图表标题
