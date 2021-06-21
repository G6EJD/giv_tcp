# set base image (host OS)
FROM python:3.9-slim-buster

# set the working directory in the container
WORKDIR /app

# copy the dependencies file to the working directory
COPY requirements.txt .


# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

ENV SERIAL_NUMBER="XXXXXXXX"
ENV INVERTOR_IP="192.168.1.1"
ENV PRINT_RAW="False"
ENV MQTT_ADDRESS=""
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""
ENV MQTT_TOPIC=""
ENV OUTPUT=""
ENV DEBUG="False"
ENV DEBUG_FILE_LOCATION=""

EXPOSE 6345

ENTRYPOINT ["sh", "/app/startup.sh"]
