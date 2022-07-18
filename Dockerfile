FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update && apt-get upgrade -y
RUN apt install wget -y

RUN apt install python3-pip -y
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

RUN ml install colorize -y
RUN apt-get install -y python3-numpy python3-pydot python3-matplotlib python3-opencv python3-graphviz python3-toolz
RUN wget https://github.com/bipinkrish/Colorize-Positive-Bot/releases/download/Model/colorization_release_v2.caffemodel -O model/colorization_release_v2.caffemodel

CMD ["python3","bot.py"]
