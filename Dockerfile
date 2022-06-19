FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt update
RUN apt-get install git ffmpeg libsm6 libxext6 wget  -y

RUN pip install --upgrade pip
RUN pip install torch numpy opencv-python tqdm timm requests argparse

WORKDIR /SwinIR

RUN git clone https://github.com/JingyunLiang/SwinIR.git .

RUN chmod +x download-weights.sh
RUN ./download-weights.sh

RUN mkdir -p data/raw_data temp data/upscaled_data

COPY scr/main_test_swinir.py .
COPY scr/video_conv.py utils

# CMD echo python3 -W ignore ./main_test_swinir.py \
# "\n" --task ${TASK_NAME} \
# "\n" --scale ${SCALE} \
# "\n" if ["$TR_PS" == ""]; then "--training_patch_size $TR_PS"; else "";\
# "\n" --${MODEL} --model_path ${MODEL_PATH}

ENTRYPOINT python3 -W ignore ./main_test_swinir.py \
--task ${TASK_NAME} \
--scale ${SCALE} \
--training_patch_size ${TR_PS} \
--noise ${NOISE} \
--jpeg ${JPEG} \
${MODEL} \
--model_path ${MODEL_PATH} \
--tile ${TILE} \
--tile_overlap ${TILE_OVERLAP}