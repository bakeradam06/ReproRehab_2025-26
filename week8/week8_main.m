%% week 8 main
 
 
%% Data
% 1.	Generate two sets of data (2D matrices) that will represent the control and test groups walking speed
    % a.	The control group has 21 participants and completed 100 trials each
            control = zeros(100,21);
            treat = zeros(100,21);

        % i.	Generate with normal random, mean of 7, standard deviation of 1.2
            muControl = 7;
            sigmaControl = 1.2;
            control = sigmaControl.*randn(100,21) + muControl; 

    % b.	The test group has 17 participants and completed 100 trials each 
        % i.	Generate with normal random, mean of 3, standard deviation of 5

            muTreat = 3;
            sigmaTreat = 5;
            treat = sigmaTreat.*randn(100,21) + muTreat;
            % ref: matlab help section. I didn't know
            % how to generate an array with specific meawn or sd. now i do.

           % check: 
           x1 = mean(mean(control(:,:))); 
           y1 = mean(std(control(:,:)));


           x = mean(mean(treat(:,:))); % returns mean of means per column
           y = mean(std(treat)); % returns mean of stdev per column

%% Summarize

% 1.	Calculate the average walking speed per participant (across trials) for each group
        meanByPtCntrl = [ ];
        for col = 1:width(control)
            meanTemp = mean(control(:,col));
            meanByPtCntrl = vertcat(meanByPtCntrl,meanTemp);
        end

        meanByPtTrt = [ ];
        for col = 1:width(treat)
            meanTemp = mean(treat(:,col));
            meanByPtTrt = vertcat(meanByPtTrt,meanTemp);
        end

        % returns 21x1 array of means by column (avging across trials by participant)

%% 2.	Calculate the standard deviation of walking speed per participant (across trials) for each group
        stdByPtCntrl = [ ];
        for col = 1:width(control)
            stdTemp = std(control(:,col));
            stdByPtCntrl = vertcat(stdByPtCntrl,stdTemp);
        end
        
        stdByPtTrt = [ ];
        for col = 1:width(treat)
            stdTemp = std(treat(:,col));
            stdByPtTrt = vertcat(stdByPtTrt,stdTemp);
        end

%% 3.	Calculate the average walking speed per trial (across participants) for each group
        meanControl = mean(control);
        meanTreat = mean(treat); % returns 1x21 array of means across pts by trial


%% 4.	Calculate the standard deviation of walking speed per trial (across participants) for each group
        sdControl = std(control);
        sdTreat = std(treat); % returns 1x21 array of sd's

%% Normality
% 1.	Check to see if the average walking speed per group passes a normality test (Kruski-Wallis?)
        
        normCntrl = kruskalwallis(control);
        normTreat = kruskalwallis(treat);

        % check visually
        histogram(control,15,'FaceColor','r')
        hold on
        histogram(treat,15,'FaceColor','b')

        % result: only treatment group is normal. control is abnormal.

%% Comparison
% 1.	Run a t-test (or non-parametric equivalent if wanted / needed) comparing the average walking speed between groups
        
        % parametric
        [h,p,ci, stats] = ttest2(meanControl, meanTreat,"Alpha",0.05,"Tail","both");

        % non parametric - wilcoxon rank sum - if these data were not
        % normally distributed 
        [p2, h2, stat] = ranksum(meanControl, meanTreat, "Alpha", 0.05, "Tail","both");
       

