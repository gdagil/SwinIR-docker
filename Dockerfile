FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt update
RUN apt-get install git ffmpeg libsm6 libxext6 wget  -y

RUN pip install --upgrade pip
RUN pip install torch numpy opencv-python tqdm timm requests argparse

WORKDIR /SwinIR

RUN git clone https://github.com/JingyunLiang/SwinIR.git .

RUN mkdir -p data/raw_data temp data/upscaled_data
COPY scr/main_test_swinir.py .
COPY scr/video_conv.py utils

ENTRYPOINT ["python", "main_test_swinir.py", "--task", "real_sr" "--scale", "8", "--large_model", "--model_path", "model_zoo/swinir/003_realSR_BSRGAN_DFOWMFC_s64w8_SwinIR-L_x4_GAN.pth"]