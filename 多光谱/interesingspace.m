%感兴趣区域提取


for i = 1:120 
    filename = strcat('D:\\蒸汽\\1\\',num2str(i),'.bmp');
    A=imread(filename);
    imshow(A)
    B=imcrop(A,[440,250,750,750]);
    imshow(B);
    imwrite(B,strcat('C:\Users\79365\OneDrive\桌面\多光谱数据\叶绿素\1\',num2str(i),'.bmp'));
end