README.md
# AI-Toolkit Installer (Linux, Fully Local)

This repository contains a **fully local Linux installer** for setting up a complete AI toolkit, including Python dependencies, Node.js, and a web-based UI.

## Features

- Sets up a Python virtual environment and installs all required dependencies
- Installs PyTorch with CUDA support
- Installs additional Python libraries listed in `requirements.txt`
- Installs Node.js 20 locally using `nvm`
- Creates a convenient launch script `start_training.sh` to start the UI
- Prepares a `datasets` folder for your data

## Requirements

- Linux system
- Python 3.10+
- Git
- Internet connection for downloading dependencies

## Installation

1. Download or clone this repository.
2. Make the installer script executable:

```bash
chmod +x linux_setup_ai_toolkit.sh

Run the installer:

./linux_setup_ai_toolkit.sh

When finished, launch the UI with:

./start_training.sh
Notes

All installations are local to your home directory (venv for Python, nvm for Node.js)

The script ensures CUDA-enabled PyTorch is installed for GPU acceleration

UI is located in the ui folder

License

Include your license here (e.g., MIT License)


---

### Next Steps

1. Save this as `README.md` in your `/home/gb/Downloads/` folder.  
2. Then stage and commit it:

```bash
git add README.md
git commit -m "Add README for AI-Toolkit Installer"
git push




