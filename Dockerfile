FROM python:3.7.5-slim
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev && \
    apt-get install -y build-essential cmake && \
    apt-get install -y libopenblas-dev liblapack-dev && \
    apt-get install -y libx11-dev libgtk-3-dev
    
#Copy source    destinatiion
COPY ./requirements.txt /requirements.txt

WORKDIR /

RUN pip3 install -r requirements.txt

COPY . /   

EXPOSE 7000 

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]



# Docker Images Create :: sudo docker build -t flaskdemo:latest .

# Docker Run CMD   :: sudo docker run --name flask_container -p 8000:6001 --rm flaskdemo:latest

# Remove the Docker images ::  sudo docker rmi flask_clc2

