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
