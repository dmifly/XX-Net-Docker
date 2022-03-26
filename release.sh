set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME_dh=simoncheung
# docker hub username
USERNAME_gh=simoncheung
# image name
IMAGE=xxnet
# ensure we're up to date
git pull
#Check Update
./Backup/version.sh
version=`cat VERSION`
echo "version: $version"
# run build
./build.sh
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag $USERNAME_dh/$IMAGE:latest $USERNAME_dh/$IMAGE:$version
docker tag $USERNAME_dh/$IMAGE:latest ghcr.io/$USERNAME_gh/$IMAGE:$version
docker tag $USERNAME_dh/$IMAGE:latest ghcr.io/$USERNAME_gh/$IMAGE:latest
# push it
docker push $USERNAME_dh/$IMAGE:latest
docker push $USERNAME_dh/$IMAGE:$version
docker push ghcr.io/$USERNAME_gh/$IMAGE:latest
docker push ghcr.io/$USERNAME_gh/$IMAGE:$version