FROM ubuntu:latest
COPY . /app
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y python3 wget python3-distutils && mkdir /setup
WORKDIR /setup
RUN wget https://files.pythonhosted.org/packages/cf/44/cc9590db23758ee7906d40cacff06c02a21c2a6166602e095a56cbf2f6f6/tornado-6.1.tar.gz 
RUN ls -al 
RUN tar xvzf tornado-6.1.tar.gz
RUN ls -al 
RUN python3 ./tornado-6.1/setup.py build 
RUN python3 ./tornado-6.1/setup.py install
ENTRYPOINT ["python3", "/app/tornado.py"]