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
# -- project application/library top level make tree
#
include $(MAKE_RULE_DIR)/config.mk
#
# -- define parameters
#

#
# -- package name
# -- note : if the source is a packet not a directory,
#  indicating the packet name here
#
PKG_NAME		:= log4cpp-1.0.tar.gz
#
# -- directory name after package uncompressed
# -- note : if the directory's name uncompressed by the packet is
#  prefix of the packet,leave PKG_DIR_NAME NULL
#  or if the source is a directory, you must indicated the directory
#  name here
#
PKG_DIR_NAME	:=
#
# -- patches name
# -- note : patches must be placed in 'patches' directory
#
PATCHES			:= 1.0-gcc43.patch
#
# -- configure parameters
# -- USE_HOST_PARAM = n means that while ./configure is executed
#  not using --host parameter,otherwise --host param is added default
# -- CONFIG_PARAMS : it is the params while executing ./configure
#  such as --prefix=xxx
#
USE_HOST_PARAM  :=
CONFIG_PARAMS	:=
#
# -- vars before configure such as CC=arm-linux-gcc
#
CONFIG_VARS		:=

export PKG_NAME PKG_DIR_NAME CONFIG_PARAMS CONFIG_VARS USE_HOST_PARAM
#
# -- dependent pkg
# -- note : any packet depended, add the directory name here
#
DEPENDENT_PKG	:=
#
# pre-processing rules
#
include $(MAKE_RULE_DIR)/Makefile.open
#
# -- userself define pre-process targets
# -- note : it must follow the pre-processing rules
#  and it would be executed before configuring
#
USER_PRE_PROCESS	:=
#
# -- userself define clean targets
# -- note : it must follow the pre-processing rules
#
USER_DEFINE_CLEAN	:=
#
# -- userself define compile target
# -- note : it must follow the pre-processing rules
#  if USER_DEFINE_COMPILE is not NULL, it would be executed instead
#  of the defautl target such as configure,make,make install
#
USER_DEFINE_COMPILE :=
#
# -- end --
#
