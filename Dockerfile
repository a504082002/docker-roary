FROM a504082002/ncbi-blast:latest

MAINTAINER a504082002 <a504082002@gmail.com>

RUN apt-get update -qq && \
	apt-get install -yq --no-install-recommends \
						roary \
                        python3 \
                        python3-pip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install celery
ADD requirements.txt /app/requirements.txt
ADD ./app/ /app/
WORKDIR /app/
RUN pip3 install -r requirements.txt

RUN mkdir /input && mkdir /output
ENTRYPOINT celery worker --app=app.celeryapp.app -l info
