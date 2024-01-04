program main
implicit none
integer, parameter :: DP=8
real(DP) :: x, y, v, w, omega, t, t1, t2
real(DP) :: pi, theta, q, period, Fd, h
integer :: i, j, k, nperiod



q=0.5d0
omega=2.0d0/3.0d0

pi=4.0d0*atan(1.0d0)
period=(2.0d0*pi/omega)
h=period/1200.0d0
nperiod=nint(period/h)

Fd=1.35d0

open(123,file="bd.dat")
open(100,file="traj.dat")

call cpu_time(t1)

do while (  Fd .lt. 1.485d0 )

   w=0.0d0
   theta=0.2d0
   i=0
   t=0.0d0
do while ( t .lt. (600.0d0*period)+h )

   w = w - ( sin(theta) + q*w - Fd* sin(omega*t) )*h
   theta = theta + w*h

   if(Fd.lt.1.350001d0) then
      write(100,*)t,theta
   end if
   if ( t.gt. 300.0d0*period .and. mod(i,nperiod).eq.0 ) then
     write(123,*)Fd,theta
   end if

   if(theta.gt. pi) theta=theta-2.0d0*pi
   if(theta.lt. -pi) theta=theta+2.0d0*pi
   t=t+h
   i=i+1
end do

Fd=Fd+0.00005d0

end do

close(123)
close(100)

call cpu_time(t2)

print *,t1,t2, t2-t1

end program
  
