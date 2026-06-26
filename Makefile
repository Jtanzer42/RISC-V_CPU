COMPILER = iverilog
FLAGS = -g2012
OUTPUT = cpu_sim.vvp
WAVE_FILE = cpu_waves.vcd

SOURCES = $(wildcard *.sv)

all: compile run

compile:
	$(COMPILER) $(FLAGS) -o $(OUTPUT) $(SOURCES)

run:
	vvp $(OUTPUT) 

wave:
	gtkwave $(WAVE_FILE) &

clean:
	rm -f $(OUTPUT) $(WAVE_FILE)

