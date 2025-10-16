% code to generate simulated data for advanced plotting tutorial
% for ReproRehab pod4, week 3 presentation - 10/17/25

% author: ab
% date script created: 10/13/25
% date script last edited: 10/16/25

% plots to cover
    % 1: scatter
    % 2: violin
    % 3: spider
    % 4: forest


%% begin simming data - i'll use generic eeg & motor fx data since i'm most familiar with it

% sim eeg data as coherence ("coh": Nolte et al., 2004, Pascual-Marqui 2007)
% coh on 0-1 range, so will simulate many data coherence data points, one
% per subject. Same with WMFT (Wolf et al., 1970something, i think 74?)

% let's say n=1000 for fun. stroke survivors with UE impairment, went through
% clinical trial for it. no, it's not very realistic to have 1000 stroke
% survivors in a rehab RCT, but let's have some fun with it shall we?

%% coh data
coh = rand(1000,1); % random, between 0 and 1

%% motor data
n=1000;
motor = round(60 + 40*coh + 15*randn(1000,1)); % line from chatGPT. what it does:
    % 1. multiple coh valeus by 40, scaling upwards to increase coh values to better align to WMFT scale
    % 2. adding 60 increases the intercept to 60
    % 3. 15*randn... adds noise to the data so it's not perfectly correlated
    % 4. round() rounds it to nearest integer. this is fine, or could be one decimal place

    % BIG NOTE: this will make a direct relationship between increased coh and WMFT, whcih isn't necessarily true. 
    % this is just for illustration purposes


% get rid of any motor scores <0 or >120 (the scale of WMFT time)
motor(motor < 0) = 0;
motor(motor > 120) = 120;

% add subject info
subject = [1:1000];
subject = transpose(subject);

%% combine data
% horz concatenation!
data = table([coh, motor]); % horz cat into table
data = addvars(data,subject); % add subj to table
data = splitvars(data, 'Var1'); % may have to alter this depending on what matlab version used (2024b vs 2025b)
data = renamevars(data, 'Var1_1', 'coh1');
data = renamevars(data, "Var1_2", 'WMFT time');

%% first plot - scatter

% basic
figure
scatter(coh, motor) % basic scatter between motor & coh data

% labeling
ylabel 'WMFT time (s)';
xlabel 'coherence (a.u.)';

% title
title 'relationship of coherence vs WMFT time'

%% second plot - scatter more complicated with line & padding on either side

fig = figure;
scatter2 = scatter(coh, motor, 'black','MarkerFaceColor','auto','Marker','o');
% labeling
ylabel 'WMFT time (s)';
xlabel 'coherence (a.u.)';
% title
title 'relationship of coherence vs WMFT time'
% regression line
line = lsline; % "least squares line"
set(line,'Color','red','LineWidth',3); % customize the line

% add the p value & r, because we all love stats
r = corr(coh,motor); 
% r^2
mdl = fitlm(data.coh1,data.("WMFT time"));
disp(mdl)

r2 = mdl.Rsquared.Ordinary; % returns 0.3614 with data as of 9am 10/13/25

% add some padding on L & R side of plot
ax = gca; % get current axes (gca)
xLimits = xlim(ax); % xlimits
yLimits = ylim(ax); % ylimits
padding = 0.075 * (xLimits(2) - xLimits(1)); % add padding amt
padding2 = 0.05 * (yLimits(2) - yLimits(1));
% set new axes
xlim(ax, [xLimits(1) - padding, xLimits(2) + padding]); % apply padding to xlim
ylim(ax, [yLimits(1) - padding2, yLimits(2) + padding2]); % apply padding to ylim

%% lets save so looks higher resolution for publication

% exportgraphics(fig,'scatter2.png', 'Resolution', 50); % attempt 1 to show how bad saving can be 
% exportgraphics(fig,'scatter2.png', 'Resolution', 1200); % att 2 to see how good it can

%% add some more data 

