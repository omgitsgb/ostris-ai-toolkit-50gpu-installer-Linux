#!/bin/bash
# ============================
# AI-Toolkit Installer (Linux, Fully Local)
# ============================

set -e  # Exit immediately if any command fails

# ============================
# Variables
# ============================
PYTHON_VERSION="3.12.8"
PYTHON_INSTALL_DIR="$HOME/python3128"
AI_TOOLKIT_DIR="$HOME/ai-toolkit"

# ============================
# Download and build Python 3.12.8 locally
# ============================
if [ ! -x "$PYTHON_INSTALL_DIR/bin/python3.12" ]; then
    echo "Downloading and building Python $PYTHON_VERSION..."
    cd /tmp
    wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
    tar xvf Python-$PYTHON_VERSION.tgz
    cd Python-$PYTHON_VERSION
    ./configure --enable-optimizations --prefix="$PYTHON_INSTALL_DIR"
    make -j$(nproc)
    make install
else
    echo "Python $PYTHON_VERSION already built locally at $PYTHON_INSTALL_DIR"
fi

# Make sure this Python is used
export PATH="$PYTHON_INSTALL_DIR/bin:$PATH"
echo "Using Python: $(which python3.12)"
python3.12 --version

# ============================
# Clone repo and enter folder
# ============================
if [ ! -d "$AI_TOOLKIT_DIR" ]; then
    echo "Cloning repository..."
    git clone https://github.com/ostris/ai-toolkit.git "$AI_TOOLKIT_DIR"
else
    echo "Repository already exists at $AI_TOOLKIT_DIR"
fi
cd "$AI_TOOLKIT_DIR"

# ============================
# Delete existing requirements.txt if it exists
# ============================
rm -f requirements.txt

# ============================
# Create requirements.txt
# ============================
cat > requirements.txt <<EOF
torchao==0.10.0
safetensors==0.5.3
git+https://github.com/jaretburkett/easy_dwpose.git
transformers==4.57.3
lycoris-lora==1.8.3
flatten_json==0.1.14
pyyaml==6.0.2
oyaml==1.0
tensorboard==2.19.0
kornia==0.8.1
invisible-watermark==0.2.0
einops==0.8.1
accelerate==1.12.0
toml==0.10.2
albumentations==1.4.15
albucore==0.0.16
pydantic==2.11.5
omegaconf==2.3.0
k-diffusion==0.1.1.post1
open_clip_torch==2.32.0
timm==1.0.15
diffusers
prodigyopt==1.1.2
controlnet_aux==0.0.10
python-dotenv==1.1.0
bitsandbytes==0.46.0
hf_transfer==0.1.9
lpips==0.1.4
pytorch_fid==0.3.0
optimum-quanto==0.2.4
sentencepiece==0.2.0
huggingface_hub
peft==0.18.0
gradio==5.33.1
python-slugify==8.0.4
opencv-python==4.11.0.86
pytorch-wavelets==1.3.0
matplotlib==3.10.1
triton
EOF

# ============================
# Create Python virtual environment using 3.12.8
# ============================
$PYTHON_INSTALL_DIR/bin/python3.12 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip, setuptools, wheel
pip install --upgrade pip setuptools wheel

# ============================
# Install Python dependencies
# ============================
# Torch with CUDA 12.8
pip install --no-cache-dir torch==2.7.1+cu128 torchvision==0.22.1+cu128 torchaudio==2.7.1+cu128 --index-url https://download.pytorch.org/whl/cu128

# Install rest of requirements
pip install -r requirements.txt

# Upgrade diffusers from GitHub
pip install --upgrade git+https://github.com/huggingface/diffusers.git

# ============================
# Install Node/npm locally inside venv using nvm
# ============================
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash

# Load nvm in current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js version 20 locally
nvm install 20
nvm use 20

# ============================
# Create UI launch script
# ============================
cat > start_training.sh <<EOL
#!/bin/bash
# Activate Python venv
source venv/bin/activate

# Load nvm and Node
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
nvm use 20

# Go into UI folder and start UI
cd ui
npm run build_and_start
EOL

chmod +x start_training.sh

# ============================
# Create datasets folder
# ============================
mkdir -p datasets

# ============================
# Final message
# ============================
echo
echo "Thank you for using my installer! Everything is now local (Python 3.12.8 + Node/npm)."
echo "To start the UI, run:"
echo "./start_training.sh"
echo
