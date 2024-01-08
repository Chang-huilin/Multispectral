##保存每一个波段对应的图像
import os
from PIL import Image
import numpy as np
import spectral.io.envi as envi

# 打开高光谱数据文件
matcha_hyp_data = envi.open(r'D:\茶叶干燥过程\茶叶多光谱图像\热风第二批140个样+水分\1鲜叶_processed\1\image_0000000000.hdr')

# 获取数据的维度
rows, cols, bands = matcha_hyp_data.shape

# 创建保存图像的文件夹（如果不存在）
save_folder = r'D:\茶叶干燥过程\茶叶多光谱图像\热风第二批140个样+水分\1鲜叶_processed\1\25个波段对应的图像'
os.makedirs(save_folder, exist_ok=True)
# 逐个波段保存图像
for i in range(24):
    # 获取当前波段的数据
    band_data = matcha_hyp_data.read_band(i)  # 注意索引从1开始

    # 将数据缩放到0-255的范围（适用于uint8图像）
    scaled_data = np.interp(band_data, (band_data.min(), band_data.max()), (0, 255))

    # 创建 PIL Image 对象
    image = Image.fromarray(scaled_data.astype(np.uint8))

    # 构建保存文件路径
    save_path = os.path.join(save_folder, f'{i+1}.bmp')

    # 保存图像为 JPG 格式
    image.save(save_path)

    print(f'Saved band {i+1}')

print('All bands saved.')
