#Get tag from Github
docker run --rm alpine wget -qO- -t1 -T2 "https://api.github.com/repos/XX-net/XX-Net/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g' > GIT_VERSION
#Read tag from Dockerfile
grep ENV\ _XXNET ../Dockerfile | awk -F "=" '{print $2}' > Docker_Version
#get value from existing Dockerfile
version1=`cat Docker_Version`
#get value from Github
version2=`cat GIT_Version`
#Replace process
sed -i "" "s/$version1/$version2/" ../Dockerfile
#Update lastest value to Dockerfile
grep ENV\ _XXNET ../Dockerfile | awk -F "=" '{print $2}' > ../VERSION