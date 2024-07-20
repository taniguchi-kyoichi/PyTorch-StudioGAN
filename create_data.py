import numpy as np

# .npzファイルを読み込む
data = np.load('checkpoints/feats/HAM10000_256_wo_resize_train_friendly_InceptionV3_tf_feats.npz')

# 含まれている配列のキーを表示
print(data.keys())

# 各配列の内容を確認
for key in data.keys():
    print(f"{key}: {data[key].shape}")
