function Periodic_theta = Bifurcation_Parallel(F)
  w = [0];
  theta = [0.2];
  t = [0];
  l = 9.8;
  g = 9.8;
  dt = 3*pi/600; # i.e. every 600th value would be 1 driver period 
  Omega = 2/3;
  q = 1/2;
  
  i = 1;
  # We have to make sure that the computed values of t contains information 
  # atleast upto the 400th period value. i.e. till t = 2*400*pi/Omega.
  while t(i)<= (2*400*pi/Omega) + 1 # Plus 1 just to be on the safe side :P LOL
    w(i+1) = w(i)+(((-g/l).*sin(theta(i)) - q.*w(i) + F .* sin(Omega .* t(i))).*dt);
    theta(i+1) = theta(i) + (w(i+1).*dt);
    
    t(i+1) = t(i) + dt;
    if theta(i+1) > pi
      theta(i+1) -= 2*pi;
    endif
    
    if theta(i+1) < -pi
      theta(i+1) += 2*pi;
    endif
    i += 1;
  endwhile
  
  # Now we have a list of theta and t for the corresponding F
  # We now use the algorythem similer to that in poincare map to select points,
  # From 300th to 400th time period.
  # we can select values at multiples of 600
  n = 1;
  for j = (300*601):600:i
    Periodic_theta(n) = theta(j);
    n += 1;
  endfor
  Periodic_theta = Periodic_theta';
endfunction