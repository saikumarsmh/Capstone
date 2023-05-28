#!/bin/sh
sudo docker save -o /home/ubuntu/deployimage.tar saidevops22/reactprod:$1
sudo chmod 755 /home/ubuntu/deployimage.tar
rsync -avz /home/ubuntu/deployimage.tar ubuntu@ip-172-31-89-240:/home/ubuntu/
ssh -o StrictHostKeyChecking=no ubuntu@ip-172-31-89-240 "docker images"
ssh -o StrictHostKeyChecking=no ubuntu@ip-172-31-89-240 "docker load -i /home/ubuntu/deployimage.tar"
ssh -o StrictHostKeyChecking=no ubuntu@ip-172-31-89-240 "docker run -d -it -p 81:80 saidevops22/reactprod:$1"
