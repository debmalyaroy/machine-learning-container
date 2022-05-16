# List all docker images
docker image ls

# List all docker containers including the stopped ones
docker container ls -a 

# Build an image with name "machine-learning" from Dockerfile in this directory
docker image build -t machine-learning .

# Delete image with name "machine-learning"
docker image rm machine-learning

# Run the container from previously built "machine-learning" image
# It will take you to a bash shell inside the docker container 
# where you can run commands and scripts
docker container run -it -v $PWD:/app machine-learning bash

## Update .env file with the path where your development environment located and then run below commands

# Build the docker service "machine-learning"
docker-compose build machine-learning

# Create a Docker container from image "machine-learning" 
# It will use ENTRYPOINT in Dockerfile to start Jupyter notebook
docker-compose up machine-learning
