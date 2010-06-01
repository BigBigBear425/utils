#########################################################################
# LEGALESE:   Copyright (c) 2008, Suntec Inc.
# 
#   This source code is confidential, proprietary, and contains trade
#   secrets that are the sole property of Suntec Inc,.
#   Copy and/or distribution of this source code or disassembly or
#   reverse engineering of the resultant object code are strictly
#   forbidden without the written consent of Suntec Inc,.
#  -----------------------------------------------------------------------
# 
#  FILE NAME  :  Makefile
#  -----------
# 
#  DESCRIPTION :
#  -----------
#   This make file is crated for application development environment. 
#   The user must source MakeEnv at project top level to setup the 
#   project make global environment variables.
# 
#  MODIFICATION HISTORY
#  --------------------
#  Thu Oct 16 08:31:34 PST 2008:created by Iori
# 
##########################################################################
#
# TODO:
#	make sub directory using -C, or in itself
 
#
# Top Level Makefile for all purposes
#
ifndef PLATFORM
PLATFORM			= btm
endif

#
# define cross tool
#
ifeq ($(PLATFORM), emma3pf)
ARCH				= mips
HOST_TYPE			= mips-montavista-linux
TARGET_TYPE			=
BUILD_TYPE			= i686-pc-linux-gnu
CROSS_HEAD			= mips2_fp_be-

CROSS_TOOL_DIR		= /opt/mvl5-cross/montavista/pro/devkit/mips/mips2_fp_be/bin
CROSS_ROOT_DIR		= $(CROSS_TOOL_DIR)/../target
endif

ifeq ($(PLATFORM), btm)
ARCH				= arm
HOST_TYPE			= arm-linux-gnueabi
TARGET_TYPE			=
BUILD_TYPE			= i686-pc-linux-gnu
CROSS_HEAD			= arm-none-linux-gnueabi-

CROSS_TOOL_DIR		= /opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi/bin
CROSS_ROOT_DIR		= $(CROSS_TOOL_DIR)/../sysroot
endif

ifeq ($(PLATFORM), win32)
ARCH				= i686
HOST_TYPE			= i686-pc-mingw32
TARGET_TYPE			=
BUILD_TYPE			= i686-pc-mingw32
CROSS_HEAD			= i686-pc-mingw32-

CROSS_TOOL_DIR		= /usr/bin
CROSS_ROOT_DIR		=
endif

ifeq ($(PLATFORM), x86)
ARCH				= i686
HOST_TYPE			= i686-pc-linux-gnu
TARGET_TYPE			= i686-pc-linux-gnu
BUILD_TYPE			= i686-pc-linux-gnu
CROSS_HEAD			=

CROSS_TOOL_DIR		= /usr/bin
CROSS_ROOT_DIR		= /usr
endif

CROSS_INC_DIR		= $(CROSS_ROOT_DIR)/usr/include
CROSS_LIB_DIR		= $(CROSS_ROOT_DIR)/usr/lib

export PLATFORM CROSS_TOOL_DIR HOST_TYPE TARGET_TYPE BUILD_TYPE CROSS_HEAD BUILD_TYPE

#
# -- define x86 build binary tools
#
ECHO				= /bin/echo
CP					= /bin/cp -f
RM					= /bin/rm -rf
AWK     			= /bin/awk 
MKDIR   			= /bin/mkdir -p
TOUCH   			= /bin/touch
SED     			= /bin/sed
MV      			= /bin/mv
CHMOD   			= /bin/chmod
CAT     			= /bin/cat
MAKE    			= /usr/bin/make
PERL    			= /usr/bin/perk
LN      			= /bin/ln
LINT				= /usr/bin/splint
TAR					= /bin/tar
PATCH				= /usr/bin/patch
CCACHE				= /usr/bin/ccache

CC					= $(CCACHE) $(CROSS_TOOL_DIR)/$(CROSS_HEAD)gcc
GCC					= $(CCACHE) $(CROSS_TOOL_DIR)/$(CROSS_HEAD)gcc
GPP					= $(CCACHE) $(CROSS_TOOL_DIR)/$(CROSS_HEAD)g++
CXX					= $(CCACHE) $(CROSS_TOOL_DIR)/$(CROSS_HEAD)g++
CPP					= $(CCACHE) $(CROSS_TOOL_DIR)/$(CROSS_HEAD)cpp
LD					= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)ld
AS					= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)as
AR					= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)ar
NM					= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)nm
STRIP				= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)strip
RANLIB				= $(CROSS_TOOL_DIR)/$(CROSS_HEAD)ranlib

export CC GCC GPP CXX CPP LD AS AR NM STRIP RANLIB

