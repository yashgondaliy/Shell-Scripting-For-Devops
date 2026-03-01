#!/bin/bash

<<info 
deploy django app and handle the code error
info

<<testcode

clone_code(){
	echo "cloning the Django app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirement(){
	echo "instaling dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restart(){
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

deploy(){
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}

echo "*************** DEPLOYMENT STARTED ****************"

if ! clone_code; then
	echo "folder is already installed"
	cd django-notes-app
fi

if ! install_requirement; then
	echo "Installation failed"
	exit 1
fi

if ! required_restart; then
	echo "system fault identified"
	exit 1
fi
deploy

echo "************** DEPLOYMENT DONE *******************"

testcode


<<info
Deploy Django App using Docker
info

set -e   # Stop script if any command fails

REPO_URL="https://github.com/LondheShubham153/django-notes-app.git"
APP_DIR="django-notes-app"
IMAGE_NAME="notes-app"
CONTAINER_NAME="notes-container"

clone_code() {
    echo "📥 Cloning the Django app..."

    if [ -d "$APP_DIR" ]; then
        echo "Repository already exists. Moving inside..."
    else
        git clone $REPO_URL
    fi

    cd $APP_DIR
}

install_requirement() {
    echo "📦 Installing Docker & Nginx..."
    sudo apt-get update -y
    sudo apt-get install docker.io nginx -y
}

required_restart() {
    echo "🔄 Enabling services..."

    sudo systemctl enable docker
    sudo systemctl enable nginx
    sudo systemctl start docker
    sudo systemctl start nginx

    sudo usermod -aG docker $USER
}

deploy() {
    echo "🐳 Building Docker image..."
    docker build -t $IMAGE_NAME .

    echo "🧹 Removing old container (if exists)..."
    docker rm -f $CONTAINER_NAME 2>/dev/null || true

    echo "🚀 Running container..."
    docker run -d -p 8000:8000 --name $CONTAINER_NAME $IMAGE_NAME
}

echo "*************** DEPLOYMENT STARTED ****************"

clone_code
install_requirement
required_restart
deploy

echo "************** DEPLOYMENT DONE *******************"

echo "📌 Check running container:"
docker ps
