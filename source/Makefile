# This is to compile eceapt
# The fortran module must be compiled first.
# If "make" is used with "-j" option, it may not find the eceapt_constants_mod file.
# You can either run "make" again, despite the error message or compile it separately:
# gfortran -c eceapt_constants_mod.f90
# Then the "Makefile" should work.

# If you choose "make install", the eceapt executable will be copied to the already existing "bin"" directory in $HOME.

CC = "/usr/bin/gfortran"
FFLAGS = -c -O2 -std=f95 -ffree-form -fcheck=bounds -Werror=line-truncation -Wall

eceapt: eceapt.o indata.o bvc0.o difrk2.o dlib.o create.o eceapt_constants_mod.o triangularunitywave.o pl_out_v2.o
	$(CC) -o eceapt eceapt_constants_mod.o indata.o bvc0.o dlib.o create.o difrk2.o eceapt.o triangularunitywave.o pl_out_v2.o

eceapt_constants_mod.o: eceapt_constants_mod.f90
	$(CC) $(FFLAGS) eceapt_constants_mod.f90

eceapt.o: eceapt.f90 eceapt_constants_mod.f90
	$(CC) $(FFLAGS) eceapt_constants_mod.f90 eceapt.f90

difex.o: difex.f90 # Não depende de nxmax
	$(CC) $(FFLAGS) difex.f90

bvc0.o: bvc0.f90
	$(CC) $(FFLAGS) bvc0.f90

create.o: create.f90
	$(CC) $(FFLAGS) create.f90

dlib.o: dlib.f90
	$(CC) $(FFLAGS) dlib.f90

indata.o: indata.f90
	$(CC) $(FFLAGS) indata.f90

difrk2.o: difrk2.f90
	$(CC) $(FFLAGS) difrk2.f90

triangularunitywave.o: triangularunitywave.f90
	$(CC) $(FFLAGS) triangularunitywave.f90

pl_out_v2.o: pl_out_v2.f90
	$(CC) $(FFLAGS) pl_out_v2.f90

clean:
	rm *.o eceapt_constants.mod

install:
	cp -ai eceapt $HOME/bin
