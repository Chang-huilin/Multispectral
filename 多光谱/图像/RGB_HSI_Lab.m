%提取叶绿素特征，rgb，hsi，lab
X=zeros(120,18);
for i = 1:120
    filename = strcat('C:\Users\79365\OneDrive\桌面\多光谱数据\叶绿素\1\',num2str(i),'.bmp');
 

    B=imread(filename);%读取一张彩色图像
    r=B(:,:,1);
    g=B(:,:,2);
    b=B(:,:,3);%读取彩色图像3个分量
    X={r,g,b};
    B1=cat(3,r,g,b);%重新合成彩色图像
    B1_lab=rgb2lab(B1);%转换成Lab颜色空间
    Lab_l=B1_lab(:,:,1);
    Lab_a=B1_lab(:,:,2);
    Lab_b=B1_lab(:,:,3);
    r=im2double(r);%RGB转HSI时 需要将unit8型转换成[0,1]double类型
    %im2double将输入转换为double类。
    %若输入是unit8,unit16或logical类，则输出转换成范围为[0，1]的double类；
    %若输入已经是double，则输出将返回一个与输入相同的数组。
    %mat2gray 是把一个double类的数组转换成取值范围为[0,1]的归一化double类数组。
    g=im2double(g);
    b=im2double(b);
    
    %将RGB空间转换成HSI空间：
    num=0.5*((r-g)+(r-b));
    nun=sqrt((r-g).^2+(r-b).*(g-b));
    theta=acos(num./(nun+eps));
    H=theta;
    H(b>g)=2*pi-H(b>g);
    H=H/(2*pi);
    num=min(min(r,g),b);
    den=r+g+b;
    den(den==0)=eps;
    S=1-3.*num./(den);
    I=(r+g+b)/3;
    
    %合成HSI图像
    HSI=cat(3,H,S,I);
    
    %subplot(2,2,1),imshow(B);
    %subplot(2,2,2),imshow(B1);
    %subplot(2,2,3),imshow(HSI);%一张画板上同时显示3张图
    
    %求R、G、B分量的均值.1-3列
    mR=mean2(r);
    mG=mean2(g);
    mB=mean2(b);
    %求R、G、B分量方差，4-6列
    sR=std2(r);
    sG=std2(g);
    sB=std2(b);
    %求H、S、I分量的均值，7-9列
    mH=mean2(H);
    mI=mean2(I);
    mS=mean2(S);
    %求H、S、I分量的方差，10-12列
    sH=std2(H);
    sS=std2(S);
    sI=std2(I);
    %计算Lab空间下的均值和方差，13-18列
    mLab_l=mean2(Lab_l);
    mLab_a=mean2(Lab_a);
    mLab_b=mean2(Lab_b);
    sLab_l=std2(Lab_l);
    sLab_a=std2(Lab_a);
    sLab_b=std2(Lab_b);
    %     T1=[];%创建一个空矩阵
    T=[mR mG mB sR sG sB mH mS mI sH sS sI mLab_l mLab_a mLab_b sLab_l sLab_a sLab_b];%统计特征矩阵
    %     T1=[T1;T];%样本集，每个样本的特征作为一行
    Iw(i,:)=T; %#ok<SAGROW>
end
xlswrite('C:\Users\79365\OneDrive\桌面\多光谱数据\叶绿素\120.xls',Iw); %#ok<XLSWT> %将数据保存到excel