% next, we'll add some "data" to simulate different coh values between different brain region pairs
coh2 = rand(1000,1); % "lesioned PM & lesioned M1"
coh3 = rand(1000,1); % "lesioned PM & lesioned SMA"
coh4 = rand(1000,1); % "lesioned SMA & lesioned M1"
coh5 = rand(1000,1); % "lesioned M1 & lesioned S1"

data = addvars(data,coh2,coh3,coh4,coh5); % combine with allData table


%% now onto bigger & better things - let's look at violin pots!
% we're going to use the same dataset as above

figure
x = violin(data.coh1); % right off the bat, this is what it looks like
%%
% update it some - color, transparency for x, add y and overlay it onto x. same with z
figure
x = violin(data.coh1,'facecolor',[0.3, 0.7, 1],'facealpha',0.4); % color = sky-ish blue, lowest opaque-ness
hold on % stack plots on top of each other
y = violin(data.coh2,'facecolor',[1, 0.4, 0.4],'facealpha',0.5);  % red-ish color, medium opaque
z = violin(data.coh3,'facecolor',[1, 0.8, 0.2],'facealpha',0.75); % gold-ish color, most opaque

%% play with the order of layout
% using zorder/children/uistack
uistack(z,'bottom') % gold plot in the back, most opaque
uistack(x,'top') % blue-ish plot, least opaque, up in the front

fontname('CMU Serif')
fontsize(21,'pixels')
title 'brain connectivity, coh1-3'

%% save
fig = gcf; % gcf = get current figure

% exportgraphics(fig,'violinWMFT.png','Resolution',5) % uber low res
% exportgraphics(fig,'violinWMFT.png','Resolution',1200) % over-kill high res
exportgraphics(fig,'violinWMFT.png','Resolution',500) % reasonably high res

%% clear out the old stuff
clear fig line padding r2 r scatter2 subject ax ...
    yLimits xLimits t x y z mdl padding2

%% spider/radar plots

% the spider_plot command doesn't allow tables, so we're going to make a
    % separate array that has only coherence data


% but first, since plotting n=1000 is a mess (run this code below):

%%%%% crazy plot %%%%%%%%%
    % convert to array
% cohData = table2array(data);
    % remove the columns we don't want for now (the subjectID and WMFT time)
% cohData(:,[2,3]) = [];
% radPlot = spider_plot(cohData);
%%%%%% end crazy plot %%%%%%%%%

% now, to get more comprehensible plot, we need to decrease the amt of data
% going into the plot. 
% Let's try something here:
% take random 20 subjects from sample, then we're plotting them in spider.
randIdx = randsample(height(data),10);

dataSpider = data(randIdx,:);
dataSpider = table2array(dataSpider);
dataSpider(:,[2 3]) = [];

% now let's plot with spider
spider = spider_plot(dataSpider);

fig = gcf;
%exportgraphics(fig,'spider.png','Resolution',1200)

%%  3d scatter
% clean up
clear fig randIdx spider
% head back to data table with everything in it

% make fig - 3dscatter
figure
d = scatter3(data.coh1,data.coh2,data.("WMFT time"),36,data.("WMFT time"),'filled'); % add all data (xyz), size of markers,...
% and then what variable i want the colors to be mapped to (WMFT)
colormap autumn % add specific color map
colorbar % add colorbar

% label
xlabel 'coh region pair 1'
ylabel 'coh region pair 2'
zlabel 'WMFT time (s)'

% make scatter dance
% for angle=1:360
%     view(angle,40);
%     pause(0.06);
% end

fig = gcf; % get current fig
% specify angle/azimuth you want to save it as, so the jpg/png can see all three axes. 
view(45,30) % make sure you do this for 3dscatters, otherwise you may nto be able to see all three axes well. 
% play around w the numbers to see what you like most, (45,30) seems to work well. 

savefig('3dScatter.fig') % save as matlab fig for interacting with the 3d-ness of the plot
exportgraphics(fig,'3dScatter.jpg','Resolution',500) % show that you can save as other filetypes, like jpg 
exportgraphics(fig,'3dScatter.png','Resolution',500) % or png 

