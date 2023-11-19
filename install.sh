#!/usr/bin/env bash
# command to install this enviroment: source init.sh

# install miniconda3 if not installed yet.
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#bash Miniconda3-latest-Linux-x86_64.sh
#source ~/.bashrc


# The following 4 lines are only for slurm machines. uncomment if needed.  
# export TORCH_CUDA_ARCH_LIST="6.1;6.2;7.0;7.5;8.0"   # a100: 8.0; v100: 7.0; 2080ti: 7.5; titan xp: 6.1
# module purge
# module load cuda/11.3.1
# module load gcc/7.5.0

# download openpoints
git config --global --unset core.sshCommand
git clone https://github.com/guochengqian/openpoints.git openpoints

# please always double check installation for pytorch and torch-scatter from the official documentation
pip3 install pytorch torchvision cuda-python
pip3 install torch-scatter -f https://data.pyg.org/whl/torch-1.10.1+cu113.html

pip3 install -r requirements.txt

# install cpp extensions, the pointnet++ library
cd openpoints/cpp/pointnet2_batch
python3 setup.py install
cd ..


