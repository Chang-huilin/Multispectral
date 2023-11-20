cmake_minimum_required(VERSION 3.25)
project(Multispectral C)

set(CMAKE_C_STANDARD 11)

add_executable(Multispectral
        PLSR-DA_MATLAB/CV.m
        PLSR-DA_MATLAB/findFDR.m
        PLSR-DA_MATLAB/loadings_plot.m
        PLSR-DA_MATLAB/OPLS.m
        PLSR-DA_MATLAB/permtest.m
        PLSR-DA_MATLAB/PLSDA_main.m
        PLSR-DA_MATLAB/PLSDA_plot.m
        PLSR-DA_MATLAB/PLSR_main.m
        PLSR-DA_MATLAB/PLSR_plot.m
        PLSR-DA_MATLAB/sample.m
        PLSR-DA_MATLAB/scores_plot.m
        PLSR-DA_MATLAB/univar_plot.m
        PLSR-DA_MATLAB/Violin.m
        PLSR-DA_MATLAB/violinplot.m
        PLSR-DA_MATLAB/violinplot_SD.m
        PLSR-DA_MATLAB/VIP.m
        �����/ͼ��/boxplot.m
        �����/ͼ��/hsifigure.m
        �����/ͼ��/interesingspace.m
        �����/ͼ��/RGB_HSI_Lab.m
        �����/ͼ��/rgb_to_hsi.m
        �����/ͼ��/wenli.m
        �����/ͼ��/zhifangtu.m
        �����/����ɸѡ/CAR_PLS.m
        �����/����ɸѡ/RandomForests.m
        �����/center.m
        �����/Derivatives.m
        �����/Division.m
        �����/MSC.m
        �����/PCA.m
        �����/PLS.m
        �����/PLSR.m
        �����/RPD.m
        �����/shijie.m
        �����/SNV_pls.m
        �����/Zscore.m
        ����/csvtoexcel.m
        ����/DrawFigure.m
        ����/mean.m
        ���ݷ���/dataprogress.m
        ���ݷ���/division.m
        ���ݷ���/GA.m
        ���ݷ���/msc.m
        ���ݷ���/shijie.m)
