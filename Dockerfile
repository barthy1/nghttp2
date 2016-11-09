FROM s390x/ubuntu:latest
RUN apt-get update --fix-missing; apt-get install --fix-missing -y iputils-ping wget xz-utils gcc make g++ make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev libjemalloc-dev python3-dev python-setuptools  python-pip; pip install cython

COPY ./ /root/
WORKDIR /root/

RUN autoreconf -i ; automake ; autoconf ; ./configure; make; make install; \
	cp /root/lib/./.libs/libnghttp2.* /usr/lib/; \
	rm -rf /root/*

COPY start.sh /usr/sbin/start.sh
RUN  chmod +x /usr/sbin/start.sh
