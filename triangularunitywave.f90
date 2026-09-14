pure function triangularunitywave(t)
implicit none
real, intent(in)  :: t
real :: triangularunitywave

! Esta funcao gera uma onda triangular com amplitude 1 e frequencia unitaria
! Inicia em {0,0}, sobre ateh {0,5;1}, e decresce novamente até {0;0}.
! A funcao eh : f(t) = 2 * (t/p - floor(t/p -t/p+0.5)
! Floor(x) é o maior inteiro menor ou igual a x.
! https://en.wikipedia.org/wiki/Triangle_wave
! Copyright 2026 Otavio L. Bottecchia

triangularunitywave =   2. * abs( t - floor(t + 0.5)) ! So vale no intervalo entre zero e um

end function triangularunitywave
