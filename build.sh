set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=simoncheung
# image name
IMAGE=xxnet
docker build -t $USERNAME/$IMAGE:latest .