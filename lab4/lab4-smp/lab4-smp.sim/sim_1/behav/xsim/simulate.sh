#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Wed Dec 09 14:53:11 EET 2020
# SW Build 2960000 on Wed Aug  5 22:57:21 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim simulation_behav -key {Behavioral:sim_1:Functional:simulation} -tclbatch simulation.tcl -protoinst "protoinst_files/design_1.protoinst" -log simulate.log"
xsim simulation_behav -key {Behavioral:sim_1:Functional:simulation} -tclbatch simulation.tcl -protoinst "protoinst_files/design_1.protoinst" -log simulate.log

