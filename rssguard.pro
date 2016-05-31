#################################################################
#
# This file is part of RSS Guard.
#
# Copyright (C) 2011-2016 by Martin Rotter <rotter.martinos@gmail.com>
#
# RSS Guard is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# RSS Guard is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with RSS Guard. If not, see <http:# www.gnu.org/licenses/>.
#
#
#  This is RSS Guard compilation script for qmake.
#
# Usage:
#   a) DEBUG build for testing.
#     qmake -r CONFIG+=debug DESTDIR=/dir/dir/dir
#
#   b) RELEASE build for production use.
#     .....
#
# Other information:
#   - supports Windows, Linux,
#   - Qt 5.4 and higher is required,
#   - resource compiler (windres.exe) is needed on MinGW,
#   - resource compiler (rc.exe) is recommended on OS/2.
#
# Authors and contributors:
#   - Martin Rotter (project leader),
#   - Elbert Pol (huge OS/2-related contributions).
#
#################################################################

TEMPLATE    = app
TARGET      = rssguard
APP_NAME    = rssguard
DEFINES	    *= QT_USE_QSTRINGBUILDER

CODECFORTR  = UTF-8
CODECFORSRC = UTF-8

message(rssguard: Welcome to RSS Guard qmake script.)
message(rssguard: Detected Qt version: '$$QT_VERSION'.)
message(rssguard: Destination directory: '$$PREFIX'.)

lessThan(QT_MAJOR_VERSION, 5)|lessThan(QT_MINOR_VERSION, 4) {
  error(rssguard: At least Qt 5.4.0 is required.)
}

isEmpty(PREFIX) {
  error(rssguard: Variable PREFIX is not set.)
}

message(rssguard: Build directory: '$$DESTDIR'.)
message(rssguard: Install directory: '$$PREFIX'.)


QT += core gui widgets sql network xml printsupport

