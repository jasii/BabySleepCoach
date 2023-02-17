# Base image
FROM node:16-bullseye-slim

# Install Python 3
RUN apt-get update && apt-get install -y python3-pip

# Set working directory
WORKDIR /app

# Copy package.json and yarn.lock to container
COPY ./webapp/package.json ./webapp/yarn.lock /app/webapp/

# Install Node.js dependencies
RUN cd /app/webapp && yarn install

# Install Python dependencies
COPY requirements.txt /app
RUN pip3 install -r /app/requirements.txt

# Copy source code
COPY . /app

# Set environment variables
ENV SLEEP_DATA_PATH=/path/to/sleep/data
ENV DEBUG=False
ENV OWL=False
ENV VIDEO_PATH=/path/to/video
ENV HATCH_IP=192.168.HATCH.IP

# Start web app
CMD cd webapp; yarn install; yarn start;