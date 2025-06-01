#! /bin/bash

CURRENT_DIR=$(pwd)

# Skywater PDK
export SKY130_PDK="$CURRENT_DIR/sky130"
export SKY130_PDK_SC="$SKY130_PDK/libraries/sky130_fd_sc_hd/latest"
export SKY130_PDK_TT_025C_LIB="$SKY130_PDK_SC/sky130_fd_sc_hd__tt_025C_1v80.lib"
export SKY130_PDK_TT_100C_LIB="$SKY130_PDK_SC/sky130_fd_sc_hd__tt_100C_1v80.lib"
