set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=simoncheung
# image name
IMAGE=xxnet
# ensure we're up to date
git pull
grep ENV\ _XXNET Dockerfile | awk -F "=" '{print $2}' > Docker_Version
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
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version