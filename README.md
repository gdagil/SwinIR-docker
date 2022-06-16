# SwinIR-docker 

Simple image to upscaling images and videos in .mp4 format by [SwinIR](https://github.com/JingyunLiang/SwinIR) model

## Fast way to use it
place the files to be processed in data/raw_data directory and run the script with the following command lines

```bash
cd SwinIR-docker 
sudo docker-compose up
```

## Citation
    @article{liang2021swinir,
      title={SwinIR: Image Restoration Using Swin Transformer},
      author={Liang, Jingyun and Cao, Jiezhang and Sun, Guolei and Zhang, Kai and Van Gool, Luc and Timofte, Radu},
      journal={arXiv preprint arXiv:2108.10257},
      year={2021}
    }
