program Chaotic_Ratchet
    ! RK4 https://i.stack.imgur.com/B8ePj.png
    implicit none
    ! Declare Variables.
    doubleprecision :: t, x, v, b, a, w, x0, delta, dt

    ! Variables for the RK algorithm
    doubleprecision :: dx1, dx2, dx3, dx4, dv1, dv2, dv3, dv4
    doubleprecision :: dx, dv

    ! Variable for Function
    doubleprecision :: F


    ! Define Initial Parameters.
    t = 0.0
    x = 0.0
    v = 0.0
    b = 0.1
    w = 0.67
    x0 = -0.19
    delta = 1.6
    dt = 0.001

    ! Variying Parameters
    a = 0.0805
    ! a = 0.074
    ! a = 0.081
    ! Open file and write the initial parameters.
    open(100, file = "x_vs_t.dat")
    write(100, *)t, x

    open(101, file = "v_vs_t.dat")
    write(101, *)t, v

    open(102, file = "v_vs_x.dat")
    write(102, *)x, v

    ! Start loop to work till the required time.

    do while (t<3000.0)
        ! calculate the values of x and t for the next step.

        dx1 = dt * (v)
        dv1 = dt * F(t, x, v, a, b, w, x0, delta)

        dx2 = dt * (v + (dv1 / 2.0))
        dv2 = dt * F((t + (dt / 2.0)), (x + (dx1 / 2.0)), (v + (dv1 / 2.0)), a, b, w, x0, delta)

        dx3 = dt * (v + (dv2 / 2.0))
        dv3 = dt * F((t + (dt / 2.0)), (x + (dx2 / 2.0)), (v + (dv2 / 2.0)), a, b, w, x0, delta)

        dx4 = dt * (v + dv3)
        dv4 = dt * F((t + dt), (x + dx3), (v + dv3), a, b, w, x0, delta)

        dx = (dx1 + (2.0 * dx2) + (2.0 * dx3) + dx4) / 6.0
        dv = (dv1 + (2.0 * dv2) + (2.0 * dv3) + dv4) / 6.0

        x = x + dx
        v = v + dv
        t = t + dt

        ! write the values to the file.
        write(100, *)t, x
        write(101, *)t, v
        write(102, *)x, v
    end do

end program Chaotic_Ratchet


doubleprecision function F(t, x, v, a, b, w, x0, delta)
    implicit none
    doubleprecision :: t, x, v, a, b, w, x0, delta, pi
    pi = 4.0 * atan(1.0)

    F = (a* cos(w*t)) - (b*v) + (((2*cos(2*pi*(x-x0)))+(cos(4*pi*(x-x0))))/(4*pi*delta))
end function F