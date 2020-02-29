#!/bin/bash
# This is the container entry-point
echo
echo ----------------------------
echo CONTAINER RUN SCRIPT STARTED
echo ----------------------------
echo
cd /application
python train.py --gpu_list=0 --input_size=512 --batch_size_per_gpu=8 --checkpoint_path=./resnet_v1_50/ --training_data_path=ICDAR2015/train_data