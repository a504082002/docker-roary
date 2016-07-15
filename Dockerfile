FROM a504082002/ncbi-blast:latest

MAINTAINER a504082002 <a504082002@gmail.com>

RUN apt-get update -qq && \
	apt-get install -yq --no-install-recommends \
						roary && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["bash"]
