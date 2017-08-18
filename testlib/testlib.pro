TEMPLATE = lib

CONFIG(debug, debug|release){
    TARGET = testdebug

}else{
    TARGET = testreleas
}



DESTDIR += $$PWD/../../build/lib
OBJECTS_DIR += $$PWD/../../build/obj
OBJECTIVE_HEADERS += $$PWD/../../build/include


#message($$DESTDIR)
#message($$OBJECTS_DIR)
#message($$OBJECTIVE_HEADERS)


CONFIG += console \
          c++11 \
          create_pc \
          create_prl \
          no_install_prl

CONFIG -= app_bundle \
          qt


#we defined a macro here. So we can use it in code.
DEFINES += TEST

isEmpty(PREFIX){
    PREFIX += /usr
}

isEmpty(VERSION){
    VERSION = 1.0
}


CONFIG(release, debug|release){
    LIB_INSTALL_DIR = $$[QT_INSTALL_LIBS]
    INCLUDE_INSTALL_DIR = $$PREFIX/include/test-release
}

CONFIG(debug, debug|release){
    LIB_INSTALL_DIR = $$PREFIX/lib
    INCLUDE_INSTALL_DIR = $$PREFIX/include/test-debug
}

isEmpty(target){
    target.path = $$LIB_INSTALL_DIR
    target.files += $$PWD/../../build/lib/*
}

isEmpty(includes){
    includes.path = $$INCLUDE_INSTALL_DIR
    includes.files += ./*.h
}

QMAKE_PKGCONFIG_DESCRIPTION = The lib for testing
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_NAME = testlib
QMAKE_PKGCONFIG_VERSION = $$VERSION

QMAKE_PKGCONFIG_LIBDIR = $$traget.path
QMAKE_PKGCONFIG_INCDIR = $$includes.path


INSTALLS += target includes



SOURCES += \
    counter.cpp

HEADERS += \
    counter.h
