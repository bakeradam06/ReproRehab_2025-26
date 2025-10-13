% code to generate simulated data for advanced plotting tutorial
% for ReproRehab pod4, week 3 presentation - 10/17/25

% author: ab
% date script created: 10/13/25
% date script last edited: 10/13/25

% plots to cover
    % 1: scatter
    % 2: box
    % 3: violin
    % 4: forest
    % 5: spider


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

% exportgraphics(fig,'scatter2.png', 'Resolution', 50); % attempt 1 to show how bad it can be 
% exportgraphics(fig,'scatter2.png', 'Resolution', 1200); % att 2 to see how good it can get

%% now onto bigger & better things - let's look at violin pots!
% we're going to use the same dataset as above

figure
x = violin(data.coh1,'facecolor',[0.5 1 0],'facealpha',0.25); % right off the bat, this is what it looks like

figure
y = violin(data.coh1,'facecolor',[0.5 1 0]); % update the color some

figure 
z = violin(data.coh1,'facecolor',[0.5 1 0],'facealpha',0.25); % now add some transparency

% look at the WFMT scores.. 
figure 
t = violin(data.("WMFT time")); % basic, no fancy things like above..

%% save
fig = gcf; % gcf = get current figure

% exportgraphics(fig,'violinWMFT.png','Resolution',50) % uber low res
% exportgraphics(fig,'violinWMFT.png','Resolution',1200) % uber high res (might take a couple min to save)

%% clear out the old stuff
clear coh coh2 coh3 coh4 coh5 fig line padding r2 r scatter2 subject ax ...
    yLimits xLimits t x y z mdl padding2

%% spider/radar plots

% let's add some layers of data. We need more coh data for a spider
% first, assume the preivous coh data is between bilateral M1's. 

% next, we'll add some "data" to simulate different coh values between different brain region pairs
coh2 = rand(1000,1); % "lesioned PM & lesioned M1"
coh3 = rand(1000,1); % "lesioned PM & lesioned SMA"
coh4 = rand(1000,1); % "lesioned SMA & lesioned M1"
coh5 = rand(1000,1); % "lesioned M1 & lesioned S1"

data = addvars(data,coh2,coh3,coh4,coh5); % combine with allData table

%% start plotting
% the spider_plot command doesn't allow tables, so we're going to make a
    % separate array that has only coherence data


% but first, since plotting n=1000 is a mess (run this code below):

%%%%% crazy plot %%%%%%%%%
    % convert to array
% cohData = table2array(data);
    % remove the columns we don't want for now (the subjectID and WMFT time)
% cohData(:,[2,3]) = [];
    %% good luck interpreting this one - hello skittles
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
exportgraphics(fig,'spider.png','Resolution',1200)





