% week 3

 
%% gen control data
    % Create a variable called "Control" and set to 10 random values uniformly distributed between 0 and 3 
    % ref: RandomNumbersWithinSpecifiedInterval.mlx matlab file
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
    e = bar(dataAvg,'green'); % note: had some help from chatGPT with below next few lines for syntax of making plots. 
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
%% sigstar package (matlab add on. add significance stars to a plot)
    %addpath('/Users/DOB223/Library/CloudStorage/OneDrive-MedicalUniversityofSouthCarolina/Documents/MATLAB/sigstar')
    
    % note: ai helped a little with the syntax/process of getting sigstar to work. most of it was syntax suggetsions 
    % and what arguments to use.
    
    % need figure first,
    % run t test,
    % use sigstar to add significance stars to bar chart.
    
    % combine data 
    dataAll = [experimental,control];
    
    figure
    plot1 = bar(dataAll); % make bar figure of dataset
    [h,p,ci] = ttest2(dataAll(:,1),dataAll(:,2)); % two sample t test, default settings
    sigstar({[1,2]},p) % add significance stars to plot. p argument is from ttest2 output.
    ax = gca;
    plot1 = gca;
 
%% Saving
% Save figure in publication format (.pdf)
exportgraphics(e,'barPlotTest.png','Resolution',600);

%% Bonus
% Save figure in folder of current date/time to stay organized
% Matlab: https://tulimid1.github.io/savingfigures/MATLAB/ 
% (Jesse: this is my TAs github repo he put in here as an example). 

    % get date as variable
    dateNow = datestr(now,'yyyy-mm-dd-HHMMSS');
    testPlottingNaming = fullfile(['testBarChart_' dateNow '.png']);

    exportgraphics(gca,'testBarChart.png','Resolution',100)
    exportgraphics(gca,'testBarChart2.png','Resolution',1500) % overkill for dpi just to compare to first one

%% Put figure making process into a loop and iterate three times to get three publication ready figures

    figure
    bar2 = barh(dataAll); % changed to horz bar to distinguish the two from above
%%    
    for i=1:3
        if i == 1
            tempPlot = violin(dataAll);
            fig = gcf;
            exportgraphics(fig,['testViolinAllData' (i) '.png'],'Resolution', 600);
        end
        if i == 2 || 3
            tempPlot = violin(data(:,i));
            fig = gcf;
            exportgraphics(fig,['testViolin' (i) '.png'],'Resolution', 600);
        end
    end
