docker run --privileged -d -p 5000:5000 --name atdsys centos7_develop:latest /sbin/init
nsenter -t $(docker inspect --format '{{.State.Pid}}' atdsys) -m -u -i -n -p /bin/sh
