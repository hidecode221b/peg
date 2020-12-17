About
========
The code has issues on macOS 10.15 then here is a summary on how to fix issues.

Installation and preparation
========

- Download code 

- Install brew from https://brew.sh/

- Install gsl from "brew install gsl"

- Install clang-omp from "brew install clang-omp"

- Install OpenMP runtime from "https://mac.r-project.org/openmp/"

```
curl -O https://mac.r-project.org/openmp/openmp-10.0.0-darwin17-Release.tar.gz
sudo tar fvx openmp-10.0.0-darwin17-Release.tar.gz -C /
```


Compile process
========

1. edit PESolver.cpp
```
gsl_odeiv2_system odeSys = {odeFunctionCB, odeJacobianCB, (unsigned long)eightNp4_, this};
```

2. edit qmake.conf such as "/Users/hideki/anaconda3/mkspecs/macx-clang/qmake.conf"
```
QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.15
```

3. edit PEG_mac.pro
```
QT     -= gui core

CONFIG -= app_bundle
TARGET = pegSerial

QMAKE_CXXFLAGS += -Xclang -fopenmp
QMAKE_LFLAGS += -lomp

INCLUDEPATH += /usr/local/include

LIBS += -L/usr/local/lib -lgsl -lgslcblas

HEADERS += src/PEG.h \
    src/PESolver.h \
    src/PEMainSupport.h

SOURCES += src/PEG.cpp\
    src/PESolver.cpp \
    src/PEMainSupport.cpp \

    src/mainSerial.cpp
```


4. run follows until "make: Nothing to be done for `first'."
```
qmake PEG_mac.pro
make
```
