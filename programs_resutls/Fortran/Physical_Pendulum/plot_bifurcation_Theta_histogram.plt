## Plot 1
set t png
set o 'Result_Images/bifurcation_DP_300to1300_1-35to1-485.png'

set title 'Bifurcation Diagram(DP) 300 - 1300'
set xlabel 'Fd'
set ylabel 'Theta'

# in our data, we have 2 columns, so we find the statistics
# for the data using the stats program in gnuplot
# and store it in the variable Data

# Use help stats in gnuplot to read documentation.

stats 'bifurcation_DP_300to1300_1-35to1-485.dat' name "Data"

# setting bin width
bin_width = 0.01



# notitle ensures no automatic title is made
# plot 'bifurcation_DP_300to1300_1-35to1-485.dat' w dots notitle


