function Animate_Pendulum(l,x,y,t,dt)
  # Setting the default graph as not visible to avoid loss of time while displaying the graphs.
  set(0, 'defaultfigurevisible', 'off');
  hold off;
  close;
  

## Plotting initial points
  hold on;
  bob = plot(x(1),y(1),'r.','markersize',20);
  path = plot(x(1),y(1),'g','markersize',10);
  string_bob = plot([0,x(1)],[0,y(1)],'b');
  limit = l+5
  xlim([-limit,limit])
  ylim([-limit,limit])
  axis('square')
  legend('Bob','Path','String');
  title('Motion of the Pendulum(Time not to scale)');

  sim_len = length(x)

  i = 1;
  anim_len = 10;
  total_frame = 24*anim_len;
  frame = 1;

  while i <sim_len
    ## Updating position on graph
      set (bob,'XData',x(i),'YData',y(i)); 
      set (path,'XData',x([1:i]),'YData',y([1:i]));
      set (string_bob,'XData',[0,x(i)],'YData',[0,y(i)]);
      
      # mkdir(strcat('Sims\Frame_Images\',sim_name));
      # fname = sprintf ("Sims\\Frame_Images\\%s\\%s_Img%i.png",sim_name,sim_name,frame);
      # print -dpng fname
      # These are in case we want a folder with all the frames
      img = print ('-RGBImage');
      animation_name = sprintf("Animations\\Physical_Pendulum_Animation.gif");
      imwrite(img, animation_name, 'DelayTime', .05, 'Compression', 'bzip', 'WriteMode', 'Append');  
      
      frame += 1;
      i += round(sim_len/(24*anim_len));
      ## Displaying a waitbar to show progress.
      if frame/total_frame <= 1 
        h = waitbar(frame/total_frame);
        set(h,'visible','on') # To display the waitbar as by we set default figures off.
        msg = sprintf("Pendulum Animation :: %d%\% ",round(100 * frame/total_frame));
        waitbar(frame/total_frame,h,msg);
      endif

  endwhile
  close(h);
  close all;
  set(0, 'defaultfigurevisible', 'on');
endfunction