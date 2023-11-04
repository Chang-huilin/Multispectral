% 读取BMP图像
imagePath = 'C:\Users\79365\OneDrive\桌面\多光谱数据\图像\6\1.bmp';
original = imread(imagePath);
original_gray = rgb2gray(original); % 将图像转换为灰度图像

% 将图像的像素值范围映射到[0, 1]
original_gray = double(original_gray) / 255;

% 计算灰度图的直方图
histogram = imhist(original_gray);

% 计算图像的总像素数
totalPixels = numel(original_gray);

% 计算每个灰度级的频率
frequency = histogram / totalPixels;

% 绘制原图直方图（频率表示）
x = 0:255;
figure;
subplot(2, 2, 1);
bar(x, frequency);
title('Original Histogram (Frequency)');

% 直方图均衡化后的直方图（频率表示）
result = histeq(original_gray);
histogram_equ = imhist(result);
frequency_equ = histogram_equ / totalPixels;

subplot(2, 2, 2);
bar(x, frequency_equ);
title('Equalized Histogram (Frequency)');

% 显示原图和处理后图像
subplot(2, 2, 3);
imshow(original_gray);
title('Original Image');
axis off;

subplot(2, 2, 4);
imshow(result);
title('Equalized Image');
axis off;
