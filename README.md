## How to build docker-image and start the app

#### 1. Install docker
Follow the guide here https://docs.docker.com/engine/installation/

Or install docker from apt-get `$ sudo apt-get install docker.io`

#### 2. Install docker-compose
Follow this https://docs.docker.com/compose/install/

Or install it from pip `$ sudo pip install docker-compose`

#### 3. Clone this project
`$ git clone https://github.com/nikitasardov/comment-moderator-docker.git`

#### 4. Go into project folder (where docker-compose.yml) and run docker-compose
`$ docker-compose up -d`

* docker-compose.yml describes volume, where app data will be stored
* docker-compose will run instructions from Dockerfile. It will update apt-get, install nginx, python3, pip3, other dependencies.
* It will clone ui from here https://github.com/nikitasardov/comment-moderator-react-ui 
* Backend will be cloned from here https://github.com/nikitasardov/comment-moderator-py-backend
* Will install python requirements from pip3
* Copy nginx config to serve frontend from inside of container
* Finally it will start nginx and run python app

#### 5. Wait...
When image is built, container will be started.

* Check that it's running `$ docker ps`
* Check the app on http://localhost:8087
* API will be running at http://localhost:4567
