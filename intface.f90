interface

subroutine bvc0(a, b, e0, e, k0, d1, d2, h)
implicit none
real, dimension(0:*), intent(inout)  :: a, b
real :: e0, e, k0, d1, d2, h
end subroutine bvc0

subroutine difex(a,b,c,d,e,n,k,dt)
implicit none
real :: a(0:*), b(0:*), c(0:*), d(0:*), e(0:*)
real :: k, dt
integer :: n
end subroutine difex

subroutine difrk2(a,b,c,d,e,n,k,dt)
implicit none
real, dimension(0:*), intent(inout) :: a, b, c, d, e
real, intent(in) :: k, dt
integer, intent(in) :: n
end subroutine difrk2

subroutine indata(niter, es, ef, e01, ks1, e02, ks2,k, de, dt, h, eint, nx, nome, ciclos)
implicit none
real,intent(out) :: es, ef, e01, ks1, e02, ks2, k, de, dt, h, eint
integer,intent(out) :: niter, nx, ciclos
character(len=*),intent(out) ::  nome
end subroutine indata

subroutine create(f,n)
implicit none
character(len=*), intent(in) :: f
integer, intent(in) :: n
end subroutine create

real function g0func(c, n, h)
implicit none
real, dimension(0:*) :: c
integer :: n
real :: h
end function g0func

real function c0func(c, n, h, g)
implicit none
real, dimension(0:*) :: c
real :: h, g
integer :: n
end function c0func

subroutine linearPotentialSweep(e,de,estart,efinal,rampaimpar)
implicit none
real, intent(inout) :: e,de
real, intent(in) :: estart,efinal
logical, intent(inout) :: rampaimpar
end subroutine linearPotentialSweep

subroutine pl_out_v2(e, estart, efinal, E_int, stack)
implicit none
logical, intent(out):: stack
real, intent(in) :: e, estart, efinal, E_int
end subroutine pl_out_v2

end interface
