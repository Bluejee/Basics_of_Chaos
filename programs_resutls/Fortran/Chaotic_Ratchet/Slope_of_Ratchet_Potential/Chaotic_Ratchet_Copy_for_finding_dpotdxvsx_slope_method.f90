! Chaotic_Ratchet Program.

! Runge kutta 4th order
! For differential equations with dy/dx = f(x,y)
! y{i+1} = yi + (Phi)h
! where Phi = {1/6}(k1 + 2k2 + 2k3 + k4)
! k1 = f(xi,yi)
! k2 = f((xi+0.5hyi),(0.5k1h))
! k3 = f((xi+0.5hyi),(0.5k2h))
! k4 = f((xi+hyi),(k3h))
! if Phi = f(x,y) then it is first orfer Runge kutta also called Eulers method

program chaotic_ratchet
    implicit none
    REAL(16) :: pot, f
    REAL(16) :: x0, v0, t, phi
    REAL(16) :: xi, vi, dpotdx0, dpotdxi, dt, dx
    REAL(16) :: k1, k2, k3, k4

    x0 = 0.0
    v0 = 0.0
    t = 0.0
    dpotdx0 = 0.0
    dt = 0.0005
    dx = 0.0005
    open(100, file = "xvsdpotdx0.dat")
    open(101, file = "xvspot.dat")

    do while (x0 < 10)
        ! Here phi represents the slope which is calculated according to the method.
        k1 = f(t, v0, dpotdx0)
        k2 = f((t + (0.5 * dt * v0)), (0.5 * k1 * dt), dpotdx0)
        k3 = f((t + (0.5 * dt * v0)), (0.5 * k2 * dt), dpotdx0)
        k4 = f((t + (dt * v0)), (k3 * dt), dpotdx0)
        Phi = (k1 + (2 * k2) + (2 * k3) + k4) / 6


        ! if Phi = f(x,y) then it is first orfer Runge kutta also called Eulers method

        vi = v0 + phi * dt
        xi = x0 + (vi * dt)
        t = t + dt

        ! Now we calculate the dpotdx for the next step
        dpotdxi = (pot(xi + dx) - pot(xi)) / (dx)

        ! Now we Store the new values into the file
        write(101, *)x0, pot(x0)
        write(100, *)x0, (dpotdx0)

        ! now we update the 0s by replacing them with the ones.
        x0 = xi
        v0 = xi
        dpotdx0 = dpotdxi
    end do
    close(101)
    close(100)
end program chaotic_ratchet


REAL(16) FUNCTION pot (x)
    implicit none

    REAL(16), INTENT(IN) :: x
    REAL(16) :: x0, del, pi, dx, C

    pi = 4.0 * atan(1.0)
    x0 = -0.19
    C = 0.0173
    del = sin(2.0 * pi * abs(x0)) + sin(4.0 * pi * abs(x0))

    pot = C - ((sin(2.0 * pi * (x - x0)) + (0.25 * sin(4.0 * pi * (x - x0)))) / (4.0 * (pi**2.0) * del))

END FUNCTION pot

Real(16) FUNCTION f(t, v0, dpotdx0)
    implicit none
    REAL(16), INTENT(IN) :: t, v0, dpotdx0
    REAL(16) :: a, b, w
    a = 0.08092844
    b = 0.1
    w = 0.67

    f = ((-b * v0) - (dpotdx0) + (a * cos(w * t)))

END FUNCTION f