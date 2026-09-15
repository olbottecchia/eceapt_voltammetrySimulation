# eceapt_voltammetrySimulation
Simulation of a cyclic voltammogram is carried out by solving a system of differential equations based on the Runge-Kutta method. It uses concepts described by Britz, "Digital Simulations in Electrochemistry", ISBN 0-387-18979-3. The mechanism is the autoprotonation (see below).

### eceapt
The program simulates a voltammogram. It is a current-potential curve of some electroactive species using a stationary electrode in the presence of an inert electrolite to exclude eletrostatic effects, so that only diffusion is important. It takes into account the generic electrochemical mechanism. See chapter 6 of MacDonald, "Transient Techniques in Electrochemistry", ISBN 0-306-31010-4.

The description of the self-protonation mechanism can be found in the electrochemical reduction of Jatropholone", Azevedo, Boodts, Cavalcanti, Santana, Santos, Bento, Tonholo and Goulart, Journal of Electroanalytical Chemistry, 14 May 1999, pages: 99-106, Volume 466, Issue 1, doi 10.1016/S0022-0728(99)00133-3:
The name "eceapt" comes from the sequence of electrochemical, chemical and electrochemical reactions; "apt" is an abridged form for autoprotonation.

### Electrochemical mechanism
The autoprotonation is a special case of ECE electrochemical reaction, since the intermediate B, reacts chemically with the reactant.
One product of the chemical step, C, is also electroactive, which produces the final product, E.

A + e <==> B 

A + B --> C + D

C + e <==> E 

### Input parameters
The program reads from a file named "parametros.dat" in the current directory the necessary input parameters, namely:

line 1:
file name for saving the results (string)

line 2:
number of iterations (integer)

line 3:
Initial potential and final potential in volts, separated by comma (both real)

line 4:
Standard reduction electrode potential (volt) for the first electrochemical (A + e <==> B) reaction and the corresponding adimensional heterogeneous kinetic constant, separated by comma (both real) 

line 5:
Standard reduction electrode potential (volt) for the second electrochemical (C + e <==> E) reaction and the corresponding adimensional heterogeneous kinetic constant, separated by comma (both real) 

line 6:
Kinetic adimensional kinetic constant for the chemical reaction (A + B --> C + D)

line 7
Potential interval to save the data (real)

line 8:
Number of  sweeps (integer). For a conventional cyclic voltammogram, set it to 2 (forward sweep and backward sweep).

### Output
The program creates two files according the name in line 1: one for the results with extension ".dat"; the other for a copy of the input parameters.
Rerunning the program, these files are quietly deleted.
Other files (g1.dat and g2.dat) are also created and overwritten, useful for debugging.

### How to compile
Change directory, `cd source`, where all the source files are, including the module file and the Makefile.
Run `make` without arguments to compile.
The executable named "ecept" is created.
Running `make install` will copy "eceapt" to $HOME/bin. Make sure that the sub-directory exists.
Running `make clean` will delete all object files and the "eceapt_constants.mod" file. The executable, "eceapt", is not deleted.


### Known problems during compilation
The fortran module must be compiled first. 
If `make` is used with "-j" option, it may not find the "eceapt_constants_mod" file. 
You can either run `make` again, despite the error message or compile it separately:
`gfortran -c eceapt_constants_mod.f90`
Then the `make` should work.

### Running eceapt
Create a directory containing the "parametros.dat" with the input parameters as described above and `cd` to that directory.
Run `eceapt` and wait for the results.
An example of "parametros.dat" is provided here. 
Edit it as required.
