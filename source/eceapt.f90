program eceapt
use eceapt_constants
implicit none
include "intface.f90"                                                        ! Interfaces for the subroutines

! Simulations of a linear sweep voltammogram. Mechanism:

! A + e <==> B       (E01, ks1)
! A + B --> C + D   (k)
! C + e <==> E      (E02, ks2)

! Real case: reduction of jatropholone
! D. C. Azevedo, dissertacao de mestrado, UFAl, 1996.

! Copyright 1997-2026 Otavio Luiz Bottecchia (fortran 95)

real :: e01, e02, ks1, ks2, k
real, dimension(0:nxmax) :: ca, cb, cc, cd, ce
real :: estart, efinal, de, dT, H, E_int
real :: itot, e, g1, g2
real :: triangularunitywave
integer :: nx, ciclos, niter, i, j
character (len=20) :: nome
logical :: stack

! Read input values
call indata (niter, estart, efinal, e01, ks1, e02, ks2, k, de, dT, H, E_int, nx, nome, ciclos)

! Initial conditions
ca = 1.                                                                      ! Only A is initialy present (see mechanism above)
cb = 0.
cc = 0.
cd = 0.
ce = 0.

e = estart

! Start calculations
varredura:       do j = 1,ciclos
calculos:        do i = 1, niter
call difrk2(ca, cb, cc, cd, ce, nx, k, dT)                                   ! Let molecules diffuse
g1 = g0func(ca, 5, H)                                                        ! Calculate individual fluxes
g2 = g0func(cc, 5, H)                                                        ! Calculate individual fluxes
itot = g1 + g2                                                               ! Calculate adimentional electrical current at potencial E

call  pl_out_v2(e, estart, efinal, E_int, stack)                             ! Select some points E_int spaced
if (stack) then
           write(1,'(f6.3, f10.5, 5x,2I5)')e, g1                             ! For debug purposes only
           write(2,'(f6.3, f10.5)')e, g2                                     ! For debug purposes only
           write(3,'(f6.3, f10.5)')e, itot                                   ! Desired voltammogram
endif

call bvc0(ca, cb, e01, e, ks1, 1.0, 1.0, H)                                  ! Calcular as concentracoes iniciais do par A e B
call bvc0(cc, ce, e02, e, ks2, 1.0, 1.0, H)                                  ! Calcular as concentracoes iniciais do par C e E

cd(0) = c0func(cd, 5, H, 0.)                                                 ! O gradiente de substancias eletroinativas (D) eh zero

e = (efinal - estart) * triangularunitywave(real(i)/real(niter))  + estart   ! Change potential for the next loop
end do calculos
end do varredura

! Close all files
close(1)
close(2)
close(3)
end program eceapt
