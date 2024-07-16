FROM node:10.24.1-alpine3.11

WORKDIR /simulator
RUN apk update && apk upgrade

RUN apk add --no-cache git
RUN git clone https://github.com/RabbitMQSimulator/RabbitMQSimulator.git && \
    cd RabbitMQSimulator && \
    npm install

COPY config.json RabbitMQSimulator/config.json

ENV SIM_ENABLE_EXPORT=true

CMD node RabbitMQSimulator/app.js

EXPOSE 3000/tcp
