subroutine create(filname, lun)
implicit none

! Delete FILNAM, if it exists, and create a fresh one.
! If FILNAM does not exist, it will will be created.
character(len=*), intent(in) :: filname
character(len=20)           :: filnam
integer, intent(in)  :: lun
logical :: exists

filnam = trim(filname)
inquire(file = filnam,exist=exists)
if (exists) then
        write(6,*)'Deletando ' // trim(filnam)
        call killarq(trim(filnam))
        print *,'Deleted.'
endif

write(6,*)'Creating file ' //trim(filnam)
OPEN (unit = lun, file = filnam, form = 'formatted', status = 'new')
write(6,*)'Created ' // trim(filnam)
end subroutine create

subroutine killarq(nfile)
implicit none
character(len=*), intent(in) :: nfile
integer :: codigo
open ( unit = 99, file = trim(nfile), status = "old", iostat = codigo )
if(codigo == 0) close(unit = 99,status = 'delete')
end subroutine killarq
