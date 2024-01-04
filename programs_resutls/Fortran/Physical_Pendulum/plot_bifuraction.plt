## Plot 1
set t png
set o 'Result_Images/bifurcation_DP_300to1300_0-0to1-35.png'

set title 'Bifurcation Diagram(DP) 300 - 1300'
set xlabel 'Fd'
set ylabel 'Theta'

# notitle ensures no automatic title is made
plot 'bifurcation_DP_300to1300_1-35to1-485.dat' w dots notitle
