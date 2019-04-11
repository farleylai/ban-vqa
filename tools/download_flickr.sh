## This code is modified from Hengyuan Hu's repository.
## https://github.com/hengyuan-hu/bottom-up-attention-vqa

## Script for downloading data

# Download Flickr30k images and captions data
# https://drive.google.com/file/d/0B_PL6p-5reUAZEM4MmRQQ2VVSlk/view?usp=sharing
mkdir -p data/flickr30k

wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=0B_PL6p-5reUAZEM4MmRQQ2VVSlk' -O tmp.html
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(cat tmp.html | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=0B_PL6p-5reUAZEM4MmRQQ2VVSlk" -O data/flickr30k/flickr30k_images.tar.gz
rm -rf /tmp/cookies.txt tmp.html

tar xvf data/flickr30k/flickr30k_images.tar.gz -C data/flickr30k
rm data/flickr30k/flickr30k_images.tar.gz


# Flickr30k Image Features
# Image feature Generated using https://github.com/peteanderson80/bottom-up-attention.git
wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://drive.google.com/uc?export=download&id=11OD_qq7ITBarJwWZfi0bWIRw3HPEaHwE' -O tmp.html
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=$(cat tmp.html | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11OD_qq7ITBarJwWZfi0bWIRw3HPEaHwE" -O data/flickr30k/flickr30k_features.zip
rm -rf /tmp/cookies.txt tmp.html

unzip data/flickr30k/flickr30k_features.zip -d data/flickr30k
rm data/flickr30k/flickr30k_features.zip

# Download Flickr30k Entities data mannually into data/flickr30k
# http://web.engr.illinois.edu/~bplumme2/Flickr30kEntities/
# Unpack Flickr30kEntities.tar.gz
# tar xvf data/flickr30k/Flickr30kEntities.tar.gz -C data/flickr30k
# rm data/flickr30k/Flickr30kEntities.tar.gz
wget -O data/flickr30k/annotations.zip https://github.com/BryanPlummer/flickr30k_entities/blob/master/annotations.zip?raw=true
unzip data/flickr30k/annotations.zip -d data/flickr30k/Flickr30kEntities
rm data/flickr30k/annotations.zip

# GloVe Vectors
wget -P data http://nlp.stanford.edu/data/glove.6B.zip
unzip data/glove.6B.zip -d data/glove
rm data/glove.6B.zip