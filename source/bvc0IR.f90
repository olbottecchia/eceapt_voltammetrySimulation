include "intface.f90"

subroutine bvc0ir(c, e0, e, k0, d, H)
! Dada uma reacao Ox + e --> Red  irreversivel
! e seus parametros eletroquimicos
! Calcula a concentracao superficial de ox e de red no potencial E.
! Note que foi escrita para um eletron.
implicit none
real :: c(0:*)
real :: e0, e, k0, h, d, alpha
real :: coef0, one_0(10), exp3
real :: c0func, g0func
integer :: cinco
parameter (alpha=0.5)
data one_0/1., 9*0./ cinco/5/
coef0 = g0func(one_0, cinco, h)

exp3 = exp( -alpha*38.92 * (e-e0) )

            c(0) = 0.
            c(0) = g0func(c,cinco,h) / (k0*exp3/d -coef0)
end
!            g3 = c(0)*k0*exp3/d
