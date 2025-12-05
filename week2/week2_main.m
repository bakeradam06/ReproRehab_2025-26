% week2 main


%% Creating some data
% Create a folder with name "Data"
mkdir '/Users/DOB223/Library/CloudStorage/OneDrive-MedicalUniversityofSouthCarolina/Documents/lab/ac/ReproRehab/bootCamp/2week/Data';
mainPath = '/Users/DOB223/Library/CloudStorage/OneDrive-MedicalUniversityofSouthCarolina/Documents/lab/ac/ReproRehab/bootCamp/2week/Data';
cd(mainPath)

% Within the "Data" folder, add two folders: "Subject 1" & "Subject 2"
mkdir subject1
mkdir subject2

% for rest of section: i had to use matlab copilot to help me with this. primarily the command for making isSubj variable.
% i explain these tasks in comments to ensure i understand all that's happening.

temp_nSubj = dir(fullfile(pwd,'*')); % create struct, and struct.name contains list of subjects plus two extra entries ('.' and '..')
isSubj = [temp_nSubj.isdir] & ~ismember({temp_nSubj.name},{'.','..'}); % get logical array of which entry includes subject names, exclude the dots
nSubj = sum(isSubj); % return count of how many subjects present as "1" in above logical array (2). 

%% Within each "Subject X", add two files: data.csv and info.txt
% cd subject1
data = [1,2,3,4,5];
testInfo = "this is a test file for ReproRehab week2 assignment";

% add files, and a few numbers, separated by commas in each data.csv (e.g., 1,2,3)


cd subject1/ % get to subject1 folder 
write(data, testInfo);
cd ..

cd subject2/ % with this and above line, get to subject2
write(data, testInfo);
cd ..

% --------------- % 
% create function for above steps
function write(data, testInfo)
    writematrix(data, 'data.csv');
    writelines(testInfo, 'info.txt');
end
% --------------- % 



%% create struct containing contents of /Data
pathStruct = dir(mainPath); 


% get contents from struct that are (1) isDir and (2) starts with 
subjDirs = contents([pathStruct.isdir] & startsWith({pathStruct.name},'subject')); 
    % subject, as noted in the struct. Returns new struct.
% construct both subject paths, so then we can loop through them and do operations
subjPaths = fullfile(basePath,{subjDirs.name});

%% use subjPaths contents to loop through and complete operation
for i=1:length(subjPaths)
    cd(subjPaths{i}) % nav to subject folder. uses i to index value of subjPaths cell array
    data = readmatrix('data.csv'); % load data.csv within folder
    data = data([1 2 3]); % change contents
    writematrix(data,'data.csv'); % save changes
    % Add name to info.txt (e.g., Dan)
    txtFile = readlines('info.txt');
    if i == 1
        txtFile = 'my name is Harry';
    else 
        txtFile = 'my name is Potter';
    end
    writelines(txtFile,'info.txt');
end


% Make sure numbers and names are unique to subject

cd ..
cd ..
cd ..

%% Script
% Write a loop that iterates through all folders in the "Data" folder

dirContent = dir("Data");

for i=1:length(dirContent)
    disp("I would be doing something here but Adam told me not to")
end


% Write a nested loop that iterates through all "Subject X" folders
cd /Data

% for i:length(dirContent)
%     for 
% 
%     end
% end


% Write code to load the data from data.csv and info.txt and print the results


% Store the data as a dict (Python) / struct (MATLAB), where data from info is key and data 
% from data is value (e.g., Dan: [1,2,3])


% Add another subject folder and verify that everything works and new data is added. 
    % The goal here is to not have to modify the script every time a new subject is added


% MATLAB only: pre-allocate an array to hold your data










%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% week 2 pod meeting notes %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dir() for parsing through folder in matlab
%   matlab equivalent is string.startsWith


%%
tic
dataWo = [];
for i = 1:10000000000
    dataWo(i) = i^2;
end
toc

%% 
tic 
dataW = zeros(1,10000000000);
for i = 1:10000000000
    dataw(i) = i^2;
end
toc
