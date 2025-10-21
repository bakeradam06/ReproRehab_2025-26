% week 3

 
%% gen control data
% Create a variable called "Control" and set to 10 random values uniformly distributed between 0 and 3 
% ab: used help from Random Numbers Within Specified Interval.mlx matlab file
a = 0; % lower bound
b = 3; % upper bound 
n = 10; 
control = a + (b-a).*rand(n,1); % add lower bound + range and multiply every value in rand() by this value
%% gen experimental data
% Create another variable called "Experimental" and set to 10 random values uniformly distributed between 5 and 9
a = 5;
b = 9;
n = 10;
experimental = a + (b-a).*rand(n,1); % same thing as above, just different range of values

%% Visualize
% Create a plot to visualize the comparison between "Control" and "Experimental" groups
figure
f = violin(control,'facecolor',[0.5,0.5,0.9]);
hold on
d = violin(experimental,'facecolor',[0.9,0.5,0.5]);
%%

% combine both datsets into one matrix 
data = [control,experimental]; % 10x2 array returned
avgControl = mean(control);
avgExperimental = mean(experimental);

dataAvg = [avgControl,avgExperimental];

%%
figure
e = bar(dataAvg,'green'); % note: had some help from chatGPT with below next few lines. 
e.FaceColor = 'flat';  % allow setting individual bar colors
e.CData = [1 0 0; 0 0 1];  % red & blue

%%

xlabel 'shift in data to compare the two'
ylabel 'outcome value'
xlim manual
ylim([-4 12]) % adjust ylim to more easily read figure

% Add labels to x ticks (Control and Experimental)
xticks auto

% Add a title
title 'outcome avg stratified by group allocation (control, experimental)'

% Remove axis lines on top and right side
ax = gca;
ax.GridLineStyle = ':';

% Set x and y label text size to 28
xlabel('frequency','FontSize',28,'FontName','CMU Serif')
ylabel('outcome occurrence','FontSize',28,'FontName','CMU Serif')

% Set x and y tick text size to 12

ax.XAxis.FontSize = 12;
ax.YAxis.FontSize = 12;

% Set title text size to 30
title('occurrence of avg stratified by group allocation (control, experimental)','FontSize',30,'FontName','CMU Serif')

% Make sure legend text is same as tick text size

legend('Direction','normal','Box','off','Color','Blue','FontName','CMU Serif','AutoUpdate','on','FontWeight','bold','BackgroundAlpha',0.56,'Orientation','horizontal')

% Show that the two groups are significantly different 
    % MATLAB - sigstar
%% sigstar package
% as of 10/17/25, i'm not sure yet how this works. I ran out of time this day to work on it
sigstar(dataAvg,'ttest','nosort');




    % Python - YOYO (your own your own)
 
%% Saving
% Save figure in publication format (.pdf)
exportgraphics(e,'barPlotTest.png','Resolution',600);

% dpi = 300 for Python

%% Bonus / Shameless Plug / Flex 
% Save figure in folder of current date/time to stay organized
    % Matlab: https://tulimid1.github.io/savingfigures/MATLAB/
    % Python: https://tulimid1.github.io/savingfigures/Python/

% Put figure making process into a loop and iterate three times to get three publication ready figures
