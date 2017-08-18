#-------------------------------------------------
#
# Project created by QtCreator 2017-08-17T21:56:09
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = test
TEMPLATE = app


INCLUDEPATH += $$PWD/../testlib

LIBS += -L$$PWD/../build/lib -ltestdebug


SOURCES += main.cpp
