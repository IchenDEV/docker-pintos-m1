FROM ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241
ENV HOME /root
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections &&\
     apt-get clean &&\
     apt-get update && \
		apt-get install -y sudo && \
		sudo apt-get install -y --no-install-recommends apt-utils && \
		apt-get install -y \
			wget \
			tar \
			make \
			patch \
			vim \
			git \
			gdb \
			qemu qemu-system-i386\
            --fix-missing build-essential xorg-dev bison libgtk2.0-dev \
            python3-pip \
			psmisc \
			clang\
			locales locales-all

# Install gdbgui https://gdbgui.com/
RUN pip3 install --upgrade gdbgui

WORKDIR ${HOME}
RUN wget https://downloads.sourceforge.net/project/bochs/bochs/2.6.7/bochs-2.6.7.tar.gz && tar -zxvf bochs-2.6.7.tar.gz
WORKDIR ${HOME}/bochs-2.6.7
RUN ./configure --with-nogui --enable-gdb-stub && make && make install


RUN git clone https://github.com/Berkeley-CS162/group0.git $HOME/code/group &&\
    git clone https://github.com/Berkeley-CS162/student0.git $HOME/code/student

ENV PATH $HOME/code/group/pintos/src/utils:$PATH
ENV GDBMACROS $HOME/code/group/pintos/src/misc/gdb-macros
WORKDIR $HOME/code

CMD ["sleep", "infinity"]
