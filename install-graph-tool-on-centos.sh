# installation-instructions -->  https://git.skewed.de/count0/graph-tool/-/wikis/installation-instructions#gnulinux

yum install -y cairomm-devel python3-devel pycairo sparsehash-devel

################################ 
# install GCC version 7 or above
################################
GCC_VERSION=9.2.0
wget https://ftp.gnu.org/gnu/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz -O /tmp/gcc-$GCC_VERSION.tar.gz && \
        cd /tmp && \
        tar zxvf gcc-$GCC_VERSION.tar.gz && \
        cd gcc-$GCC_VERSION && \
        ./contrib/download_prerequisites && \
        ./configure prefix=/usr/local/gcc9 --disable-multilib && \
        make -j4 && make install && \
        cd ../ && rm -rf gcc-$GCC_VERSION* &&\
        rm -f /usr/bin/gcc && \
        rm -f /usr/bin/g++ && \
        unlink /usr/lib64/libstdc++.so.6 && \
        rm /usr/lib64/libstdc++.so.6* && \
        ln -s /usr/local/gcc9/bin/gcc /usr/bin/gcc && \
        ln -s /usr/local/gcc9/bin/g++ /usr/bin/g++ && \
        ln -s /usr/local/gcc9/lib64/libstdc++.so.6 /usr/lib64/libstdc++.so.6 

export PATH=/usr/local/gcc9/bin:$PATH
export CPLUS_INCLUDE_PATH=/usr/local/gcc9/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=/usr/local/gcc9/lib:$LD_LIBRARY_PATH

################################ 
# Install CMAKE
################################
CMAKE_HOME=/usr/local/cmake
wget https://github.com/Kitware/CMake/releases/download/v3.3.0/cmake-3.3.0.tar.gzz -O /tmp/cmake-3.3.0.tar.gz && \
        cd /tmp && \
        tar -zxvf cmake-3.3.0.tar.gz && cd cmake-3.3.0 && \
        ./bootstrap --prefix=$CMAKE_HOME && \
        make -j 8 && make install && \
        rm -rf /tmp/cmake*
export PATH=$PATH:$CMAKE_HOME/bin/

################################ 
# Install PYTHON3 
################################
PYTHON_VERSION=3.8.12
PYTHON_HOME=/usr/local/python3
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -O /tmp/Python-$PYTHON_VERSION.tgz && \
        cd /tmp && tar zxf Python-$PYTHON_VERSION.tgz &&\
        cd Python-$PYTHON_VERSION && \
        ./configure prefix=$PYTHON_HOME --enable-optimizations --enable-shared CFLAGS=-fPIC &&\
        make && make install && \
        rm -rf /tmp/Python* && \
        rm -rf /usr/bin/python3* && \
        ln -s /usr/local/python3/bin/python3 /usr/bin/python3

export PATH=$PATH:$PYTHON_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$PYTHON_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHON_HOME/lib


curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

pip3 install numpy scipy

################################ 
# Install expat
################################
EXPAT_HOME=/usr/local/expat-2.4.1
wget https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.gz -O /tmp/expat-2.4.1.tar.gz && \
        cd /tmp && \
        tar -zxvf expat-2.4.1.tar.gz && \
        cd expat-2.4.1 && \
        bash ./configure --prefix=$EXPAT_HOME && \
        rm -rf /tmp/expat-2.4.1*

export PATH=$PATH:$EXPAT_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$EXPAT_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$EXPAT_HOME/lib


################################ 
# Install expat
################################
CGAL_HOME=/usr/local/cgal-5.3
wget https://codeload.github.com/CGAL/cgal/tar.gz/refs/tags/v5.3 -O /tmp/cgal-5.3.tar.gz && \
        cd /tmp && \
        tar -zxvf cgal-5.3.tar.gz && \
        cd cgal-5.3 && \
        cmake -DCMAKE_INSTALL_PREFIX=$CGAL_HOME && \
        make install && \
        rm -rf /tmp/cgal-5.3*

export PATH=$PATH:$CGAL_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$CGAL_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CGAL_HOME/lib


################################ 
# Install boost
################################
ENV BOOST_HOME=/usr/local/boost_1_78_0
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz -O /tmp/boost_1_78_0.tar.gz && \
        cd /tmp && \
        tar -zxvf boost_1_78_0.tar.gz && \
        cd boost_1_78_0 && \
        ./bootstrap.sh --prefix=/usr/local/boost_1_78_0 --with-python=`which python3` && \
        ./b2 --with-python && \
        ./b2 --prefix=$BOOST_HOME install && \
        rm -rf /tmp/boost_1_78_0* 

export PATH=$PATH:$BOOST_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$BOOST_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BOOST_HOME/lib

################################ 
# Install pycairo
################################
RUN wget https://github.com/pygobject/pycairo/archive/refs/tags/v1.20.1.tar.gz -O /tmp/pycairo-v1.20.1.tar.gz && \
        cd /tmp && tar -zxvf pycairo-v1.20.1.tar.gz && \
        pip3 install ./pycairo-1.20.1 && \
        rm -rf /tmp/pycairo* 

################################ 
# Install sparsehash
################################
ENV SPARSEHASH_HOME=/usr/local/sparsehash
RUN wget https://github.com/sparsehash/sparsehash/archive/refs/tags/sparsehash-2.0.4.tar.gz -O /tmp/sparsehash-2.0.4.tar.gz && \
        cd /tmp && tar -zxvf sparsehash-2.0.4.tar.gz && cd sparsehash-sparsehash-2.0.4 && \
        ./configure --prefix=$SPARSEHASH_HOME && \
        make -j8 && make install && \
        rm -rf /tmp/sparsehash*

export PATH=$PATH:$SPARSEHASH_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$SPARSEHASH_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SPARSEHASH_HOME/lib


################################ 
# Install graph-tool
#################################

GRAPHTOOL_HOME=/usr/local/graph-tool-2.43
wget https://git.skewed.de/count0/graph-tool/-/archive/release-2.43/graph-tool-release-2.43.tar.gz -O /tmp/graph-tool-release-2.43.tar.gz && \
        cd /tmp && tar -zxvf graph-tool-release-2.43.tar.gz && \
        cd graph-tool-release-2.43 && \
        ./autogen.sh && \
        BOOST_PYTHON_LIB=$PYTHON_HOME/lib/ BOOST_LDFLAGS=$BOOST_HOME/lib/ BOOST_CPPFLAGS=$BOOST_HOME/include/ ./configure --prefix $GRAPHTOOL_HOME --with-boost-libdir=$BOOST_HOME/lib/ --with-cgal-libdir=$CGAL_HOME  --with-pycairo-libdir=/usr/local/cairo --with-sparsehash-libdir=$SPARSEHASH_HOME && \
        make && make install && \
        rm -rf /tmp/graph-tool*

export PATH=$PATH:$GRAPHTOOL_HOME/bin/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$GRAPHTOOL_HOME/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GRAPHTOOL_HOME/lib

