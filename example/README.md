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

### Running eceapt
Create a directory containing the "parametros.dat" with the input parameters as described above and `cd` to that directory.
Run `eceapt` and wait for the results.
An example of "parametros.dat" is provided here. 
Edit it as required.

### Output
The program creates two files according the name in line 1: one for the results with extension ".dat"; the other for a copy of the input parameters.
Rerunning the program, these files are quietly deleted.
Other files (g1.dat and g2.dat) are also created and overwritten, useful for debugging.
