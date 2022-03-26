#Get tag from Github
docker run --rm alpine wget -qO- -t1 -T2 "https://api.github.com/repos/XX-net/XX-Net/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g' > GIT_VERSION
#Read tag from Dockerfile
grep ENV\ _XXNET Dockerfile | awk -F "=" '{print $2}' > Docker_Version
#replace process
#$content1=`cat Docker_Version`; $content2=`cat GIT_Version`; sed "s/${content1}/${content2}/ Dockerfile"