HEADERS += src/core/feeddownloader.h \
           src/core/feedsmodel.h \
           src/core/feedsproxymodel.h \
           src/core/message.h \
           src/core/messagesmodel.h \
           src/core/messagesproxymodel.h \
           src/core/parsingfactory.h \
           src/definitions/definitions.h \
           src/dynamic-shortcuts/dynamicshortcuts.h \
           src/dynamic-shortcuts/dynamicshortcutswidget.h \
           src/dynamic-shortcuts/shortcutbutton.h \
           src/dynamic-shortcuts/shortcutcatcher.h \
           src/exceptions/applicationexception.h \
           src/exceptions/ioexception.h \
           src/gui/baselineedit.h \
           src/gui/basetoolbar.h \
           src/gui/colorlabel.h \
           src/gui/comboboxwithstatus.h \
           src/gui/dialogs/formabout.h \
           src/gui/dialogs/formaddaccount.h \
           src/gui/dialogs/formbackupdatabasesettings.h \
           src/gui/dialogs/formdatabasecleanup.h \
           src/gui/dialogs/formmain.h \
           src/gui/dialogs/formrestoredatabasesettings.h \
           src/gui/dialogs/formsettings.h \
           src/gui/dialogs/formupdate.h \
           src/gui/edittableview.h \
           src/gui/feedmessageviewer.h \
           src/gui/feedstoolbar.h \
           src/gui/feedsview.h \
           src/gui/labelwithstatus.h \
           src/gui/lineeditwithstatus.h \
           src/gui/messagebox.h \
           src/gui/messagepreviewer.h \
           src/gui/messagessearchlineedit.h \
           src/gui/messagestoolbar.h \
           src/gui/messagesview.h \
           src/gui/messagetextbrowser.h \
           src/gui/newspaperpreviewer.h \
           src/gui/plaintoolbutton.h \
           src/gui/squeezelabel.h \
           src/gui/statusbar.h \
           src/gui/styleditemdelegatewithoutfocus.h \
           src/gui/systemtrayicon.h \
           src/gui/tabbar.h \
           src/gui/tabcontent.h \
           src/gui/tabwidget.h \
           src/gui/timespinbox.h \
           src/gui/toolbareditor.h \
           src/gui/widgetwithstatus.h \
           src/miscellaneous/application.h \
           src/miscellaneous/autosaver.h \
           src/miscellaneous/databasecleaner.h \
           src/miscellaneous/databasefactory.h \
           src/miscellaneous/databasequeries.h \
           src/miscellaneous/debugging.h \
           src/miscellaneous/iconfactory.h \
           src/miscellaneous/iofactory.h \
           src/miscellaneous/localization.h \
           src/miscellaneous/mutex.h \
           src/miscellaneous/settings.h \
           src/miscellaneous/settingsproperties.h \
           src/miscellaneous/simplecrypt/simplecrypt.h \
           src/miscellaneous/skinfactory.h \
           src/miscellaneous/systemfactory.h \
           src/miscellaneous/textfactory.h \
           src/network-web/basenetworkaccessmanager.h \
           src/network-web/downloader.h \
           src/network-web/downloadmanager.h \
           src/network-web/networkfactory.h \
           src/network-web/silentnetworkaccessmanager.h \
           src/network-web/webfactory.h \
           src/qtsingleapplication/qtlocalpeer.h \
           src/qtsingleapplication/qtlockedfile.h \
           src/qtsingleapplication/qtsingleapplication.h \
           src/qtsingleapplication/qtsinglecoreapplication.h \
           src/services/abstract/accountcheckmodel.h \
           src/services/abstract/category.h \
           src/services/abstract/feed.h \
           src/services/abstract/gui/formfeeddetails.h \
           src/services/abstract/recyclebin.h \
           src/services/abstract/rootitem.h \
           src/services/abstract/serviceentrypoint.h \
           src/services/abstract/serviceroot.h \
           src/services/owncloud/definitions.h \
           src/services/owncloud/gui/formeditowncloudaccount.h \
           src/services/owncloud/gui/formowncloudfeeddetails.h \
           src/services/owncloud/network/owncloudnetworkfactory.h \
           src/services/owncloud/owncloudcategory.h \
           src/services/owncloud/owncloudfeed.h \
           src/services/owncloud/owncloudrecyclebin.h \
           src/services/owncloud/owncloudserviceentrypoint.h \
           src/services/owncloud/owncloudserviceroot.h \
           src/services/standard/gui/formstandardcategorydetails.h \
           src/services/standard/gui/formstandardfeeddetails.h \
           src/services/standard/gui/formstandardimportexport.h \
           src/services/standard/standardcategory.h \
           src/services/standard/standardfeed.h \
           src/services/standard/standardfeedsimportexportmodel.h \
           src/services/standard/standardserviceentrypoint.h \
           src/services/standard/standardserviceroot.h \
           src/services/tt-rss/definitions.h \
           src/services/tt-rss/gui/formeditaccount.h \
           src/services/tt-rss/gui/formttrssfeeddetails.h \
           src/services/tt-rss/network/ttrssnetworkfactory.h \
           src/services/tt-rss/ttrsscategory.h \
           src/services/tt-rss/ttrssfeed.h \
           src/services/tt-rss/ttrssrecyclebin.h \
           src/services/tt-rss/ttrssserviceentrypoint.h \
           src/services/tt-rss/ttrssserviceroot.h

