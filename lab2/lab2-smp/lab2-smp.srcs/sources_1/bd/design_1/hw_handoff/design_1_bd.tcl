
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# Decadd, MC68000, MC68230, REG, splitter

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLK_0 [ create_bd_port -dir I -type clk CLK_0 ]
  set H1_0 [ create_bd_port -dir I H1_0 ]
  set IPL0_0 [ create_bd_port -dir I IPL0_0 ]
  set IPL1_0 [ create_bd_port -dir I IPL1_0 ]
  set IPL2_0 [ create_bd_port -dir I IPL2_0 ]
  set IRESET_0 [ create_bd_port -dir I IRESET_0 ]
  set PA7_0 [ create_bd_port -dir I PA7_0 ]
  set PC0_0 [ create_bd_port -dir I PC0_0 ]
  set PC1_0 [ create_bd_port -dir I PC1_0 ]

  # Create instance: Decadd_0, and set properties
  set block_name Decadd
  set block_cell_name Decadd_0
  if { [catch {set Decadd_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Decadd_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MC68000_0, and set properties
  set block_name MC68000
  set block_cell_name MC68000_0
  if { [catch {set MC68000_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MC68000_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MC68230_0, and set properties
  set block_name MC68230
  set block_cell_name MC68230_0
  if { [catch {set MC68230_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MC68230_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: REG_0, and set properties
  set block_name REG
  set block_cell_name REG_0
  if { [catch {set REG_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $REG_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: splitter_0, and set properties
  set block_name splitter
  set block_cell_name splitter_0
  if { [catch {set splitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $splitter_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net CLK_0_1 [get_bd_ports CLK_0] [get_bd_pins Decadd_0/CLK] [get_bd_pins MC68000_0/CLK] [get_bd_pins MC68230_0/CLK]
  connect_bd_net -net Decadd_0_CSo [get_bd_pins Decadd_0/CSo] [get_bd_pins MC68230_0/CS]
  connect_bd_net -net H1_0_1 [get_bd_ports H1_0] [get_bd_pins MC68230_0/H1]
  connect_bd_net -net IPL0_0_1 [get_bd_ports IPL0_0] [get_bd_pins MC68000_0/IPL0]
  connect_bd_net -net IPL1_0_1 [get_bd_ports IPL1_0] [get_bd_pins MC68000_0/IPL1]
  connect_bd_net -net IPL2_0_1 [get_bd_ports IPL2_0] [get_bd_pins MC68000_0/IPL2]
  connect_bd_net -net IRESET_0_1 [get_bd_ports IRESET_0] [get_bd_pins MC68000_0/IRESET]
  connect_bd_net -net MC68000_0_A [get_bd_pins MC68000_0/A] [get_bd_pins REG_0/A]
  connect_bd_net -net MC68000_0_D [get_bd_pins MC68000_0/D] [get_bd_pins splitter_0/m]
  connect_bd_net -net MC68000_0_LDS [get_bd_pins Decadd_0/LDSi] [get_bd_pins MC68000_0/LDS]
  connect_bd_net -net MC68000_0_RESET [get_bd_pins MC68000_0/RESET] [get_bd_pins MC68230_0/RESET]
  connect_bd_net -net MC68000_0_RW [get_bd_pins MC68000_0/RW] [get_bd_pins MC68230_0/RW]
  connect_bd_net -net MC68000_0_UDS [get_bd_pins Decadd_0/UDSi] [get_bd_pins MC68000_0/UDS]
  connect_bd_net -net MC68230_0_DTACKi [get_bd_pins MC68000_0/DTACK] [get_bd_pins MC68230_0/DTACKi]
  connect_bd_net -net PA7_0_1 [get_bd_ports PA7_0] [get_bd_pins MC68230_0/PA7]
  connect_bd_net -net PC0_0_1 [get_bd_ports PC0_0] [get_bd_pins MC68230_0/PC0]
  connect_bd_net -net PC1_0_1 [get_bd_ports PC1_0] [get_bd_pins MC68230_0/PC1]
  connect_bd_net -net REG_0_Ao [get_bd_pins MC68230_0/RSi] [get_bd_pins REG_0/Ao]
  connect_bd_net -net REG_0_Ao1 [get_bd_pins Decadd_0/Ai] [get_bd_pins REG_0/Ao1]
  connect_bd_net -net splitter_0_f [get_bd_pins MC68230_0/D] [get_bd_pins splitter_0/f]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


