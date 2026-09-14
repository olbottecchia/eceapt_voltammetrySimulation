subroutine dif(ca, cb, cc, cd, ce, NX, k, dT)
use eceapt_constants
implicit none

! Calcula o perfil de concentracao pelo das especies no mecanismo
! ECE autoprotonacao pelo metodo de Runge-Kutta

real k, dT
real, dimension(0:nxmax), intent(in,out) :: ca, cb, cc, cd, ce
real, dimension(0:nxmax) :: ka1, kb1, kc1, kd1, ke1
real, dimension(0:nxmax) :: ka2, kb2, kc2, kd2, ke2
real :: ca1, ca2, ca3, cb1, cb2, cb3, cc1, cc2, cc3
real :: cd1, cd2, cd3, ce1, ce2, ce3
real :: ka2nv, kb2nv, kc2nv, kd2nv, ke2nv

! Lambda eh colocado como parametro para poder eventualmente
! ser retirado e incluido como parametro da subrotina

integer nx, ix

! Calculo dos Delta1's etc (aqui k1's etc)
ca1=ca(0)
ca2=ca(1)

cb1=cb(0)
cb2=cb(1)

cc1=ca(0)
cc2=ca(1)

cd1=ca(0)
cd2=ca(1)

ce1=ca(0)
ce2=ca(1)


do 10 ix=1,NX
ca3=ca(ix+1)
ka1(ix)=lambda*(ca1-ca2-ca2+ca3)  - k*ca2*cb2*dT
ca1=ca2
ca2=ca3

cb3=cb(ix+1)
kb1(ix)=lambda*(cb1-cb2-cb2+cb3)  - k*ca2*cb2*dT
cb1=cb2
cb2=cb3

cc3=cc(ix+1)
kc1(ix)=lambda*(cc1-cc2-cc2+cc3)  + k*ca2*cb2*dT
cc1=cc2
cc2=cc3

cd3=cd(ix+1)
kd1(ix)=lambda*(cd1-cd2-cd2+cd3)  + k*ca2*cb2*dT
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
ka2nv=lambda*(ca1-ca2-ca2+ca3)
ca(ix)=ca(ix)+ 0.5*(ka1(ix)+ka2nv)
ca1=ca2
ca2=ca3

cb3=cb(ix+1)+kb1(ix+1)
kb2nv=lambda*(cb1-cb2-cb2+cb3)
cb(ix)=cb(ix)+ 0.5*(kb1(ix)+kb2nv)
cb1=cb2
cb2=cb3

cc3=cc(ix+1)+kc1(ix+1)
kc2nv=lambda*(cc1-cc2-cc2+cc3)
cc(ix)=cc(ix)+ 0.5*(kc1(ix)+kc2nv)
cc1=cc2
cc2=cc3

cd3=cd(ix+1)+kd1(ix+1)
kd2nv=lambda*(cd1-cd2-cd2+cd3)
cd(ix)=cd(ix)+ 0.5*(kd1(ix)+kd2nv)
cd1=cd2
cd2=cd3

ce3=ce(ix+1)+ke1(ix+1)
ke2nv=lambda*(ce1-ce2-ce2+ce3)
ce(ix)=ce(ix)+ 0.5*(ke1(ix)+ke2nv)
ce1=ce2
ce2=ce3

20 continue

end




