## Plot 1
set t png
set o 'Result_Images/w_vs_t.png'

set title 'w vs t'
set xlabel 't'
set ylabel 'w'

# notitle ensures no automatic title is made
plot 'w_t.dat' w lines notitle

## Plot 2
set t png
set o 'Result_Images/theta_vs_t.png'
set title 'Theta vs t'
set xlabel 't'
set ylabel 'Theta'
plot 'Theta_t.dat' w lines notitle

## Plot 3
set t png
set o 'Result_Images/phase_space.png'
set title 'Phase-Space Plot'
set xlabel 'Theta'
set ylabel 'w'
plot 'w_theta.dat' w dots notitle


## Plot 4
set o 'Result_Images/poincare_map.png'
set title 'Poincare Map'
set xlabel 'Theta'
set ylabel 'w'
plot 'poincare_map.dat' w dots notitle
