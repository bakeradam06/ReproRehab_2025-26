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

% note: used the matlab help section to generate this code. I didn't know
% how to generate an array with specific meawn or sd. now i do!


           % check: 
           x1 = mean(mean(control(:,:))); 
           y1 = mean(std(control(:,:)));


           x = mean(mean(treat(:,:))); % returns mean of means per column
           y = mean(std(treat)); % returns mean of stdev per column

%% Summarize Data


% 1.	Calculate the average walking speed per participant (across trials) for each group
% 2.	Calculate the standard deviation of walking speed per participant (across trials) for each group
% 3.	Calculate the average walking speed per trial (across participants) for each group
% 4.	Calculate the standard deviation of walking speed per trial (across participants) for each group




%% Normality
% 1.	Check to see if the average walking speed per group passes a normality test (Kruski-Wallis?)





%% Comparison
% 1.	Run a t-test (or non-parametric equivalent if wanted / needed) comparing the average walking speed between groups
