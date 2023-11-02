% 读取BMP图像
imagePath = 'C:\Users\79365\OneDrive\桌面\多光谱数据\图像\1\1.bmp';
rgbImage = imread(imagePath);

% 获取图像的尺寸
[height, width, ~] = size(rgbImage);

% 将RGB图像转换为HSI图像
hsiImage = zeros(height, width, 3);

for i = 1:height
    for j = 1:width
        hsiPixel = rgb_to_hsi(rgbImage(i, j, :));
        hsiImage(i, j, :) = hsiPixel;
    end
end

% 显示HSI图像
figure;
imshow(hsiImage);

% 保存HSI图像到指定目录
savePath = 'C:\Users\79365\OneDrive\桌面\多光谱数据\HSI\hsi_image1.bmp';
imwrite(hsiImage, savePath);