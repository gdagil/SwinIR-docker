# SwinIR-docker 

Simple image to upscaling images and videos in .mp4 format by [SwinIR](https://github.com/JingyunLiang/SwinIR) model

## Fast way to use it with default settings
Place the files to be processed in `data/raw_data` directory and run the script with the following command lines

```bash
cd SwinIR-docker 
sudo docker-compose up
```
| RAW                                       | UPSCALED                                                              |
| ----------------------------------------- | --------------------------------------------------------------------- |
| ![android_raw](data\raw_data\android.jpg) | ![android_up](data\upscaled_data\swinir_real_sr_x4_large\android.png) |
## Usung the image
So, if you want only build the image and run it with SwinIR settings you can need use environment variables
* TASK_NAME
* SCALE
* MODEL
* MODEL_PATH
* TR_PS - training_patch_size
* NOISE
* JPEG
* TILE
* TILE_OVERLAP

| ID | TASK_NAME      | MODEL       | SCALE | TR_PS | NOISE | JPEG | TILE | MODEL_PATH |
| -- | -------------- | ----------- | ----- | ----- | ----- | ---- | ---- | ---------- |
| 1  | real_sr        | large_model | 4     |       |       |      |      | model_zoo/swinir/003_realSR_BSRGAN_DFOWMFC_s64w8_SwinIR-L_x4_GAN.pth
| 2  |                |             | 4     |       |       |      | 400  | model_zoo/swinir/003_realSR_BSRGAN_DFO_s64w8_SwinIR-M_x4_GAN.pth
| 3  | classical_sr   |             | 2     | 48    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s48w8_SwinIR-M_x2.pth
| 4  |                |             | 3     | 48    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s48w8_SwinIR-M_x3.pth
| 5  |                |             | 4     | 48    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s48w8_SwinIR-M_x4.pth
| 6  |                |             | 8     | 48    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s48w8_SwinIR-M_x8.pth
| 7  |                |             | 2     | 64    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s64w8_SwinIR-M_x2.pth
| 8  |                |             | 3     | 64    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s64w8_SwinIR-M_x3.pth
| 9  |                |             | 4     | 64    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s64w8_SwinIR-M_x4.pth
| 10 |                |             | 8     | 64    |       |      |      | model_zoo/swinir/001_classicalSR_DIV2K_s64w8_SwinIR-M_x8.pth
| 11 | lightweight_sr |             | 2     | 48    |       |      |      | model_zoo/swinir/002_lightweightSR_DIV2K_s64w8_SwinIR-S_x2.pth
| 12 |                |             | 3     | 48    |       |      |      | model_zoo/swinir/002_lightweightSR_DIV2K_s64w8_SwinIR-S_x3.pth
| 13 |                |             | 4     | 48    |       |      |      | model_zoo/swinir/002_lightweightSR_DIV2K_s64w8_SwinIR-S_x4.pth
| 14 | gray_dn        |             |       |       | 15    |      |      | model_zoo/swinir/004_grayDN_DFWB_s128w8_SwinIR-M_noise15.pth
| 15 |                |             |       |       | 25    |      |      | model_zoo/swinir/004_grayDN_DFWB_s128w8_SwinIR-M_noise25.pth
| 16 |                |             |       |       | 50    |      |      | model_zoo/swinir/004_grayDN_DFWB_s128w8_SwinIR-M_noise50.pth
| 17 | color_dn       |             |       |       | 15    |      |      | model_zoo/swinir/005_colorDN_DFWB_s128w8_SwinIR-M_noise15.pth
| 18 |                |             |       |       | 25    |      |      | model_zoo/swinir/005_colorDN_DFWB_s128w8_SwinIR-M_noise25.pth
| 19 |                |             |       |       | 50    |      |      | model_zoo/swinir/005_colorDN_DFWB_s128w8_SwinIR-M_noise50.pth
| 20 | jpeg_car       |             |       |       |       | 10   |      | model_zoo/swinir/006_CAR_DFWB_s126w7_SwinIR-M_jpeg10.pth
| 21 |                |             |       |       |       | 20   |      | model_zoo/swinir/006_CAR_DFWB_s126w7_SwinIR-M_jpeg20.pth
| 22 |                |             |       |       |       | 30   |      | model_zoo/swinir/006_CAR_DFWB_s126w7_SwinIR-M_jpeg30.pth
| 23 |                |             |       |       |       | 40   |      | model_zoo/swinir/006_CAR_DFWB_s126w7_SwinIR-M_jpeg40.pth

### For eample settings №1:
```bash
docker build .
docker run --rm \
  -e TASK_NAME=real_sr \
  -e SCALE=4 -e MODEL=large_model \
  -e MODEL_PATH=model_zoo/swinir/003_realSR_BSRGAN_DFOWMFC_s64w8_SwinIR-L_x4_GAN.pth \
  swinir_upscaling
```




## Citation
    @article{liang2021swinir,
      title={SwinIR: Image Restoration Using Swin Transformer},
      author={Liang, Jingyun and Cao, Jiezhang and Sun, Guolei and Zhang, Kai and Van Gool, Luc and Timofte, Radu},
      journal={arXiv preprint arXiv:2108.10257},
      year={2021}
    }
