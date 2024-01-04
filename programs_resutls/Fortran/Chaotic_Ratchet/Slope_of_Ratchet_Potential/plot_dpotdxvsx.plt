## Plot 1
set t png
set o 'xvsdpotdx0.png'

set title 'X vs Dpot/dx'
set xlabel 'X'
set ylabel 'D(V)/dx and V(x)'

# notitle ensures no automatic title is made
plot 'xvsdpotdx0.dat' w lines, 'xvspot.dat' w lines notitle
