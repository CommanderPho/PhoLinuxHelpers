
bash Mambaforge-$(uname)-$(uname -m).sh

eval "$(/home/halechr/mambaforge/bin/conda shell.bash hook)"

conda config --set auto_activate_base false