# Improving Few-shot Learning for Talking Face System with TTS Data Augmentation
**The codes are based on python3.8+, CUDA version 11.0+.**

###### 1.The data profile is too big to upload, you need to get it from:

```
https://github.com/Moon0316/T2A/tree/main/data
```

###### 2.Environment configuration

(1).Create conda environment

```shell
conda create -n fadm python=3.8
conda activate fadm
```

(2).Install pytorch

```shell
conda install pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=11.1 -c pytorch -c conda-forge
```

(3).Installation profile

```shell
pip install -r requirements.txt
```

###### 3.Download pre-trained HuBERT model

Please download Chinese HuBERT model and put it on directory ./data/pretrained_models/ by executing the following command:

```
wget -P ./data/pretrained_models/ https://huggingface.co/TencentGameMate/chinese-hubert-large/resolve/main/chinese-hubert-large-fairseq-ckpt.pt
```

###### 4.Download fairseq tool

```
git clone git@github.com:facebookresearch/fairseq.git
cd fairseq
git checkout acd9a53
pip install --editable ./
cd ..
cp hubert.py ./fairseq/fairseq/models/hubert/
```

###### 5.Feature extraction

You need to create a custom folder (e.g., 01) inside the `\data\wavs` directory, and then create a `train` folder inside the 01 folder. You can place the `.wav` audio files you need to process in this `train` folder. At the same time, you need to create a folder (e.g., 02) inside the `\data\wav_features` directory.

Extract HuBERT feature(Assume that you use 01 and 02 ),just do:

```
python utils/generate_hubert.py --input_dir ./data/wavs/01 --output_dir ./data/wav_features/02
```

Extract MFCC feature

```
python utils/generate_mfcc.py --input_dir ./data/wavs/01 --output_dir ./data/wav_features/02
```

###### 6.Train
Modify the content of the `train.sh` script by changing `--train_speaker_list`'s ` zh-CN-XiaochenNeural` to the name of the feature folder you defined, such as 02.

Then run ```bash train.sh``` to train

###### 7.Test
run ```bash test.sh``` to test

###### 8.docker
我们将项目封装成Docker镜像，镜像源地址 https://hub.docker.com/repository/docker/louisishmerai/model
如果您已经下载了Docker，可直接拉取使用
```
docker pull louisishmerai/model:20250111
```
