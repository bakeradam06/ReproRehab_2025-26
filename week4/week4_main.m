% week4 main

% Waves

%% 1.	Create a time variable that starts at 0 and ends at 2*pi
        % a. use whatever granularity you want
tiempo = [0:0.1:2*pi];

%% 2.	Create a sine wave variable
sign = sin(tiempo);

%% 3.	Create an animation of the sine wave over time 
    % a.	You should see the wave get created
figure
p = animatedline;
drawnow % if you uncomment this, it won't precompute and will be slower. goes with comments below

for i = 1:length(tiempo)
    addpoints(p,tiempo(i),sign(i));
    drawnow limitrate % cahnge to update if want slow version
    pause(0.15); % pause for a brief moment between frames
    % b.	Save as .gif
    exportgraphics(gcf,'sine.gif',"Append", true)
end
drawnow % comment out for non-precompute

% help from:
% PrecomputeDataThenCreateAnimationExample.m
% UseDrawnowUpdateForFastAnimationExample.m 
% ExportgraphicsAnimatedGifExample.m

%% 4.	Create a cosine wave variable
    tiempo2 = 0:0.1:2*pi; 
    cos1 = cos(tiempo2);

% 5.	Create an animation of the cosine wave over time 
        figure
        p2 = animatedline;
        drawnow % if you uncomment this, it won't precompute and will be slower. goes with comments below
        
        for i = 1:length(tiempo2)
            addpoints(p2,tiempo2(i),cos1(i));
            drawnow limitrate % cahnge to update if want slow version
            pause(0.15); % pause for a brief moment between frames
            % b.	Save as .gif
            exportgraphics(gcf,'cosine.gif',"Append", true)
        end
        drawnow

%% 6.	Create a figure with 2 subplots
    % a.	Sine wave and Cosine wave over time
        tiempo = 0:0.1:2*pi; 
        tiempo2 = 0:0.1:2*pi; % make same length
        sin2 = sin(tiempo);
        cos2 = cos(tiempo2);

    % b.	Sine (x) and cosine (y) waves together
        tiledlayout(1,2);    
        nexttile
        plot(sin2);
        nexttile
        plot(cos2);

    % ref: TiledLayout2By2Example.mlx to remind myself how tiledlayout works

%% Extra Credit
% Create a 3D Spiral

% 1.	Create a time variable from 1 to 1000
        time = 1:6:1000;
% 2.	Create an x variable that is a sine wave across time
        x = sin(time);
% 3.	Create an y variable that is a sine wave across time
        y = sin(time-16); % changed the phase from x so they're not the same data points
% 4.	Animate  X (on x axis),Y (on y axis), and Time (on z axis) on the same figure to produce a 3D spiral
        figure
        p3 = animatedline('Marker','o');
        
        view(3) % ai helped me debug the code i wrote. I was missing this command and getting only 2d plots.
        drawnow
        for i=1:length(time)
            addpoints(p3,x(i),y(i),time(i))
            drawnow limitrate
            pause(0.0000001);
            exportgraphics(gcf,'3Dspiral.gif');
        end

