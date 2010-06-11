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
# -- define local specific flags, if any
#
EXTRA_CFLAGS    :=
EXTRA_LDFLAGS   :=
EXTRA_INC_DIR   :=
EXTRA_LIB_DIR   :=
#
# -- define sub directory name to be build, if any
#
SUB_DIRS        := log4c log4cpp
#
# -- define shared libary rules, if any
# -- notes : if *_SRCS is null, default it would include all 
#  the c and cpp files in "src" directory
#
SHARE_LIB       := 
SHARE_LIB_SRCS  :=
#
# -- define static libary rules
#
STATIC_LIB      :=
STATIC_LIB_SRCS :=
#
# -- define exe rules
#
EXECS           :=
EXE_SRCS        :=
#
# pre-processing rules
#
include $(MAKE_RULE_DIR)/Makefile.pre
#
# -- userself define targets
# -- note : it start after compiling, but before install
#  it must follow pre-processing rules
#
USER_DEF_TARGETS:=
#
# -- userself define pre-process targets
# -- note : it start before compiling
#  it must follow pre-processing rules
#
USER_PRE_PROCESS:=
#
# post-processing rules
#
include $(MAKE_RULE_DIR)/Makefile.post
#
# -- end --
#
