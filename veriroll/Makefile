.PHONY = clean directories

# default target
all: directories main.out

# Flags, compiler, etc
CPPC = g++ -std=c++11
CPPFLAGS = -I./include

# directory locations
BUILDDIR = ./bld
BINDIR = ./bin

# Create Main
main.out: main.o
	$(CPPC) -o ./bin/main.out $(BUILDDIR)/main.o

# create object files
main.o: 
	$(CPPC) $(CPPFLAGS) -c -o $(BUILDDIR)/main.o ./*/main.cpp

# Created needed directories
directories: $(BUILDDIR) $(BINDIR)

$(BUILDDIR): 
	mkdir $(BUILDDIR)

$(BINDIR): 
	mkdir $(BINDIR)

# target to remove everything
clean:
	-rm -rf $(BUILDDIR)
	-rm -rf $(BINDIR)
	-rm -f *~

