! include "intface.for"
subroutine difex(ca, cb, cc, cd, ce, NX, k, dT)
use eceapt_constants
implicit none

! Calcula o perfil de concentracao pelo das especies no mecanismo
! ECE autoprotonacao pelo metodo da diferenca finita explicita
integer nxmax
real lambda
parameter (lambda=0.45, nxmax=1000)
real k, dT
real ca(0:*), cb(0:*), cc(0:*), cd(0:*), ce(0:*)
real ka1(0:nxmax), kb1(0:nxmax), kc1(0:nxmax), kd1(0:nxmax), ke1(0:nxmax)
real ca1, ca2, ca3, cb1, cb2, cb3, cc1, cc2, cc3
real cd1, cd2, cd3, ce1, ce2, ce3
integer nx, ix

! Lambda eh colocado como parametro para poder eventualmente
! ser retirado e incluido como parametro da subrotina

! Calculo dos Delta1s etc (aqui k1s etc)
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

do 20 ix=1, NX
ca(ix)=ca(ix)+ka1(ix)
cb(ix)=cb(ix)+kb1(ix)
cc(ix)=cc(ix)+kc1(ix)
cd(ix)=cd(ix)+kd1(ix)
ce(ix)=ce(ix)+ke1(ix)
20 continue

end