#
# -- define lint parameter
#
LINT_FLAG	= -preproc -weak -warnposixheaders -sysdirerrors \
				+bounds +ignoresigns -unrecog -initallelements \
				-fixedformalarray

#
# -- define final target "build" directory location
#
ifndef TOP_DIR
TOP_DIR         	= $(MAKE_RULE_DIR)/..
SDK_SRC_DIR     	= $(TOP_DIR)/platformDep
OPEN_SRC_DIR    	= $(TOP_DIR)/openSource
MY_SRC_DIR			= $(TOP_DIR)/src
endif

TARGET_OBJ_DIR			= $(PLATFORM)-build
TARGET_STATIC_LIB_DIR	= $(TARGET_OBJ_DIR)
TARGET_SHARE_LIB_DIR	= $(TARGET_OBJ_DIR)
TARGET_EXE_DIR			= $(TARGET_OBJ_DIR)

INSTALL_DIR				= $(SDK_SRC_DIR)/$(PLATFORM)/rootfs
INSTALL_ETC_DIR			= $(INSTALL_DIR)/etc
INSTALL_BIN_DIR			= $(INSTALL_DIR)/usr/bin
INSTALL_LIB_DIR			= $(INSTALL_DIR)/usr/lib
INSTALL_INC_DIR			= $(INSTALL_DIR)/usr/include
LOCAL_INSTALL_DIR		= $(INSTALL_DIR)/usr/local
LOCAL_INSTALL_ETC_DIR	= $(LOCAL_INSTALL_DIR)/etc
LOCAL_INSTALL_BIN_DIR	= $(LOCAL_INSTALL_DIR)/bin
LOCAL_INSTALL_LIB_DIR	= $(LOCAL_INSTALL_DIR)/lib
LOCAL_INSTALL_INC_DIR	= $(LOCAL_INSTALL_DIR)/include

#
# -- define header include path
#
PRJ_INC	= $(MY_SRC_DIR)/inc
#
# -- define shared library link path
# -- notes :
#  PKG_CONFIG_PATH means where XXX.pc locate
#  PKG_CONFIG_NAME means the package name, for example XXX.pc's
#    package name is XXX
#
PKG_CONFIG_PATH = $(LOCAL_INSTALL_DIR)/lib/pkgconfig
export PKG_CONFIG_PATH

#
# -- TODO :
#
PKG_CONFIG_NAME		:=

#######################################################################
# The following are defined in each individual Makefile
# ------------------------------------------------------
# EXTRA_CFLAGS          - additional CFLAGS
# EXTRA_LDFLAGS         - additional LDFLAGS
# EXTRA_INC_DIR         - additional INCLUDE directories
# EXTRA_LIB_DIR         - additional LIBRARY directories
#
SDK_LDFLAGS	:=
CFLAGS		:= -D$(PLATFORM)=1 -Wall -O -g -rdynamic $(EXTRA_CFLAGS)
CPPFLAGS	:= -Wno-deprecated
LDFLAGS		:= -lpthread $(SDK_LDFLAGS) $(EXTRA_LDFLAGS)
LIB_DIR		:= -L$(INSTALL_LIB_DIR) -L$(LOCAL_INSTALL_LIB_DIR)

ifneq ("x$(EXTRA_LIB_DIR)", "x")
LIB_DIR		+= $(patsubst %,-L%,$(EXTRA_LIB_DIR))
endif

INC_DIR		:= -I.
INC_DIR		+= -I$(PRJ_INC)
INC_DIR		+= -I$(INSTALL_INC_DIR) -I$(LOCAL_INSTALL_INC_DIR)
INC_DIR		+= \
			   -I$(INSTALL_INC_DIR)/glib-2.0 \
			   -I$(INSTALL_LIB_DIR)/glib-2.0/include \
			   -I$(INSTALL_INC_DIR)/gstreamer-0.10 \
			   -I$(INSTALL_INC_DIR)/libxml2
ifeq ($(PLATFORM), x86)
INC_DIR		+= \
			   -I$(CROSS_ROOT_DIR)/include/glib-2.0 \
			   -I$(CROSS_ROOT_DIR)/lib/glib-2.0/include \
			   -I$(CROSS_ROOT_DIR)/include/gstreamer-0.10 \
			   -I$(CROSS_ROOT_DIR)/include/libxml2
endif

ifneq ("x$(SDK_INC)", "x")
INC_DIR		+= $(patsubst %,-I%,$(SDK_INC))
endif
ifneq ("x$(EXTRA_INC_DIR)", "x")
INC_DIR		+= $(patsubst %,-I%,$(EXTRA_INC_DIR))
endif

