#    Call Recorder for SailfishOS
#    Copyright (C) 2014  Dmitriy Purgin <dpurgin@gmail.com>

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

include(../common.pri)

TARGET = $${PACKAGE}d

target.path = /usr/bin

service.files = $${TARGET}.service
service.path = /usr/lib/systemd/user

INSTALLS += target service

TEMPLATE = app

CONFIG += console link_pkgconfig

QT += core dbus sql multimedia

INCLUDEPATH += ../libcallrecorder/include ../qtpulseaudio/qtpulseaudio/lib/include

LIBS += -L../libcallrecorder -lcallrecorder -L../qtpulseaudio -lqtpulse

PKGCONFIG += flac qofono-qt5

SOURCES += \
    src/application.cpp \
    src/main.cpp \
    src/voicecallrecorder.cpp \
    src/phonenumberstablemodel.cpp \
    src/eventstablemodel.cpp \
    src/model.cpp \
    src/dbusadaptor.cpp \
    src/uidbusinterface.cpp

HEADERS += \
    src/application.h \
    src/voicecallrecorder.h \
    src/phonenumberstablemodel.h \
    src/eventstablemodel.h \
    src/model.h \
    src/dbusadaptor.h \
    src/uidbusinterface.h

OTHER_FILES += \
    $${TARGET}.service
