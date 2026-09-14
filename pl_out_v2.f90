subroutine pl_out_v2(e, estart, efinal, E_int, stack)
implicit none

! Seleciona um número, x, em uma sequência, tal que seja proximo de um multiplo de E_int.

logical, intent(out):: stack
real, intent(in) :: e, estart, efinal, E_int
real :: x

if (abs(abs(e)-abs(estart)) .lt. abs(E_int/2.)) then          ! It is the first point.
   stack = .true.
   return
else
   if (abs(abs(e) - abs(efinal)) .lt. abs(E_int/2.)) then     ! It is the last point in that sweep.
   stack = .true.
   return
   else                                                    ! It's not the first nor the last.
      x = mod(abs(e - estart),E_int)
      if( x .le. E_int/10.) then                           ! Is it multiple of E_int?
         stack = .true.
         return
   else
         stack = .false.                                   ! Forget this point.
         return
      endif
   endif
endif
stop 'Erro: Caso nao previsto'                             ! Wtf? It is impossible to get here.
end subroutine pl_out_v2
