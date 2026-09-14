subroutine difrk2(ca, cb, cc, cd, ce, NX, k, dT)
use eceapt_constants, only: lambda, nxmax
implicit none

! Calcula o perfil de concentracao pelo das especies no mecanismo
! ECE autoprotonacao pelo metodo de Runge-Kutta

real, dimension(0:nxmax), intent(inout) :: ca, cb, cc, cd, ce
real, dimension(0:nxmax) :: ka1, kb1, kc1, kd1, ke1
real :: ca1, ca2, ca3, cb1, cb2, cb3, cc1, cc2, cc3
real :: cd1, cd2, cd3, ce1, ce2, ce3
real :: ka2, kb2, kc2, kd2, ke2
real, intent(in) :: k, dT
real :: kdT
integer, intent(in) :: NX
integer :: ix

! Lambda eh colocado como parametro para poder eventualmente
! ser retirado e incluido como parametro da subrotina

! Calculo dos Delta1's etc (aqui k1's etc)
kdT=k*dT

ca1=ca(0)
ca2=ca(1)

cb1=cb(0)
cb2=cb(1)

cc1=cc(0)
cc2=cc(1)

cd1=cd(0)
cd2=cd(1)

ce1=ce(0)
ce2=ce(1)


do 10 ix=1,NX
ca3=ca(ix+1)
ka1(ix)=lambda*(ca1-ca2-ca2+ca3)  - ca2*cb2*kdT
ca1=ca2
ca2=ca3

cb3=cb(ix+1)
kb1(ix)=lambda*(cb1-cb2-cb2+cb3)  - ca2*cb2*kdT
cb1=cb2
cb2=cb3

cc3=cc(ix+1)
kc1(ix)=lambda*(cc1-cc2-cc2+cc3)  + ca2*cb2*kdT
cc1=cc2
cc2=cc3

cd3=cd(ix+1)
kd1(ix)=lambda*(cd1-cd2-cd2+cd3)  + ca2*cb2*kdT
cd1=cd2
cd2=cd3

ce3=ce(ix+1)
ke1(ix)=lambda*(ce1-ce2-ce2+ce3)
ce1=ce2
ce2=ce3

10 continue

! Calculo dos delta2's etc (aqui ka2's etc)
! Comparar com exemplo do Dieter (p. 78)
ca1=ca(0)
ca2=ca(1) + ka1(1)

cb1=cb(0)
cb2=cb(1) + kb1(1)

cc1=cc(0)
cc2=cc(1) + kc1(1)

cd1=cd(0)
cd2=cd(1) + kd1(1)

ce1=ce(0)
ce2=ce(1) + ke1(1)

do 20 ix=1, NX

ca3=ca(ix+1)+ka1(ix+1)
ka2=lambda*(ca1-ca2-ca2+ca3)
ca(ix)=ca(ix)+ 0.5*(ka1(ix)+ka2)
ca1=ca2
ca2=ca3

cb3=cb(ix+1)+kb1(ix+1)
kb2=lambda*(cb1-cb2-cb2+cb3)
cb(ix)=cb(ix)+ 0.5*(kb1(ix)+kb2)
cb1=cb2
cb2=cb3

cc3=cc(ix+1)+kc1(ix+1)
kc2=lambda*(cc1-cc2-cc2+cc3)
cc(ix)=cc(ix)+ 0.5*(kc1(ix)+kc2)
cc1=cc2
cc2=cc3

cd3=cd(ix+1)+kd1(ix+1)
kd2=lambda*(cd1-cd2-cd2+cd3)
cd(ix)=cd(ix)+ 0.5*(kd1(ix)+kd2)
cd1=cd2
cd2=cd3

ce3=ce(ix+1)+ke1(ix+1)
ke2=lambda*(ce1-ce2-ce2+ce3)
ce(ix)=ce(ix)+ 0.5*(ke1(ix)+ke2)
ce1=ce2
ce2=ce3

20 continue
end

