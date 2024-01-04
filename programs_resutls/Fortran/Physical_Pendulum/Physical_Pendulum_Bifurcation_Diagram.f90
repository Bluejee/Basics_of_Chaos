! Physical Pendulum Program.

program physical_pendulum_bifurcation
    implicit none
    integer :: i, n_period, n
    real :: w, theta, t, l, g, dt, F, Omega, q
    real :: pi, period

    open(100, file = "bifurcation.dat")

    pi = 4.0 * atan(1.0)
    l = 9.8
    g = 9.8
    q = 1.0 / 2.0
    Omega = 2.0 / 3.0
    period = 2.0 * pi / Omega
    n_period = 1200
    dt = period / n_period



    F = 1.35
    do while(F < 1.485)
        w = 0.0
        theta = 0.2
        t = 0.0


        !dt = 0.04

        ! now every n_periodth value generated would be periodic with the period and hence would be periodic
        ! as the driving force. but using n_period doest work as the small addition of the values lost during the conversion
        ! of the real to integer values cause an error, so we use a comparison to find the most closest point to the driving
        ! period.

        i = 1
        n = 1
        do while(t<(600*period))


            if (abs(t - (2 * n * pi / Omega)) < (dt / 2)) then

                if (t > 300*period) write(100, *)F, theta

                n = n + 1
            end if

            ! Using Euler Cromer method to calculate w and theta at next step.
            w = w + (((-g / l) * sin(theta)) - (q * w) + (F * sin(Omega * t))) * dt
            theta = theta + (w * dt)
            t = t + dt
            i = i + 1

            ! Constraining Theta between -pi nd pi.
            if (theta > pi) theta = theta - (2 * pi)
            if (theta < -pi) theta = theta + (2 * pi)

            ! now that we have the phase space plot and the w,theta vs t plot.
            ! we can check for weather the value is in period with the driving force and add it to a poincare file

        end do

        F = F + 0.00005
    end do
    close(100)
end program physical_pendulum_bifurcation
