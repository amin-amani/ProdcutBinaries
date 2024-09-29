#!/bin/bash

# Configuration
REPO_URL="https://github.com/amin-amani/ProdcutBinaries.git"
LOCAL_DIR="/home/jetson/ProdcutBinaries"  # Replace with the path where you want to clone the repo
BINARY_NAME="/home/jetson/trtx/models/yolov5det"        # Replace with the binary name you want to run
DEPLOY_DIR="/home/jetson/trtx/models"
# Clone or update the repository
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Cloning repository..."
    yes | git clone "$REPO_URL" "$LOCAL_DIR"
else
    echo "Updating repository..."
    cd "$LOCAL_DIR" || exit
    yes | git pull origin main
fi

# Check if the binary exists
BINARY_PATH="$/$BINARY_NAME"
if [ ! -f "${BINARY_NAME}" ]; then
    echo "Error: Binary '$BINARY_NAME' not found in the repository!"
    mkdir -p ${DEPLOY_DIR}
   
fi
#mkdir -p ${DEPLOY_DIR} 
#cp 
# Make the binary executable
#chmod +x "$BINARY_NAME"
tar -xvf ${LOCAL_DIR}/inspection/bin.tar.xz -C ${DEPLOY_DIR}
cp -r ${DEPLOY_DIR}/bin/* ${DEPLOY_DIR}
rm -r ${DEPLOY_DIR}/bin
chmod +x "$BINARY_NAME"

# Run the binary
echo "Running the binary..."
"$BINARY_NAME"



