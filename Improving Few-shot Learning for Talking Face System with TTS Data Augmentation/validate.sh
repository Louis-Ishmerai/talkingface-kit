python val_pick_model.py --name demo \
                         --arch chinese_hubert_large \
                         --gpu 0 \
                         --num_workers 8 \
                         --val_batch_size 8 \
                         --loss_type SoftDTW \
                         --gamma 0.001 \
                         --val_blendshape_path ./data/wavs/org/val.pkl \
                         --root_dir ./data \
                         --feature_dir hubert_large \
                         --freq 50 \
                         --val_speaker test-a-korean-guy \
                         --feature_dim 128 \
                         --cov_dim 128 \
                         --input_dim 0 \
                         --seed 0 \
                         --feature_combine 

