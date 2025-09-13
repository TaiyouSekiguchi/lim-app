FROM node:22-slim

RUN apt-get update && apt-get install -y \
	build-essential \
	sudo \
	git \
	curl \
	wget \
	unzip \
	openssh-client \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json package-lock.json /app/

RUN chown -R node:node /app

USER node

COPY --chown=node:node . /app/

EXPOSE 3000
