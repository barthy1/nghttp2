FROM ubuntu:14.04
RUN apt-get update; apt-get install -y iputils-ping wget xz-utils gcc make g++ make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev libjemalloc-dev cython python3-dev python-setuptools 

COPY ./ /root/
WORKDIR /root/

RUN autoreconf -i ; automake ; autoconf ; ./configure; make; make install; \
	cp /root/lib/./.libs/libnghttp2.* /usr/lib/; \
	rm -rf /root/*

COPY start.sh /usr/sbin/start.sh
RUN  chmod +x /usr/sbin/start.sh
