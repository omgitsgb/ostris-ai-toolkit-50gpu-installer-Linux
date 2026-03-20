# AI-Toolkit Installer (Linux, Fully Local)

## 🧠 What This Script Does (READ THIS FIRST)

This script builds a **fully isolated, GPU-accelerated AI environment from scratch** on Linux specifically for the **Ostris AI Toolkit**.

It does **everything automatically**, including:

- Compiles and installs **Python 3.12.8 from source** (no system Python conflicts)
- Creates a **clean virtual environment**
- Installs **CUDA-enabled PyTorch (12.8)** for GPU acceleration
- Installs all dependencies required for the **Ostris AI Toolkit**
- Fixes common breakages (**pkg_resources, Diffusers, LTX2, PyAV**)
- Installs **FFmpeg + PyAV** for video/export support
- Installs **Node.js 20 locally** (via nvm) for the UI
- Sets up a **web-based interface** ready to run

👉 End result:  
You get a **fully local AI lab environment** for the **Ostris AI Toolkit**, ready for training and managing models — all on your own GPU, no cloud required.

---

## 🔥 Features

- ✅ Builds **Python 3.12.8 from source** (no system conflicts)  
- ✅ Creates isolated **virtual environment**  
- ✅ Fixes `pkg_resources` compatibility (pins `setuptools<82`)  
- ✅ Installs **CUDA 12.8 PyTorch**  
- ✅ Installs all required **Ostris AI Toolkit dependencies**  
- ✅ Fixes **Diffusers + LTX2 issues**  
- ✅ Installs **FFmpeg + PyAV**  
- ✅ Installs **Node.js 20 locally** using `nvm`  
- ✅ Generates `start_training.sh` launcher  
- ✅ Creates `datasets/` folder  

---

## ⚙️ Requirements

- Linux (Ubuntu recommended)  
- NVIDIA 50 Series GPU  
- Internet connection  
- sudo privileges  

---

## 🚀 Installation

### 1. Make script executable
```bash
chmod +x linux_setup_ai_toolkit.sh
```

### 2. Run installer
```bash
./linux_setup_ai_toolkit.sh
```

---

## ▶️ Running the UI

After installation:
```bash
./start_training.sh
```

---

## 🧠 What This Script Does (Detailed)

### Python (Fully Controlled)
- Downloads and builds **Python 3.12.8**  
- Installs to:
```bash
$HOME/python3128
```
- Creates venv using:
```bash
$HOME/python3128/bin/python3.12
```

---

### Fixes `pkg_resources` (CRITICAL)

```bash
setuptools < 82
```

Verify:
```bash
python -c "import pkg_resources"
```

---

### GPU Setup

```bash
torch==2.7.1+cu128
```

---

### Fixes Diffusers / LTX2 Errors

Prevents:
```
Diffusers is out of date
```

---

### Fixes PyAV (VIDEO / EXPORT ERRORS)

```bash
sudo apt install ffmpeg libavcodec-dev libavformat-dev libavdevice-dev libavutil-dev
pip install av
```

---

### Node.js (Local Only)

- Installed via `nvm`  
- Uses Node 20  

---

## 📁 Project Structure

```
ai-toolkit/
├── venv/
├── ui/
├── datasets/
├── start_training.sh
```

---

## ⚠️ Notes

- Fully local install (no system pollution)  
- Isolated Python environment  
- Explicit paths (no PATH issues)  
- For **Ostris AI Toolkit**  on Linux

---

## 🛠 Troubleshooting

### Check Python
```bash
~/python3128/bin/python3.12 --version
```

### Activate venv
```bash
source ~/ai-toolkit/venv/bin/activate
```

### Verify pkg_resources
```bash
python -c "import pkg_resources"
```

### Verify PyAV
```bash
python -c "import av"
```

---

## 🧪 Clean Reinstall

```bash
rm -rf ~/ai-toolkit
rm -rf ~/python3128
```

Then rerun the installer.