SOURCES += src/core/feeddownloader.cpp \
           src/core/feedsmodel.cpp \
           src/core/feedsproxymodel.cpp \
           src/core/message.cpp \
           src/core/messagesmodel.cpp \
           src/core/messagesproxymodel.cpp \
           src/core/parsingfactory.cpp \
           src/dynamic-shortcuts/dynamicshortcuts.cpp \
           src/dynamic-shortcuts/dynamicshortcutswidget.cpp \
           src/dynamic-shortcuts/shortcutbutton.cpp \
           src/dynamic-shortcuts/shortcutcatcher.cpp \
           src/exceptions/applicationexception.cpp \
           src/exceptions/ioexception.cpp \
           src/gui/baselineedit.cpp \
           src/gui/basetoolbar.cpp \
           src/gui/colorlabel.cpp \
           src/gui/comboboxwithstatus.cpp \
           src/gui/dialogs/formabout.cpp \
           src/gui/dialogs/formaddaccount.cpp \
           src/gui/dialogs/formbackupdatabasesettings.cpp \
           src/gui/dialogs/formdatabasecleanup.cpp \
           src/gui/dialogs/formmain.cpp \
           src/gui/dialogs/formrestoredatabasesettings.cpp \
           src/gui/dialogs/formsettings.cpp \
           src/gui/dialogs/formupdate.cpp \
           src/gui/edittableview.cpp \
           src/gui/feedmessageviewer.cpp \
           src/gui/feedstoolbar.cpp \
           src/gui/feedsview.cpp \
           src/gui/labelwithstatus.cpp \
           src/gui/lineeditwithstatus.cpp \
           src/gui/messagebox.cpp \
           src/gui/messagepreviewer.cpp \
           src/gui/messagessearchlineedit.cpp \
           src/gui/messagestoolbar.cpp \
           src/gui/messagesview.cpp \
           src/gui/messagetextbrowser.cpp \
           src/gui/newspaperpreviewer.cpp \
           src/gui/plaintoolbutton.cpp \
           src/gui/squeezelabel.cpp \
           src/gui/statusbar.cpp \
           src/gui/styleditemdelegatewithoutfocus.cpp \
           src/gui/systemtrayicon.cpp \
           src/gui/tabbar.cpp \
           src/gui/tabcontent.cpp \
           src/gui/tabwidget.cpp \
           src/gui/timespinbox.cpp \
           src/gui/toolbareditor.cpp \
           src/gui/widgetwithstatus.cpp \
           src/main.cpp \
           src/miscellaneous/application.cpp \
           src/miscellaneous/autosaver.cpp \
           src/miscellaneous/databasecleaner.cpp \
           src/miscellaneous/databasefactory.cpp \
           src/miscellaneous/databasequeries.cpp \
           src/miscellaneous/debugging.cpp \
           src/miscellaneous/iconfactory.cpp \
           src/miscellaneous/iofactory.cpp \
           src/miscellaneous/localization.cpp \
           src/miscellaneous/mutex.cpp \
           src/miscellaneous/settings.cpp \
           src/miscellaneous/simplecrypt/simplecrypt.cpp \
           src/miscellaneous/skinfactory.cpp \
           src/miscellaneous/systemfactory.cpp \
           src/miscellaneous/textfactory.cpp \
           src/network-web/basenetworkaccessmanager.cpp \
           src/network-web/downloader.cpp \
           src/network-web/downloadmanager.cpp \
           src/network-web/networkfactory.cpp \
           src/network-web/silentnetworkaccessmanager.cpp \
           src/network-web/webfactory.cpp \
           src/qtsingleapplication/qtlocalpeer.cpp \
           src/qtsingleapplication/qtlockedfile.cpp \
           src/qtsingleapplication/qtsingleapplication.cpp \
           src/qtsingleapplication/qtsinglecoreapplication.cpp \
           src/services/abstract/accountcheckmodel.cpp \
           src/services/abstract/category.cpp \
           src/services/abstract/feed.cpp \
           src/services/abstract/gui/formfeeddetails.cpp \
           src/services/abstract/recyclebin.cpp \
           src/services/abstract/rootitem.cpp \
           src/services/abstract/serviceentrypoint.cpp \
           src/services/abstract/serviceroot.cpp \
           src/services/owncloud/gui/formeditowncloudaccount.cpp \
           src/services/owncloud/gui/formowncloudfeeddetails.cpp \
           src/services/owncloud/network/owncloudnetworkfactory.cpp \
           src/services/owncloud/owncloudcategory.cpp \
           src/services/owncloud/owncloudfeed.cpp \
           src/services/owncloud/owncloudrecyclebin.cpp \
           src/services/owncloud/owncloudserviceentrypoint.cpp \
           src/services/owncloud/owncloudserviceroot.cpp \
           src/services/standard/gui/formstandardcategorydetails.cpp \
           src/services/standard/gui/formstandardfeeddetails.cpp \
           src/services/standard/gui/formstandardimportexport.cpp \
           src/services/standard/standardcategory.cpp \
           src/services/standard/standardfeed.cpp \
           src/services/standard/standardfeedsimportexportmodel.cpp \
           src/services/standard/standardserviceentrypoint.cpp \
           src/services/standard/standardserviceroot.cpp \
           src/services/tt-rss/gui/formeditaccount.cpp \
           src/services/tt-rss/gui/formttrssfeeddetails.cpp \
           src/services/tt-rss/network/ttrssnetworkfactory.cpp \
           src/services/tt-rss/ttrsscategory.cpp \
           src/services/tt-rss/ttrssfeed.cpp \
           src/services/tt-rss/ttrssrecyclebin.cpp \
           src/services/tt-rss/ttrssserviceentrypoint.cpp \
           src/services/tt-rss/ttrssserviceroot.cpp

