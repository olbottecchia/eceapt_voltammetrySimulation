module eceapt_constants
implicit none

integer, parameter :: nxmax = 1300                                           ! Maximal number of elements of concentration profile
real, parameter :: lambda = 0.3
character(len=14), parameter :: inputpar = 'parametros.dat'                            ! File name (without the .txt suffix) where the input parameters are to be found.
real, parameter :: alfa = 0.5
real, parameter, dimension(10) :: one_0 = (/1., 0.,0.,0.,0.,0.,0.,0.,0.,0./)
end module eceapt_constants