%% as requested, swarm chart - IN PROGRESS

% create new dataset that'll be easier to vizualize with swarm

% swarm chart is nice when you have multiple arrays
figure
r = [ones(1,300) 2 * ones(1,300) 3 * ones(1,300)];
x1 = 27 * rand(1,300);
x2 = 35 * rand(1,300);
x3 = 40 * rand(1,300);
x = [x1 x2 x3];
swarmchart(r,x)

%% imagesc - kind of like a heat map. pretty basic just to show

imagesc(dataSpider) % plot the relationship between columns and rows within dataset
colormap autumn
colorbar

%exportgraphics(fig,'3dScatter.png','Resolution',1200)

%% forest plot
% fun fact, also called a "blobbogram"

% simulate some fake data that might be in a meta analysis or somethingh
effectSizes = rand(100,1); % generate data, effect size
effectSizes = sort(effectSizes,'descend'); % sort said data
confInts1 = rand(100,1); % generate the conf int (bottom) for it
confInts1 = sort(confInts1,'descend'); % sort
confInts2 = rand(100,1); % generate conf ints (top) for it
confInts2 = sort(confInts2,'descend'); % sort

%% chatGPT's better version of the above code: 

% n
n = 100;

% Sim effect sizes: centered around 0.5 with some noise
effectSizes = 0.5 + 0.2*randn(n,1);  % Normal-ish distribution

% Simulate SE
SEs = 0.05 + 0.05*rand(n,1);  % Between 0.05 and 0.10

% Compute confidence intervals: 95% CI = effect ± 1.96*SE
confIntsLower = effectSizes - 1.96 .* SEs;
confIntsUpper = effectSizes + 1.96 .* SEs;

% Optional: Sort everything by descending effect size
[effectSizes, sortIdx] = sort(effectSizes, 'descend');
confIntsLower = confIntsLower(sortIdx);
confIntsUpper = confIntsUpper(sortIdx);
forestData = table(effectSizes,confIntsLower,confIntsUpper);
forestplot(effectSizes,confIntsLower,confIntsUpper)

%% section taken from tutorial of qi an's forestplot package. all credit to that person in this section.
% difficult one for me to generate on my own, so i used her template to demonstrate.
% this package expects you to be working with odds ratio or relative risk, not
    %  necessarily other types of data, like effect sizes & confidence intervals, such as in meta analysis

response=round(rand(100, 1)); % generate response variable (0,1)
predictor=round(rand(100, 1)); % generate predictor variable (again, 0 or 1)
subgroup=round(rand(100, 3)); % generate which subgroup they were in (1, 2, 3)
forestplot(response, predictor, subgroup, 'stat', 'or'); % plot

fig = gcf;
title 'ORs of treatment response based on subgroups within study'
fontsize(fig,20,"pixels") % change font size
fontname(fig,"CMU Serif") % change font type (the nostalgic math one)
% labels: auto-populates x and y based on forest command. no need to specify

% save
exportgraphics(fig,'forestTemplate.png','Resolution',400)

%% for zorder/children/uistack...
% back to a basic scatter plot to demonstrate
% take our coh data with wmft

% goal: "stack" two scatter plots on top of each other. we'll make them diff colors so
% easy to see. 
figure
scat11 = scatter(data.coh1,data.("WMFT time"),'red','filled','o');
hold on
scat21 = scatter(data.coh2,data.("WMFT time"),'green','filled','o');
scat31 = scatter(data.coh3,data.("WMFT time"),'blue','filled','o');
uistack(scat11,'up',scat31,'bottom')

%% another way to stack: using tiledlayout
figure
tiledlayout(2,1) % can do this for however big of data you want essentially. 
nexttile
scat12 = scatter(data.coh1,data.("WMFT time"),'red','filled','o');
title 'brain connectivity vs WMFT time'
ylabel 'wmft time (s)'
lsline
nexttile
scat22 = scatter(data.coh2,data.("WMFT time"),'green','filled','o');
lsline
xlabel 'coh value'
ylabel 'wmft time (s)'


