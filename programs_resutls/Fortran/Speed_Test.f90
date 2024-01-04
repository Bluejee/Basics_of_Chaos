! Speed Test

! this program detected a bug.
! We can see that the computer cannot have the value 16777217 as a 32 bit real number
! it can have 16777216 and 16777218 but not 16777217 which it rounds of to 16777216
! https://stackoverflow.com/questions/12596695/why-does-a-float-variable-stop-incrementing-at-16777216-in-c

program Physical_Pendulum 
implicit none

real :: c,t1,t2
!integer :: c
print *, huge(c) 
call cpu_time(t1)
c = 1.6E7 - 1
!print *, c
!c = c + 10
print *, c


!do while(c<100)
!    print *, 'c = ',c
!    c = c + 1
!end do

call cpu_time(t2)
print *, c, t1,t2,(t2-t1)

end program Physical_Pendulum 
