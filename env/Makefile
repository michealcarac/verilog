# Global Makefile

# Defaults
TOP              ?= 
TOP_SYN          ?= $(TOP)
ADDITIONAL_FILES ?=

# Build Filelist
ifeq ($(wildcard $(TOP_SYN).v),$(TOP_SYN).v)
# If TOP_SYN and TOP are the same (TOP_SYN not set externally)
	ifeq ($(wildcard $(TOP_SYN).v),$(TOP).v)
		FILES   := $(TOP).v $(ADDITIONAL_FILES)	
	else
		FILES   := $(TOP_SYN).v $(TOP).v $(ADDITIONAL_FILES)
	endif
else
	FILES       := $(TOP).v $(ADDITIONAL_FILES)
endif

yosys:
	@echo "Synthesis of $(TOP_SYN).v"
	@yosys -p "read_verilog $(FILES);                            \
		hierarchy -top $(TOP_SYN);                               \
		proc; opt; flatten; opt;                                 \
		techmap; opt;                                            \
		dfflibmap -liberty $(SKY130_PDK_TT_025C_LIB);            \
		abc -liberty $(SKY130_PDK_TT_025C_LIB);                  \
		write_verilog -noattr -noexpr $(TOP_SYN)_netlist.v;      \
		stat -liberty $(SKY130_PDK_TT_025C_LIB);" > $(TOP_SYN)_report.txt;                 
	@echo "Stripping Report for gate count"
	@sed -i '/^=== /,$$!d' $(TOP)_report.txt