FROM multiarch/ubuntu-debootstrap:armhf-bionic
ENV LANG C.UTF-8
WORKDIR /home
RUN apt-get update
RUN apt-get install wget zip python3-pip libsm6 libxrender1 libxext-dev gcc -y
WORKDIR /usr/local/
RUN wget https://repo.ctbiyi.com:6443/repository/ai-ff/biyi_common/jdk-8u221-linux-arm64-vfp-hflt.tar.gz
RUN tar xzvf jdk-8u221-linux-arm64-vfp-hflt.tar.gz
ENV JAVA_HOME=/usr/local/jdk1.8.0_221
ENV PATH=${JAVA_HOME}/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
RUN rm jdk-8u221-linux-x64.tar.gz
WORKDIR /usr/local/lib/python3.6/dist-packages/pyhanlp/static/
RUN wget https://repo.ctbiyi.com:6443/repository/ai-ff/biyi_common/data-for-1.7.3.zip
RUN wget https://repo.ctbiyi.com:6443/repository/ai-ff/biyi_common/hanlp-1.7.3-release.zip
RUN unzip data-for-1.7.3.zip
RUN unzip hanlp-1.7.3-release.zip
RUN rm data-for-1.7.3.zip
RUN rm hanlp-1.7.3-release.zip
WORKDIR /home
RUN pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
EXPOSE 9000
