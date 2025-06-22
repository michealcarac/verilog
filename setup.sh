#! /bin/bash

# Check if the script is being sourced or ran directly
(return 0 2>/dev/null)
if [ $? -ne 0 ]; then
  echo "This script must be sourced, not executed!"
  echo "Use: source $0 or . $0"
  exit 1
fi

# Git Repo + submodule safe way to find Project Root 
PROJECT_ROOT="$(readlink -f ./$(git rev-parse --show-cdup))"

# Environment Makefile
export ENV_MAKEFILE="$PROJECT_ROOT/env/Makefile"
if [ ! -f "$ENV_MAKEFILE" ]; then
  echo "Warning: Could not find expected files in $PROJECT_ROOT"
fi

# Skywater PDK, will override if you have SKY130_PDK_OVERRIDE defined locally 
export SKY130_PDK="${SKY130_PDK_OVERRIDE:-$PROJECT_ROOT/sky130}"
export SKY130_PDK_SC="$SKY130_PDK/libraries/sky130_fd_sc_hd/latest"
export SKY130_PDK_TT_025C_LIB="$SKY130_PDK_SC/timing/sky130_fd_sc_hd__tt_025C_1v80.lib"
export SKY130_PDK_TT_100C_LIB="$SKY130_PDK_SC/timing/sky130_fd_sc_hd__tt_100C_1v80.lib"

echo "Set SKY130* env vars for synthesis/timing"
