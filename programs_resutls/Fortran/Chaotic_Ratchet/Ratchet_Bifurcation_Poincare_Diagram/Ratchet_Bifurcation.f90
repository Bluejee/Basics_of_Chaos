program Chaotic_Ratchet
    ! RK4 https://i.stack.imgur.com/B8ePj.png
    implicit none
    ! Declare Variables.
    doubleprecision :: t, x, v, b, a, w, x0, delta, dt, da, pi, poincare_a

    ! variables to simplify the region to calculate the bifurcation diagram.
    doubleprecision :: a_initial, a_final, num_divisions

    ! Variable for nth period
    integer :: n

    ! Variables for the RK algorithm
    doubleprecision :: dx1, dx2, dx3, dx4, dv1, dv2, dv3, dv4
    doubleprecision :: dx, dv

    ! Variable for Function
    doubleprecision :: F

    ! Variables for time calculation
    doubleprecision :: t1, t2

    call cpu_time(t1)

    ! Define Initial Parameters.

    b = 0.1
    w = 0.67
    x0 = -0.19
    delta = 1.6
    dt = 0.01
    pi = 4.0 * atan(1.0)

    ! poincare_a defines the a for which the poincare map is to be drawn.
    poincare_a = 0.07430

    ! Variying Parameters
    a_initial = 0.073
    a_final = 0.086
    num_divisions = 200.0

    da = (a_final - a_initial) / num_divisions
    a = a_initial



    ! Open file and write the initial parameters.
    open(100, file = "bifurcation.dat")
    open(101, file = 'Unconfined_Poincare_xv.dat')
    open(102, file = 'tx.dat')
    open(103, file = 'tv.dat')
    open(104, file = 'xv.dat')
    open(105, file = 'bifurcation_x.dat')


    do while (a<a_final)
        ! Showing percentage of completion.
        print *, (100 * (a - a_initial) / (a_final - a_initial))

        ! Reset the initial conditions
        t = 0.0
        x = 0.0 
        v = 0.0
        n = 0
        ! as t = 0 is always the first period(n = 0)
        ! write that in the file
        ! write(100, *)a, v
        ! write(105, *)a, x
        n = n + 1
        do while (t<1300.0 * (2.0 * pi / w))
            ! Calculate the values of the parameters for the next step.
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

            ! for drawing the plots for the given poincare_a
            if (abs(poincare_a - a) < 0.0000001) then
                ! write the values to the file.
                write(102, *)t, x
                write(103, *)t, v
                write(104, *)x, v
            end if

            ! if the time is in period with the driving force,
            ! and the initial unstability has finished (300 Periods)
            ! write the values to the file.
            if (abs(t - (2.0 * n * pi / w)) < dt / 2.0) then
                if (t > 300.0 * (2.0 * pi / w)) then
                    ! Bifurcation Plot
                    write(100, *)a, v
		    write(105, *)a, x
                    ! Unconfined Poincare Plot
                    ! This is not the creation of the phase space plot as the attractor as the x is not confined.
                    ! The creation of attractors would require the confining of the x values between -0.5 and 0.5.
                    ! That is done in another program.

                    if (abs(poincare_a - a) < 0.0000001) then
                        ! write the values to the file.
                        write(101, *)x, v
                    end if

                end if
                ! increase n to detect the next period.
                n = n + 1
            end if
        end do
        a = a + da
    end do

    close(100)
    close(101)
    close(102)
    close(103)
    close(104)

    call cpu_time(t2)
    print *, 'Total Elapsed time ::', t2 - t1

end program Chaotic_Ratchet


doubleprecision function F(t, x, v, a, b, w, x0, delta)
    implicit none
    doubleprecision :: t, x, v, a, b, w, x0, delta, pi
    pi = 4.0 * atan(1.0)

    F = (a * cos(w * t)) - (b * v) + (((2 * cos(2 * pi * (x - x0))) + (cos(4 * pi * (x - x0)))) / (4 * pi * delta))
end function F