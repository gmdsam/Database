
# coding: utf-8

# In[1]:


import numpy as np
import glob
import cv2
import tensorflow as tf
import random
np.random.seed(123)

from keras.models import Sequential, Model
from keras.layers import Dense, Dropout, Activation, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras.layers import Input, concatenate
from keras.utils import np_utils
from keras.layers.normalization import BatchNormalization
from keras.preprocessing.image import ImageDataGenerator
from keras.preprocessing import image
#from keras.backend.tensorflow_backend import set_session


# In[2]:


path = "D:\\Work\\Signature Verification\\data\\OfflineSignatures\\"
chinese_path = "Chinese\\TrainingSet\\"
dutch_path = "Dutch\\TrainingSet\\"
forged_path = "Offline Forgeries\\"
genuine_path = "Offline Genuine\\"
genuine_sig = {}
forged_sig = {}
batch_size = 32
'''config = tf.ConfigProto()
config.gpu_options.per_process_gpu_memory_fraction = 0.9
set_session(tf.Session(config=config))'''


# In[3]:


def load_data(path, X=[]):
    images = glob.glob(path+"*.png")
    sig_dict = {}
    for image in images:
        name = image.split("\\")[-1].split("_")[0]
        name = name[-3:]
        temp_image = cv2.imread(image)
        temp_image = cv2.resize(temp_image, (250, 100))
        if name not in sig_dict:
            sig_dict[name] = []
        sig_dict[name].append(temp_image)
    return sig_dict


# In[4]:


genuine_sig = load_data(path+chinese_path+genuine_path)


# In[5]:


forged_sig = load_data(path+chinese_path+forged_path)


# In[6]:


print(forged_sig["001"][1].shape)


# In[7]:


in_dims = (100, 250, 3)
out_dims = 128


# In[8]:


def triplet_loss(y_true, y_pred, alpha=0.3):
    anchor_en, positive_en, negative_en = y_pred[0], y_pred[1], y_pred[2]
    
    pos_dist = tf.reduce_sum(tf.square(tf.subtract(anchor_en, positive_en)), axis=-1)
    neg_dist = tf.reduce_sum(tf.square(tf.subtract(anchor_en, negative_en)), axis=-1)

    basic_loss = tf.add(tf.subtract(pos_dist, neg_dist), alpha)
    loss = tf.reduce_sum(tf.maximum(basic_loss, 0.0))

    return loss


# In[9]:


model = Sequential()
model.add(Conv2D(32, (5, 11), activation="relu", input_shape=in_dims))
#print(model.output_shape)
model.add(MaxPooling2D(pool_size=(2, 3)))
#print(model.output_shape)
model.add(Conv2D(64, (3, 5), activation="relu"))
#print(model.output_shape)
model.add(MaxPooling2D(pool_size=(2, 2)))
#print(model.output_shape)
model.add(Dropout(0.25))
model.add(Flatten())
#print(model.output_shape)
model.add(Dense(512, activation="relu"))
#print(model.output_shape)
model.add(Dropout(0.5))
model.add(Dense(out_dims))
model.count_params()


# In[10]:


anchor_ex = Input(shape=in_dims)
positive_ex = Input(shape=in_dims)
negative_ex = Input(shape=in_dims)

anchor_en = model(anchor_ex)
positive_en = model(positive_ex)
negative_en = model(negative_ex)
#merged = concatenate([anchor_en, positive_en, negative_en], axis=-1)


# In[11]:


model = Model(inputs=[anchor_ex, positive_ex, negative_ex], outputs=[anchor_en, positive_en, negative_en])
model.compile(loss=triplet_loss, optimizer='adam')


# In[1]:


'''sub_key_s = "0"
sub_key_d = "00"
X_batch = []
for i in range(1, len(genuine_sig.keys())+1):
    sub_key1 = str(i)
    if len(sub_key1) == 1:
        sub_key = sub_key_d+sub_key1
    else:
        sub_key = sub_key_s+sub_key1
    for j in range(len(genuine_sig[sub_key])):
        anchor_img = genuine_sig[sub_key][j]
        for k in range(len(genuine_sig[sub_key])):
            if k!=j:
                positive_img = genuine_sig[sub_key][k]
                for l in range(len(forged_sig[sub_key])):
                    negative_img = forged_sig[sub_key][l]
                    X_batch.append([anchor_img, positive_img, negative_img])
                    if len(X_batch)==batch_size:
                        X_batch = np.array(X_batch)
                        X_batch = X_batch.astype('float32')/255
                        Y_batch = [0]*batch_size
                        Y_batch = np.array(Y_batch)
                        model.fit([X_batch[:, 0], X_batch[:, 1], X_batch[:, 2]], [Y_batch, Y_batch, Y_batch], batch_size=batch_size, epochs=1)
                        X_batch = []'''


# In[18]:


X_test = load_data("D:\\Work\\Signature Verification\\")


# In[13]:


model.save_weights("D:\\Work\\Signature Verification\\model.h5")


# In[14]:


model.summary()

