# squeezenet
 Deploying_CNN_on_FPGA_using_OpenCL
 
 我將原作者的範例，修改成可以自己更改輸入的圖片。
 https://github.com/Er1cZ/Deploying_CNN_on_FPGA_using_OpenCL
 
 第一步:
 
 打開change.py將任何圖片位置指定後，產生dog.h檔案，再利用SoC EDS重新compile host program。
 
使用方法:

1.燒錄de10_nano_opencl.img (16.1)在SD卡上

2.利用PuTTY與開發板連線

3.插上網路線(DE10 nano和電腦都要)

3.在PuTTY取得IP位置

4.開啟SoC EDS Command Shell利用scp指令將檔案寫入SD卡(github資料夾內的所有檔案)

5.回到PuTTY輸入以下指令:

cd ~

source ./init_opencl.sh

cd /your_path/

aocl program /dev/acl0 squeezenet.aocx

chmod +x squeezenet

./squeezenet

詳細請參考PDF檔

source code說明請參考原創作者:https://github.com/Er1cZ/Deploying_CNN_on_FPGA_using_OpenCL
