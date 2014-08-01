#!/bin/sh

# Oxygen Webhelp plugin
# Copyright (c) 1998-2014 Syncro Soft SRL, Romania.  All rights reserved.
# Licensed under the terms stated in the license file EULA_Webhelp.txt 
# available in the base directory of this Oxygen Webhelp plugin.


# The path of the Java Virtual Machine install directory
JVM_INSTALL_DIR=/usr/bin/jdk1.6.0_38

# The path of the DITA Open Toolkit install directory
DITA_OT_INSTALL_DIR=/home/test/oxygen-webhelp/DITA-OT1.7.5

# The path of the Saxon 9.1.0.8 install directory  
SAXON_9_DIR=/home/test/oxygen-webhelp/saxonb9-1-0-8j

# One of the following three values: 
#      webhelp
#      webhelp-feedback
#      webhelp-mobile
TRANSTYPE=webhelp

# The path of the directory of the input DITA map file
DITA_MAP_BASE_DIR=/home/test/oxygen-webhelp/OxygenXMLEditor/samples/dita/flowers

# The name of the input DITA map file
DITAMAP_FILE=flowers.ditamap

# The name of the DITAVAL input filter file 
DITAVAL_FILE=my_ditaval.ditaval

# The path of the directory of the DITAVAL input filter file
DITAVAL_DIR=/home/test/oxygen-webhelp/OxygenXMLEditor/samples/dita


"$JVM_INSTALL_DIR/bin/java"\
 -Xmx512m\
 -classpath\
 "$DITA_OT_INSTALL_DIR/tools/ant/lib/ant-launcher.jar"\
 "-Dant.home=$DITA_OT_INSTALL_DIR/tools/ant" org.apache.tools.ant.launch.Launcher\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/xercesImpl.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/xml-apis.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/xml-apis-ext.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/dost-patches.jar"\
 -lib "$DITA_OT_INSTALL_DIR"\
 -lib "$DITA_OT_INSTALL_DIR/lib"\
 -lib "$SAXON_9_DIR/saxon9.jar"\
 -lib "$SAXON_9_DIR/saxon9-dom.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/license.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/log4j.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/resolver.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/ant-contrib-1.0b3.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/lucene-analyzers-common-4.0.0.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/lucene-core-4.0.0.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/xhtml-indexer.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.highlight/lib/xslthl-2.1.0.jar"\
 -lib "$DITA_OT_INSTALL_DIR/plugins/com.oxygenxml.webhelp/lib/webhelpXsltExtensions.jar"\
 -f "$DITA_OT_INSTALL_DIR/build.xml"\
 "-Dtranstype=$TRANSTYPE"\
 "-Dbasedir=$DITA_MAP_BASE_DIR"\
 "-Doutput.dir=$DITA_MAP_BASE_DIR/out/$TRANSTYPE"\
 "-Ddita.temp.dir=$DITA_MAP_BASE_DIR/temp/$TRANSTYPE"\
 "-Dargs.hide.parent.link=no"\
 "-Dargs.filter=$DITAVAL_DIR/$DITAVAL_FILE"\
 "-Ddita.input.valfile=$DITAVAL_DIR/$DITAVAL_FILE"\
 "-Ddita.dir=$DITA_OT_INSTALL_DIR"\
 "-Dargs.xhtml.classattr=yes"\
 "-Dargs.input=$DITA_MAP_BASE_DIR/$DITAMAP_FILE"\
 "-DbaseJVMArgLine=-Xmx384m"