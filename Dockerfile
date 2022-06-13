FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt update
RUN apt-get install git ffmpeg libsm6 libxext6 wget  -y

RUN pip install --upgrade pip
RUN pip install torch numpy opencv-python tqdm timm requests argparse
RUN pip install jupyter -U && pip install jupyterlab

WORKDIR /SwinIR

RUN git clone https://github.com/JingyunLiang/SwinIR.git .
COPY scr/main_test_swinir.py .
COPY scr/video_conv.py utils

RUN mkdir -p data/raw_data data/processed_data data/upscaled_data

ENTRYPOINT ["python3", "main_test_swinir.py", "--task", "real_sr" "--scale 4", "--large_model", "--model_path", "model_zoo/swinir/003_realSR_BSRGAN_DFOWMFC_s64w8_SwinIR-L_x4_GAN.pth", "--folder_lq", "data/raw_data"]