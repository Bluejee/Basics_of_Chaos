## Plot 1
set t png
set o 'Ratchet_Potential_Graph.png'

set title 'Ratchet Potential'
set xlabel 'x'
set ylabel 'V(x)'

# notitle ensures no automatic title is made
plot 'Ratchet_Potential_Data.dat' w dots notitle
