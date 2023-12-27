from PIL import Image
import numpy as np
import torchvision.transforms as transforms
import torch

# 加载JPEG图像
image_path = r'D:\learn_pytorch\ballplayer.JPEG'  # 图像文件的完整路径
image = Image.open(image_path)

# 定义transforms，包括resize、center crop和标准化
transform = transforms.Compose([
    transforms.Resize((256,256)),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])
# 应用transforms
image = transform(image)

# 检查图像通道数是否为3，如果不是，请进行相应的通道处理

# 将浮点数图像数据转换为一维数组
image_data = image.view(-1).numpy()

# 打印sample矩阵内的数值数量
print(f"Number of values in sample matrix: {len(image_data)}")

# 每行包含的浮点数数量
values_per_line = 8

# 创建一个.h文件并将数据写入其中
output_h_path = 'D:/learn_pytorch/dog.h'
with open(output_h_path, 'w') as h_file:
    h_file.write("float sample[] = {\n")
    for i, value in enumerate(image_data):
        h_file.write(f"{value:.6f}, ")
        if (i + 1) % values_per_line == 0:
            h_file.write("\n")
    h_file.write("};\n")

# 现在，程序将应用相同的预处理步骤并将数据保存在'D:/learn_pytorch/dog.h'文件中。