FORMS += src/gui/messagepreviewer.ui \
         src/gui/newspaperpreviewer.ui \
         src/gui/toolbareditor.ui \
         src/network-web/downloaditem.ui \
         src/network-web/downloadmanager.ui \
         src/gui/dialogs/formabout.ui \
         src/gui/dialogs/formaddaccount.ui \
         src/gui/dialogs/formbackupdatabasesettings.ui \
         src/gui/dialogs/formdatabasecleanup.ui \
         src/gui/dialogs/formmain.ui \
         src/gui/dialogs/formrestoredatabasesettings.ui \
         src/gui/dialogs/formsettings.ui \
         src/gui/dialogs/formupdate.ui \
         src/services/abstract/gui/formfeeddetails.ui \
         src/services/owncloud/gui/formeditowncloudaccount.ui \
         src/services/standard/gui/formstandardcategorydetails.ui \
         src/services/standard/gui/formstandardimportexport.ui \
         src/services/tt-rss/gui/formeditaccount.ui

TRANSLATIONS += localization/qtbase-cs_CZ.ts \
                localization/qtbase-da_DK.ts \
                localization/qtbase-de_DE.ts \
                localization/qtbase-fr_FR.ts \
                localization/qtbase-he_IL.ts \
                localization/qtbase-it_IT.ts \
                localization/qtbase-ja_JP.ts \
                localization/qtbase-sv_SE.ts \
                localization/rssguard-cs_CZ.ts \
                localization/rssguard-da_DK.ts \
                localization/rssguard-de_DE.ts \
                localization/rssguard-en_GB.ts \
                localization/rssguard-en_US.ts \
                localization/rssguard-fr_FR.ts \
                localization/rssguard-he_IL.ts \
                localization/rssguard-id_ID.ts \
                localization/rssguard-it_IT.ts \
                localization/rssguard-ja_JP.ts \
                localization/rssguard-lt_LT.ts \
                localization/rssguard-nl_NL.ts \
                localization/rssguard-pt_BR.ts \
                localization/rssguard-sv_SE.ts

INCLUDEPATH +=  $$PWD/. \
                $$PWD/src \
                $$PWD/src/gui \
                $$PWD/src/gui/dialogs \
                $$PWD/src/dynamic-shortcuts

TEXTS = resources/text/CHANGELOG \
        resources/text/COPYING_BSD

# Install all files on Windows.
win32 {
  target.path = $$PREFIX

  misc_sql.files = resources/misc/*.sql
  misc_sql.path = $$PREFIX/misc
}

# Install all files on Linux.
unix:!mac {
  target.path = $$PREFIX/usr/bin

  # Install SQL initializers.
  misc_sql.files = resources/misc/*.sql
  misc_sql.path = $$quote($$PREFIX/usr/share/$$TARGET/misc/)

  # Misc icons.
  misc_icons.files = resources/graphics/misc/*.png
  misc_icons.path = $$quote($$PREFIX/usr/share/$$TARGET/icons/misc/)
  misc_flags.files = resources/graphics/misc/flags/*.png
  misc_flags.path = $$quote($$PREFIX/usr/share/$$TARGET/icons/misc/flags/)

  # Initial feeds.
  misc_feeds.files = resources/initial_feeds
  misc_feeds.path = $$quote($$PREFIX/usr/share/$$TARGET/)

  misc_icon.files = $$quote($$OUT_PWD/$${TARGET}.png)
  misc_icon.extra = cp $$quote($$PWD/resources/graphics/$${TARGET}_128.png) $$quote($$OUT_PWD/$${TARGET}.png)
  misc_icon.path = $$quote($$PREFIX/usr/share/pixmaps/)

  misc_plain_icon.files = $$quote($$OUT_PWD/$${TARGET}_plain.png)
  misc_plain_icon.extra = cp $$quote($$PWD/resources/graphics/$${TARGET}_plain_128.png) $$quote($$OUT_PWD/$${TARGET}_plain.png)
  misc_plain_icon.path = $$quote($$PREFIX/usr/share/$$TARGET/icons/)

  misc_texts.files = $$TEXTS
  misc_texts.path = $$quote($$PREFIX/usr/share/$$TARGET/information/)

  updateqm.input = TRANSLATIONS
  updateqm.output = ${QMAKE_FILE_BASE}.qm
  updateqm.commands = lrelease ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_BASE}.qm
  updateqm.CONFIG += no_link target_predeps
  QMAKE_EXTRA_COMPILERS += updateqm

  translations.files = $$OUT_PWD/*.qm
  translations.path = $$quote($$PREFIX/usr/share/$$TARGET/l10n/)

  INSTALLS += target misc_sql misc_icons misc_flags misc_feeds misc_icon misc_plain_icon misc_texts translations
}

# Install all files on Mac OS X.
mac {
}