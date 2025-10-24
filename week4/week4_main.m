% week4 main

% Waves

%% 1.	Create a time variable that starts at 0 and ends at 2*pi
        % a. use whatever granularity you want
tiempo = [0:0.01:2*pi];

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
    pause(0.5); % pause for a brief moment between frames
    % b.	Save as .gif
    exportgraphics(gcf,'sine.gif',"Append", true)
end
drawnow % comment out for non-precompute

% 
% fig = gcf;
% 
% exportgraphics(fig,'sine.gif','Append', true,'Resolution',600)


% help from:
% PrecomputeDataThenCreateAnimationExample.m
% UseDrawnowUpdateForFastAnimationExample.m 
% ExportgraphicsAnimatedGifExample.m

%% 4.	Create a cosine wave variable

% 5.	Create an animation of the cosine wave over time 
    % a.	Save .gif

% 6.	Create a figure with 2 subplots
    % a.	Sine wave and Cosine wave over time
    % b.	Sine (x) and cosine (y) waves together


% Extra Credit
% Create a 3D Spiral

% 1.	Create a time variable from 1 to 1000

% 2.	Create an x variable that is a sine wave across time

% 3.	Create an y variable that is a sine wave across time

% 4.	Animate  X (on x axis),Y (on y axis), and Time (on z axis) on the same figure to produce a 3D spiral (see examples below)


