
#!/bin/bash
set -e  # Exit on error
echo "Setting up the ML Logging System..."

# Install Conda if not installed
if ! command -v conda &> /dev/null
then
    echo "Conda not found. Installing Miniconda..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
    rm miniconda.sh
    export PATH="$HOME/miniconda/bin:$PATH"
    echo "Conda installed successfully."
fi

# Create and activate environment
conda env create -f environment.yml
conda activate ml-logging-system

# Install pre-commit hooks
pre-commit install -c pre-commit-config.yaml
echo "Environment setup complete."
