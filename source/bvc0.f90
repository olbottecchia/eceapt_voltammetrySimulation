subroutine bvc0(c1, c2, e0, e, k0, d1, d2, H)
use eceapt_constants, only: alfa, one_0
implicit none

! Dados os perfis de concentraçÆo de c1 e de c2 (vetores),
! Calcula as concentrações superficiais
! c1(0) and c2(0) num dado potencial E
! se forem dados o potencial-padrÆo e0 e a constante de velocidade.

real, dimension(0:*), intent(inout) :: c1, c2
real, intent(in) :: e, e0, k0, d1, d2, h
real :: g0func
real :: beta, gama, delta, sigox, sigred
real :: alphaa, coef0, exp1, exp2

coef0 = g0func(one_0, 5, H)
exp1 = exp(-alfa*38.92 * (e-e0) )
exp2 = exp( (1.-alfa)*38.92 * (e-e0) )
alphaa = k0/d1 * exp1 - coef0
beta = -k0/d1 * exp2
gama = k0*exp1/d2
delta = -(k0 * exp2/d2 - coef0)
c1(0) = 0.
c2(0) = 0.
sigox = g0func(c1, 5, H)
sigred =-g0func(c2, 5, H)
c2(0) = (sigox/alphaa-sigred/gama)/(beta/alphaa-delta/gama)
c1(0) = (sigred-delta*c2(0))/gama
end


