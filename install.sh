#!/bin/bash
sudo yum -y update
sudo yum install java
wget server.jar ${var.server_link}
java -Xmx1024M -Xms1024M -jar server.jar nogui
sed -i 's/eula=false/eula=true/' eula.txt
java -Xmx1024M -Xms1024M -jar server.jar nogui
