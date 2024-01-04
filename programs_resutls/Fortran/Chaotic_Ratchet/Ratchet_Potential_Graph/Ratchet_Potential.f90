! Ratchet potential visualisation.

program ratchet_potential
    implicit none

    REAL(8) :: v, x, x0, del, pi, dx, C

    pi = 4.0d0 * atan(1.0)
    x0 = -0.19d0
    C = 0.0173d0
    x = -2.0d0
    dx = 0.0001d0
    del = sin(2 * pi * abs(x0)) + sin(4 * pi * abs(x0))
    print *, del

    open(100, file = "Ratchet_Potential_Data.dat")

    do while(x<2)
        v = C - ((sin(2 * pi * (x - x0)) + (0.25 * sin(4 * pi * (x - x0)))) / (4 * (pi**2) * del))
        write(100, *)x, v
        x = x + dx
    end do

    close(100)
end program ratchet_potential