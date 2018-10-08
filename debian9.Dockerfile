FROM debian:stretch

RUN apt-get update &&\
	apt-get -y install \
		pkg-config \
		git \
		wget \
		autoconf \
		libtool \
		zlib1g-dev \
		gawk \
		g++ \
		curl \
		cmake \
		make \
		lsb-release \
		python-dev \
		gfortran && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir /tool && \
	cd /tool && \
	git clone --depth=1 https://github.com/google/or-tools && \
	cd /tool/or-tools  && \
	make third_party && \
	make cc fz && \
	mv /tool/or-tools/bin/fz /tool/or-tools/bin/fzn-or-tools

ENV PATH "$PATH:/tool/or-tools/bin"

# The mzn redefinitions are in /tool/or-tools/ortools/flatzinc/mznlib_sat
