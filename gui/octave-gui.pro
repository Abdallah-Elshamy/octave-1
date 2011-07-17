# OctaveGUI - A graphical user interface for Octave
# Copyright (C) 2011 Jacob Dawid
# jacob.dawid@googlemail.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Basic settings:
QT                  += core gui webkit xml opengl   # Qt modules
TEMPLATE            = app                           # Build as application
TARGET              = octave-gui                    # Name of the target binary

DESTDIR             = bin                           # Destination of the output
UI_DIR              = ui-files                      # Folder for ui files
MOC_DIR             = moc-files                     # Folder for moc files
OBJECTS_DIR         = object-files                  # Folder for object files

TRANSLATIONS        += languages/german             # Available translations
LIBS                += -lqscintilla2

mac {
    CONFIG -= app_bundle
}

# Includepaths and libraries to link against:
INCLUDEPATH         += src src/terminal src/qirc
INCFLAGS            += $$system(mkoctfile -p INCFLAGS)
mac {
    INCFLAGS += -I/opt/local-native/include
}

LFLAGS              += $$system(mkoctfile -p LFLAGS) \
                       $$system(mkoctfile -p OCTAVE_LIBS) \
                       $$system(mkoctfile -p LIBS)
mac {
    LFLAGS += -L/opt/local-native/lib
}

QMAKE_LFLAGS        += $$LFLAGS -lutil $$system(mkoctfile -p RLD_FLAG)
QMAKE_CXXFLAGS      += $$INCFLAGS

# Files associated with the project:
SOURCES +=\
        src/terminal/TerminalCharacterDecoder.cpp \
        src/terminal/KeyboardTranslator.cpp \
        src/terminal/Screen.cpp \
        src/terminal/History.cpp \
        src/terminal/BlockArray.cpp \
        src/terminal/konsole_wcwidth.cpp \
        src/terminal/ScreenWindow.cpp \
        src/terminal/Emulation.cpp \
        src/terminal/Vt102Emulation.cpp \
        src/terminal/TerminalDisplay.cpp \
        src/terminal/Filter.cpp \
        src/terminal/Pty.cpp \
        src/terminal/kpty.cpp \
        src/terminal/kptyprocess.cpp \
        src/terminal/kprocess.cpp \
        src/terminal/kptydevice.cpp \
        src/terminal/Session.cpp \
        src/terminal/ShellCommand.cpp \
        src/terminal/QTerminalWidget.cpp \
        src/MainWindow.cpp \
        src/OctaveLink.cpp \
        src/terminal/ProcessInfo.cpp \
    	  src/OctaveTerminal.cpp \
    	  src/VariablesDockWidget.cpp \
    	  src/HistoryDockWidget.cpp \
    	  src/FilesDockWidget.cpp \
    	  src/FileEditorMdiSubWindow.cpp \
    	  src/BrowserWidget.cpp \
    	  src/ImageViewerMdiSubWindow.cpp \
    src/IRCWidget.cpp \
    src/qirc/IRCClient.cpp \
    src/qirc/IClientSocket.cpp \
    src/SettingsDialog.cpp \
    src/OctaveGUI.cpp

HEADERS += \
        src/terminal/TerminalCharacterDecoder.h \
        src/terminal/Character.h \
        src/terminal/CharacterColor.h \
		  src/terminal/ColorTables.h \
        src/terminal/KeyboardTranslator.h \
        src/terminal/Screen.h \
        src/terminal/History.h \
        src/terminal/BlockArray.h \
        src/terminal/konsole_wcwidth.h \
		  src/terminal/konsole_export.h \
        src/terminal/ScreenWindow.h \
        src/terminal/Emulation.h \
        src/terminal/Vt102Emulation.h \
        src/terminal/TerminalDisplay.h \
        src/terminal/Filter.h \
        src/terminal/LineFont.h \
        src/terminal/Pty.h \
        src/terminal/kpty.h \
        src/terminal/kpty_p.h \
		  src/terminal/kpty_export.h \
        src/terminal/kptyprocess.h \
        src/terminal/kprocess.h \
        src/terminal/kprocess_p.h \
        src/terminal/kptydevice.h \
        src/terminal/Session.h \
        src/terminal/ShellCommand.h \
        src/terminal/QTerminalWidget.h \
    	  src/MainWindow.h \
        src/OctaveLink.h \
        src/terminal/ProcessInfo.h \
    	  src/OctaveTerminal.h \
    	  src/VariablesDockWidget.h \
    	  src/HistoryDockWidget.h \
    	  src/FilesDockWidget.h \
    	  src/FileEditorMdiSubWindow.h \
    	  src/BrowserWidget.h \
    	  src/ImageViewerMdiSubWindow.h \
    src/IRCWidget.h \
    src/qirc/IRCCodes.h \
    src/qirc/IRCClient.h \
    src/qirc/IClientSocket.h \
    src/SettingsDialog.h

FORMS += \
    src/SettingsDialog.ui
