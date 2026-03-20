# AI-Toolkit Installer (Linux, Fully Local)

This repository contains a **fully local Linux installer** that builds a complete AI toolkit from scratch, including:

- Python 3.12.8 (built from source)
- CUDA-enabled PyTorch
- AI-Toolkit + dependencies
- Node.js (via nvm)
- Web UI launcher
- FFmpeg + PyAV support (for video + diffusion features)

---

## 🔥 Features

- ✅ Builds **Python 3.12.8 from source** (no system conflicts)
- ✅ Creates isolated **virtual environment**
- ✅ Fixes `pkg_resources` compatibility (pins `setuptools<82`)
- ✅ Installs **CUDA 12.8 PyTorch**
- ✅ Installs all required AI dependencies
- ✅ Fixes **Diffusers + LTX2 issues**
- ✅ Installs **FFmpeg + PyAV** (required for video/export features)
- ✅ Installs **Node.js 20 locally** using `nvm`
- ✅ Generates `start_training.sh` launcher
- ✅ Creates `datasets/` folder

---

## ⚙️ Requirements

- Linux (Ubuntu/Debian recommended)
- NVIDIA GPU (for CUDA acceleration)
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

After installation completes:

```bash
./start_training.sh
```

---

## 🧠 What This Script Actually Does

### Python (Fully Controlled)
- Downloads and builds **Python 3.12.8**
- Installs it to:

```bash
$HOME/python3128
```

- Creates venv using:

```bash
$HOME/python3128/bin/python3.12
```

---

### Fixes `pkg_resources` (CRITICAL)

Python 3.12 + modern setuptools breaks older tooling.

This script **forces compatibility**:

```bash
setuptools < 82
```

Then verifies:

```bash
python -c "import pkg_resources"
```

---

### GPU Setup

Installs:

```bash
torch==2.7.1+cu128
```

With CUDA 12.8 support.

---

### Fixes Diffusers / LTX2 Errors

- Installs latest dev version of diffusers
- Prevents:

```
Diffusers is out of date
```

---

### Fixes PyAV (VIDEO / EXPORT ERRORS)

Installs system + Python dependencies:

```bash
sudo apt install ffmpeg libavcodec-dev libavformat-dev libavdevice-dev libavutil-dev
pip install av
```

Prevents errors like:

```
PyAV is required to use LTX 2.0 video export utilities
```

---

### Node.js (Local Only)

- Installed via `nvm`
- Uses Node 20
- No system-wide pollution

---

## 📁 Project Structure

```
ai-toolkit/
├── venv/                  # Python environment
├── ui/                    # Web UI
├── datasets/              # Your training data
├── start_training.sh      # Launcher
```

---

## ⚠️ Notes

- Everything installs **locally** (no system pollution)
- Python is **fully isolated**
- Uses **explicit paths** (no PATH issues)
- Safe to re-run (idempotent-ish, but clean installs recommended)

---

## 🛠 Troubleshooting

### Check Python version

```bash
~/python3128/bin/python3.12 --version
```

### Check venv Python

```bash
source ~/ai-toolkit/venv/bin/activate
python --version
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

## 🧪 If Something Breaks

Rebuild clean:

```bash
rm -rf ~/ai-toolkit
rm -rf ~/python3128
```

Then rerun installer.

