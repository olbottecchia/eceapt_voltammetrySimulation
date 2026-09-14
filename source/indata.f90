subroutine indata(niter, estart, efinal, e01, ks1, e02, ks2, k, de, dT, H, E_int, nx, nome, ciclos)
use eceapt_constants
implicit none

real,intent(out) :: estart, efinal, e01, ks1, e02, ks2, k, de, dT, H, E_int
integer, intent(out) :: nx, niter, ciclos
character (len=12), intent(out) :: nome
real :: T

! The input parameters must be in inputpar.txt file or changed in use module.
write(6,*)'Reading initial parameters from file inputpar.txt'
open (unit = 10, file = trim(inputpar),STATUS = 'OLD', FORM = 'FORMATTED')

write(6,*)'Output will be written into the following file: '
read(10,*) nome                                                                  ! The first parameter must be the file name where data will be saved.
write(6,*) nome
if(trim(nome) .eq. inputpar) stop 'This filename is reserved. Choose another name.'
call create(trim(nome) // '.par', 4)
call create('g1.dat',             1)
call create('g2.dat',             2)
call create(trim(nome) // '.dat', 3)
call killarq('fort.10')

write(6,*)'ECEAPT - Simulacao do Voltamograma para Autoprotonacao da Jatrofolona'

read(10,*) niter
write(6,*)'Numero de iteracoes'
write(6,*) niter
write(4,*) niter, ', niter '
if(niter .lt. 0)stop 'Erro: O numero de iteracoes deve ser positivo.'

write(6,*)'Potenciais inicial e final'
read(10,*) estart, efinal
write(6,*) estart, efinal
write(4,*) estart, efinal, ',   estart, efinal'
if (estart .eq. efinal) stop 'Error: This is not a sweep!'

T = ABS(estart-efinal)                                                 ! T eh o tempo adimensional transcorrido na varredura de ida
dT = 1./niter
de = -dT                                                               ! Potential step

!Se lambda for mudado aqui, deve-se mudar tambem em difrk2.for
H = SQRT(dT/lambda)                                                       ! Lambda is hard coded as 0.3
nx = ceiling(6. * SQRT(T) / H) + 1                                        ! Where to stop calculations when the concentration profile is constant.
if (nx .gt. nxmax) STOP "nx eh maior que nxmax. "
write(6,*) 'H = ', H

write(6,*)'Primeiro pico:  E0 e ks'
read(10,*) E01, ks1
write(6,*) E01, ks1
write(4,*) E01, ks1, ', primeira reacao: eo1 e ks1'
if(ks1 .lt. 0.)stop 'Erro: A constante cinetica deve ser positiva.'

write(6,*)'Segundo pico:  E0 e ks'
read(10,*) E02, ks2
write(6,*) E02, ks2
write(4,*) E02, ks2, ', segunda reacao: eo2 e ks2'
if(ks2 .lt. 0.)stop 'Erro: A constante cinetica deve ser positiva.'

write(6,*)'Constante de velocidade de autoprotonacao'
read(10,*) k
write(6,*) k
write(4,*) k, ', constante de velocidade reacao quimica'
if(k .lt. 0.)stop 'Erro: A constante cinetica deve ser positiva.'
if (niter .le. 45.*k) stop " --- Too few iterations for such a high chemical constant ---"
                                                            
write(6,*)'Intervalo de potencial para armazenar dados'
read(10,*) E_int
write(6,*) E_int
write(4,*) E_int, ', intervalo de potencial p/ gravar dados '
if(E_int .lt. 0.)stop 'Erro: O intervalo E_int deve ser positivo.'

write(6,*)'Numero de ciclos (p/ ida e volta: entre dois)'
read(10,*) ciclos
write(6,*) ciclos
if(ciclos .lt. 1)stop 'Erro: Deve haver mais de um ciclo.'
close(10)

write(4,*) T, ', T tempo adimensional para a varredura de ida'
write(4,*) dT, ', dT'
write(4,*) H, ', H = SQRT(dT/0.45)'
write(4,*) nx, ', nx = 6. * SQRT(T) / H + 1'

close(4)
end
